let express = require('express'),
  path = require('path'),
  favicon = require('serve-favicon'),
  logger = require('morgan'),
  cookieParser = require('cookie-parser'),
  bodyParser = require('body-parser'),
  sassMiddleware = require('node-sass-middleware'),
  i18n = require('i18n'),
  hbs = require('hbs'),
  hbsutils = require('hbs-utils')(hbs),
  root_url = require('./routes/root'),
  legal = require('./routes/legal'),
  sponsors = require('./routes/sponsors'),
  locations = require('./routes/locations'),
  registration = require('./routes/registration'),
  login = require('./routes/events'),
  events = require('./routes/events'),
  about = require('./routes/about'),
  contact = require('./routes/contact'),
  thankyou = require('./routes/thankyou'),
  profiles = require('./routes/profiles'),
  nav = require(path.join(__dirname, 'helpers', 'nav')),
  footer = require(path.join(__dirname, 'helpers', 'footer'));

let app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');
hbsutils.registerWatchedPartials(__dirname + '/views/partials');

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(cookieParser());
app.use(sassMiddleware({
  src: path.join(__dirname, 'public'),
  dest: path.join(__dirname, 'public'),
  indentedSyntax: false, // true = .sass and false = .scss
  sourceMap: true
}));

app.use(express.static(path.join(__dirname, 'public')));

// int'l support
i18n.configure({
  locales: ['en', 'ko-kr'],
  defaultLocale: 'en',
  directory: __dirname + "/config/locales",
  api: {
    '__': 't',  //now req.__ becomes req.t
    '__n': 'tn' //and req.__n can be called as req.tn
  }
});
app.use(i18n.init);

app.get('/', root_url.index);
app.get('/privacy', legal.privacy);
app.get('/terms-of-service', legal.tos);
app.get('/events', events.index);
app.get('/events/:id', events.show);
app.post('/events/:id', events.order);
app.get('/locations', locations.index);
app.get('/registration', registration.index);
app.get('/login', login.index);
app.get('/profiles', profiles.index);
app.get('/profiles/:id', profiles.show);
app.get('/sponsors', sponsors.index);
app.get('/contact', contact.index);
app.get('/thankyou', thankyou.index);
app.post('/contact', contact.post);
app.get('/about', about.index);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  let err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  if (err.status === 404) {
    res.render('404', {
      error_message: err,
      error: {
        title: req.t('error.title'),
        content: req.t('error.content'),
        back_url: req.t('error.back_url'),
        back_url_text: req.t('error.back_url_text'),
        server_message_title: req.t('error.server_message_title'),
      },
      nav: nav(req),
      footer: footer(req),
      logo_alt: req.t("logo_alt"),
      title: req.t('title'),
      lang: i18n.getLocale(req),
      sign_in: req.t('sign_in'),
      register: req.t('register'),
    });
  } else {
    res.render('error', {
      message: res.locals.message
    });
  }
});

module.exports = app;
