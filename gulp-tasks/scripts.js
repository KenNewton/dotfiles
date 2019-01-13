var project = require('./_project.js');
var gulp    = require('gulp');
var pump    = require('pump');

gulp.task('copy3', function () {
  gulp.src('./src')
      .pipe(gulp.dest('./dist'));
});