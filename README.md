# phrase-droid [![Code Climate](https://codeclimate.com/github/maveonair/phrase-droid.png)](https://codeclimate.com/github/maveonair/phrase-droid) [![Travis](https://api.travis-ci.org/maveonair/phrase-droid.svg)](https://api.travis-ci.org/maveonair/phrase-droid.svg)

Push and Pull your PhraseApp translations for Android

## Install
```
gem install phrase-droid
```

## Examples
### Initialization
Before you can pull or push any translations you have to create the configuration in your Android Project.

The ```init``` command expects your PhraseApp auth token as the first parameter. Moreover, you can specify the resources directory of your Android Project with the ```-d``` or ```--reouces-path``` flag.

```
$ cd Code/your-awesome-project
$ phrase-droid init 215feb1e550bb1af97e9f54afd839346 -d app/src/main/res
```

### Pull && Push
With your configuration in place, you can pull and push the translations to PhraseApp:

___Download all translations (Android String XML) for all existing locales in your PhraseApp project.___
```
$ cd Code/your-awesome-project
$ phrase-droid pull
```

___Import all translations (Android String XML) for all Android String locales to your PhraseApp project.___
```
$ cd Code/your-awesome-project
$ phrase-droid push
```

## Licence
The MIT Licence

Copyright (c) Fabian Mettler

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
