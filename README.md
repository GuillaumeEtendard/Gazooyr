# Gazooy

### Installation

**`Gazooy requires [imagemagick](http://imagemagick.org/) to run.`**

https://github.com/rmagick/rmagick/issues/256


Install imagemagick and the dependencies and start the server.

Mac OS X : 
```sh
brew install imagemagick  <- for other dependencies package
brew install imagemagick@6  <- for rmagick
brew unlink imagemagick
brew link imagemagick@6 --force
bundle install
```