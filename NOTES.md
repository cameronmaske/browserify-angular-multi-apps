fig run client npm run install

fig run client browserify --debug -t coffeeify --extension='.coffee' app1/app1.coffee -o public/app1.js

fig run client karma start tests/config.coffee

gulp.task 'browserify-app1', ->
    browserify({
        entries: ['./app1/app1.coffee']
        extensions: ['.coffee']})
        .bundle({debug: true})
        .on('error', gutil.log)
        .pipe(source('app1.js'))
        .pipe(gulp.dest('./public/'))


gulp.task 'browserify-app2', ->
    browserify({
        entries: ['./app2/app2.coffee']
        extensions: ['.coffee']})
        .bundle({debug: true})
        .on('error', gutil.log)
        .pipe(source('app2.js'))
        .pipe(gulp.dest('./public/'))
