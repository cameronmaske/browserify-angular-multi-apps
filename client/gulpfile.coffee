gulp = require 'gulp'
gutil = require 'gulp-util'

browserify = require 'browserify'
source = require 'vinyl-source-stream'

html2js = require 'gulp-ng-html2js'
concat = require 'gulp-concat'

connect = require 'connect'
http = require 'http'

plumber = require('gulp-plumber');

# Taken from https://github.com/gulpjs/gulp/issues/369
watchify = require('watchify')

gulp.task 'watch-app1', ->
    watcher = watchify({
        entries: ['./app1/app1.coffee']
        extensions: ['.coffee']})

    bundle = (args) ->
        watcher
            .bundle({debug: true})
            .on('error', gutil.log)
            .pipe(source('app1.js'))
            .pipe(gulp.dest('./public/'))

    watcher.on('update', bundle)
    watcher.on('log', gutil.log)

    return bundle()

gulp.task 'watch-app2', ->
    watcher = watchify({
        entries: ['./app2/app2.coffee']
        extensions: ['.coffee']})

    bundle = (args) ->
        watcher
            .bundle({debug: true})
            .on('error', gutil.log)
            .pipe(source('app2.js'))
            .pipe(gulp.dest('./public/'))

    watcher.on('update', bundle)
    watcher.on('log', gutil.log)

    return bundle()

gulp.task 'serve', ->
    app = connect()
        .use(connect.logger('dev'))
        .use(connect.static('./public'))
    http.createServer(app).listen(8080)

# Watchs for any changes and runs the required tasks.
gulp.task 'watch', ->
    # Watch template files.
    gulp.watch("templates/**/*.template", ['html2js'])

# Turns .template files in /client into a single templates.js
gulp.task 'html2js', ->
    gulp.src("templates/**/*.template")
        .pipe(plumber())
        .pipe(html2js({
            moduleName:'ngTemplates'
            rename: (url) -> url.split('/').pop()}))
        .pipe(concat('templates.js'))
        .pipe(gulp.dest("./public"))


gulp.task('default', ['watch-app1', 'watch-app2', 'html2js', 'serve'])