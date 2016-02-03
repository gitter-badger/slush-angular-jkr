# A Angular JS project

[![Join the chat at https://gitter.im/jesse1983/slush-angular-jkr](https://badges.gitter.im/jesse1983/slush-angular-jkr.svg)](https://gitter.im/jesse1983/slush-angular-jkr?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

# Get Started
To generate a new project:
```shell
npm install -g slush slush-angular-jkr
slush angular-jkr
```
## After generate a new project
```shell
npm install
bower update
gulp
```
Run a webserver (open a new terminal tab):
```shell
gulp server
```

Watch changes (open a new terminal tab):
```shell
gulp watch
```
Test Server (open a new terminal tab):
```shell
gulp test
```

## Building your project
Generate folder `build`:
```shell
gulp build
```
Browsing:
```shell
gulp server-build
```

# Requirements
- Ruby & Ruby on Rails (Language and powerfull framework)
- NodeJS (Javascript runtime server)
- Bower (Node module for manage dependencies)
- Gulp (Node module for task automation)
- Jade (Language extension for html)
- Sass (Language extension for css)
- Coffeescript (Language extension for js)
- Karma (testing runner)
- Jasmine (testing language)

## Installing on Windows
Recommend to use **Cmder** instead **Windows Command Line**: http://cmder.net/

- Install **Ruby on Rails** and Utilities: http://www.railsinstaller.org/pt-BR
- Install **Node**: https://nodejs.org/en/
- Install **Sass**: `gem install sass`
- Install **Jade**: `gem install jade`
- Install **All node modules**: `npm install -g bower gulp karma jasmine coffee-script node-gyp`

## Installing on OSX

- Install **Homebrew**: `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- Install **RVM**: `brew install rvm`
- Install **Node**: `brew install node`
- Install **GIT**: `brew install git`
- Install **Ruby**: `rmv install ruby 2.2.0`
- Install **Rails**: `gem install rails`
- Install **Sass**: `gem install sass`
- Install **Jade**: `gem install jade`
- Install **All node modules**: `npm install -g bower gulp karma jasmine coffee-script node-gyp`
