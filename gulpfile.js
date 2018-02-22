var gulp = require('gulp');
var sass = require('gulp-sass');
var convertEncoding = require('gulp-convert-encoding');
var replace = require('gulp-replace');

gulp.task('default', function(){
    gulp.src('./src/app.scss')
    .pipe(sass({style : 'nested'})) //o—ÍŒ`®‚Ìí—Ş@#nested, compact, compressed, expanded.
    .pipe(replace('UTF-8', 'shift_jis'))
    .pipe(convertEncoding({to: "shift_jis"}))
    .pipe(gulp.dest('./dist/'));
});

