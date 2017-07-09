'use strict';

let watchify = require('watchify');
let browserify = require('browserify');
let gulp = require('gulp');
let source = require('vinyl-source-stream');
let buffer = require('vinyl-buffer');
let gutil = require('gulp-util');
let sourcemaps = require('gulp-sourcemaps');
let assign = require('lodash.assign');
let path = require('path');
let gls = require('gulp-live-server');
let wrap = require('gulp-wrap');
let concat = require('gulp-concat');
let declare = require('gulp-declare');
let handlebars = require('gulp-handlebars');

// add custom browserify options here
let browserifyOpts = {
  entries: [
    './node_modules/jquery-deparam/jquery-deparam.js',
    './node_modules/pubsub-js/src/pubsub.js',
    './node_modules/j-toker/src/j-toker.js'
  ],
  debug: true
};
let opts = assign({}, watchify.args, browserifyOpts);
let b = watchify(browserify(opts));

// add transformations here
// i.e. b.transform(coffeeify);

gulp.task('js', bundle); // so you can run `gulp js` to build the file
b.on('update', bundle); // on any dep update, runs the bundler
b.on('log', gutil.log); // output build logs to terminal

function bundle() {
  return b.bundle()
    // log errors if they happen
    .on('error', gutil.log.bind(gutil, 'Browserify Error'))
    .pipe(source('bundle.js'))
    // optional, remove if you don't need to buffer file contents
    .pipe(buffer())
    // optional, remove if you dont want sourcemaps
    .pipe(sourcemaps.init({loadMaps: true})) // loads map from browserify file
    // Add transformation tasks to the pipeline here.
    .pipe(sourcemaps.write('./')) // writes .map file
    .pipe(gulp.dest('./dist'));
}

gulp.task('serve', function() {
  //1. run your script as a server 
  let server = gls.new('./app.js');
  server.start();

  // //2. run script with cwd args, e.g. the harmony flag
  // let server = gls.new(['--harmony', 'myapp.js']);
  //this will achieve `node --harmony myapp.js` 
  //you can access cwd args in `myapp.js` via `process.argv` 
  server.start();

  //use gulp.watch to trigger server actions(notify, start or stop) 
  gulp.watch(['./public/stylesheets/*.scss', './views/**/*.hbs'], function (file) {
    server.notify.apply(server, [file]);
  });

  gulp.watch('app.js', server.start.bind(server)); //restart my server

  // // Note: try wrapping in a function if getting an error like `TypeError: Bad argument at TypeError (native) at ChildProcess.spawn`
  // gulp.watch('myapp.js', function() {
  //   server.start.bind(server)()
  // });
});

gulp.task('templates', function() {
  // Load templates from the templates/ folder relative to where gulp was executed
  gulp.src('views/**/*.hbs')
    // Compile each Handlebars template source file to a template function
    .pipe(handlebars())
    // Wrap each template function in a call to Handlebars.template
    .pipe(wrap('Handlebars.template(<%= contents %>)'))
    // Declare template functions as properties and sub-properties of exports
    .pipe(declare({
      root: 'exports',
      noRedeclare: true, // Avoid duplicate declarations
      processName: function(filePath) {
        // Allow nesting based on path using gulp-declare's processNameByPath()
        // You can remove this option completely if you aren't using nested folders
        // Drop the templates/ folder from the namespace path by removing it from the filePath
        return declare.processNameByPath(filePath.replace('templates/', ''));
      }
    }))
    .pipe(wrap('Handlebars.registerPartial(<%= processPartialName(file.relative) %>, Handlebars.template(<%= contents %>));', {}, {
      imports: {
        processPartialName: function(fileName) {
          // Strip the extension and the underscore
          // Escape the output with JSON.stringify
          return JSON.stringify(path.basename(fileName, '.js').substr(1));
        }
      }
    }))
    // Concatenate down to a single file
    .pipe(concat('index.js'))
    // Add the Handlebars module in the final output
    .pipe(wrap('var Handlebars = require("handlebars");\n <%= contents %>'))
    // WRite the output into the templates folder
    .pipe(gulp.dest('dist/'));
});
