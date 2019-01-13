var gulp  = require('gulp');


/**
  Our gulp tasks live in their own files,
  for the sake of clarity.

require('require-dir')('./gulp-tasks'); */
var os = require('os'),
    path = require('path');
var homeDir = os.homedir();
var distDir = './dist/';
var srcDir = './src/.*';

gulp.task('copy', function (done) {
    gulp.src(srcDir)
    .pipe(gulp.dest(homeDir, { "base" : homeDir }));
    done();
});

gulp.task('copy2', function (done) {
  gulp.src('./src/**/*')
  .pipe(gulp.dest('.', { "base" : "." }));
  done();

});





gulp.task('collect', function(done){



        console.log(os.homedir())



        done();

});