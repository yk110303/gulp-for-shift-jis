var gulp = require('gulp');
var sass = require('gulp-sass');

gulp.task('sass', function(){
    gulp.src('./src/*.scss')
    .pipe(sass({style : 'nested'})) //o—ÍŒ`®‚Ìí—Ş@#nested, compact, compressed, expanded.
    .pipe(gulp.dest('./dist'));
});