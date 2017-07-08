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