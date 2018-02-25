var gulp = require('gulp');
    sass = require('gulp-sass');
    convertEncoding = require('gulp-convert-encoding');
    replace = require('gulp-replace');
    minimist = require('minimist');

var argv = minimist(process.argv.slice(2));

gulp.task('default', function(){
    gulp.src('./src/app.scss')
    .pipe(sass({style : 'nested'}))
    .pipe(replace('UTF-8', 'shift_jis'))
    .pipe(convertEncoding({to: "shift_jis"}))
    .pipe(gulp.dest('./dist/'));
});
