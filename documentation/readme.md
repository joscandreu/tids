# tIDs iOS module for Appcelerator Titanium Mobile

## Description

- tIDs is a Javascript wrapper for [OpenUDID](https://github.com/ylechelle/OpenUDID), a drop-in replacement for the deprecated uniqueIdentifier property of the UIDevice class on iOS (a.k.a. UDID)

- In order to keep safe the OpenUDID across multiple app installations, **tIDs stores the OpenUDID in iOS Keychain**.

## Using the module

```js
var tids = require('net.iamyellow.tids');

Ti.API.info('OpenUDID is ' + tids.openUDID);
```

## Author

jordi domenech
jordi@iamyellow.net
http://iamyellow.net
@iamyellow2

## Feedback and Support

jordi@iamyellow.net

## License

Copyright 2012 jordi domenech <jordi@iamyellow.net>
Apache License, Version 2.0