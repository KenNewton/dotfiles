var gulp  = require('gulp');

var os = require('os'),
    path = require('path');
var homeDir = os.homedir();
var distDir = './dist/';
var srcDir = './src/.*';

gulp.task('copy', function (done) {
    gulp.src(srcDir)
    .pipe(gulp.dest(distDir));
    done();
});