const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

// mix.js('resources/js/app.js', 'public/js/app.js');

// mix.sass('resources/sass/app.scss', 'public/css');
// mix.sass('resources/sass/app.rtl.scss', 'public/css');

// .sass('resources/fonts/fawesome/scss/all.scss', 'public/assets/custom/css/fontawesome.css')
// .sass('resources/sass/styles/helpers/animate.scss', 'public/assets/custom/css/animate.css')


mix.sass('resources/sass/styles/helpers/normalize.scss', 'public/assets/css/custom/normalize.css')
    .sass('resources/sass/dimensions.scss', 'public/assets/css/custom/dimensions.css')
    .sass('resources/sass/rotations.scss', 'public/assets/css/custom/rotations.css')
    .sass('resources/sass/common.scss', 'public/assets/css/custom/common.css')
    .sass('resources/sass/defaults.scss', 'public/assets/css/custom/defaults.css')
    .sass('resources/sass/main.scss', 'public/assets/css/custom/main.css')
    .sass('resources/sass/medias.scss', 'public/assets/css/custom/responsive.css');

mix.options({processCssUrls: false});

/* Combine CSS */
mix.combine([
    // 'public/css/app.css',
    'public/assets/bootstrap/css/bootstrap.min.css',
    'public/assets/plugins/select2/css/select2.min.css',
    'public/assets/plugins/tag-it/css/jquery.tagit.css',
    'public/assets/plugins/tag-it/css/tagit.ui-zendesk.css',
    'public/assets/css/style.css',
    'public/assets/css/style-main.css',
    'public/assets/css/skins/skin-blue.css',
    'public/assets/css/skins/skin-green.css',
    'public/assets/css/skins/skin-red.css',
    'public/assets/css/skins/skin-yellow.css',
    'public/assets/plugins/owlcarousel/assets/owl.carousel.min.css',
    'public/assets/plugins/owlcarousel/assets/owl.theme.default.min.css',
    'public/assets/css/flags/flags.min.css'
], 'public/css/app.css');

/* Combine RTL CSS */
// mix.combine([
//     'public/css/app.rtl.css',
//     'public/assets/bootstrap/css/bootstrap.rtl.css',
//     'public/assets/plugins/select2/css/select2.min.css',
//     'public/assets/plugins/tag-it/css/jquery.tagit.css',
//     'public/assets/plugins/tag-it/css/tagit.ui-zendesk.css',
//     'public/assets/css/rtl/style.css',
//     'public/assets/css/rtl/style-main.css',
//     'public/assets/css/skins/skin-blue.css',
//     'public/assets/css/skins/skin-green.css',
//     'public/assets/css/skins/skin-red.css',
//     'public/assets/css/skins/skin-yellow.css',
//     'public/assets/plugins/owlcarousel/assets/owl.carousel.min.css',
//     'public/assets/plugins/owlcarousel/assets/owl.theme.default.min.css',
//     'public/assets/css/flags/flags.min.css'
// ], 'public/css/app.rtl.css');

/* Combine JS */
mix.combine([
    'public/assets/js/jquery/1.11.1/jquery.min.js',
    'public/assets/plugins/jqueryui/1.9.2/jquery-ui.min.js',
    /* 'public/assets/js/popper.min.js', */
    /* 'public/assets/bootstrap/js/bootstrap.min.js', */
    /* Bundled JS files (bootstrap.bundle.js and minified bootstrap.bundle.min.js) include Popper, but not jQuery. */
    'public/assets/bootstrap/js/bootstrap.bundle.min.js',
    // 'public/js/app.js',
    'public/assets/js/jquery.matchHeight-min.js',
    'public/assets/plugins/jquery.fs.scroller/jquery.fs.scroller.min.js',
    'public/assets/plugins/select2/js/select2.full.min.js',
    'public/assets/plugins/SocialShare/SocialShare.min.js',
    'public/assets/js/jquery.parallax-1.1.js',
    'public/assets/js/hideMaxListItem-min.js',
    'public/assets/plugins/jquery-nice-select/js/jquery.nice-select.min.js',
    'public/assets/plugins/jquery.nicescroll/dist/jquery.nicescroll.min.js',
    'public/assets/plugins/owlcarousel/owl.carousel.js',
    'public/assets/js/script.js',
    'public/assets/plugins/autocomplete/jquery.mockjax.js',
    'public/assets/plugins/autocomplete/jquery.autocomplete.min.js',
    'public/assets/js/app/autocomplete.cities.js',
    'public/assets/plugins/tag-it/js/tag-it.min.js',
    'public/assets/plugins/bootstrap-waitingfor/bootstrap-waitingfor.min.js',

    'public/assets/js/form-validation.js',
    'public/assets/js/app/show.phone.js',
    'public/assets/js/app/make.favorite.js'
], 'public/js/app.js');

/* Disable Compilation Notification */
/* mix.disableNotifications(); */

/* Cache Busting */
mix.version();
