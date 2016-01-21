gulp =        require 'gulp'
webserver =   require 'gulp-webserver'
gutil =       require 'gulp-util'
coffee =      require 'gulp-coffee'
jade =        require 'gulp-jade'
sass =        require 'gulp-sass'
del =         require 'del'
flatten =     require 'gulp-flatten'
replace =     require 'gulp-replace'
runSequence = require 'run-sequence'
sourcemaps =  require 'gulp-sourcemaps'
uglify =      require 'gulp-uglify'
usemin =      require 'gulp-usemin'
minifyHtml =  require 'gulp-minify-html'
minifyCss =   require 'gulp-minify-css'
rev =         require 'gulp-rev'
imageop =     require 'gulp-image-optimization'
watch =       require 'gulp-watch'
plumber =     require 'gulp-plumber'
bower =       require 'bower'
Karma =       require('karma').Server



###
# Webserver
###
gulp.task 'server', ->
	gulp
		.src('./dist')
		.pipe webserver
			livereload: true
			localhost: "localhost"
			port: 8081
			open: true
			fallback: "dist/index.html"

###
# Webserver for build app
###
gulp.task 'server-build', ->
	gulp
		.src('./build')
		.pipe webserver
			localhost: "localhost"
			port: 8082
			open: true
			fallback: "build/index.html"

###
Coffee task
###
gulp.task 'coffee', (callback)->
	gulp
		.src(['./app/**/*.coffee'])
		.pipe plumber(errorHandler: -> gutil.beep())
		.pipe(sourcemaps.init())
		.pipe(coffee(bare: true))
		.pipe(uglify(mangle:false,compress:true))
		.pipe(sourcemaps.write())
		.pipe gulp.dest('./dist')

###
Jade task
###
gulp.task 'jade', ->
	gulp
		.src(['./app/**/*.jade'])
		.pipe plumber(errorHandler: -> gutil.beep())
		.pipe(
			jade(pretty:true).on('error', gutil.log)
		)
		.pipe gulp.dest('./dist')

###
Sass task
###
gulp.task 'sass', ->
	gulp
		.src('./app/**/*.sass')
		.pipe plumber(errorHandler: -> gutil.beep())
		.pipe sass().on('error', gutil.log)
		.pipe gulp.dest('./dist')

###
Images copy task
###
gulp.task 'images', ->
	gulp
		.src './app/assets/images/**/*.+(jpg|jpeg|gif|png|)'
		.pipe gulp.dest('./dist/assets/images/')


###
Watching changes
###
gulp.task 'watch', (cb)->
	watch ["./app/**/*.coffee",'!./app/**/*.spec.coffee'], -> gulp.start 'coffee'
	watch "./app/**/*.jade", -> gulp.start 'jade'
	watch "./app/**/*.sass", -> gulp.start 'sass'

###
Clean build and dist folders
###
gulp.task 'clean', ->
	del(['./dist','./build'])

###
Bower
###
gulp.task 'bower', (done)->
	bower.commands.install([], {save: true}, {})
		.on 'end', (installed)-> done(); return;
	return


###
Copy to build
###
gulp.task 'copy', (done)->
	del('./build')
	gulp
		.src(['./dist/**/*.+(jpg|jpeg|gif|png|html|htm|ico|ttf|woff|eof|svg)', '!./dist/{lib,lib/**}'])
		.pipe gulp.dest('./build')
	gulp
		.src('./dist/lib/**/fonts/*.{ttf,woff,eof,svg}')
		.pipe flatten()
		.pipe gulp.dest('./build/assets/fonts')



###
Usemin (minification and concat all css and js)
###
gulp.task 'usemin', (done)->
	gulp
		.src("./dist/index.html")
		.pipe usemin
			css: [ replace("url('../fonts/","url('assets/fonts/"), minifyCss({keepSpecialComments: 0}), rev() ]
			html: [ minifyHtml({ collapseWhitespace: true,removeAttributeQuotes: false}) ]
			js: [ uglify({mangle:false}), rev() ]
		.pipe gulp.dest('build/')

###
Images
###
gulp.task 'imagemin', (done) ->
	gulp
		.src './build/**/*.+(jpg|jpeg|gif|png|)'
		.pipe imageop
			optimizationLevel: 5
			progressive: true
			interlaced: true
		.pipe gulp.dest('./build')
		.on 'end', done
		.on 'error', done
	return

###
Unit tests
###
gulp.task 'test', (done)->
	new Karma(
		configFile: __dirname + '/karma.conf.coffee'
		singleRun: true
	, done).start()

###
Group tasks
###
gulp.task 'default', (callback)->
	runSequence 'clean', ['bower','jade','coffee','sass','images'], callback

gulp.task 'build', (callback)->
	runSequence 'default', 'copy','usemin','imagemin', callback
