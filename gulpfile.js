var gulp = require('gulp');
var sass = require('gulp-sass');

gulp.task('sass', function(){
    gulp.src('./src/*.scss')
    .pipe(sass({style : 'nested'})) //出力形式の種類　#nested, compact, compressed, expanded.
    .pipe(gulp.dest('./dist'));
});