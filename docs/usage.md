# LeoJSON Usage

LeoJSON is consumed as a small static-library brick.

## Include

```objc
#import "LeoJSON.h"
```

## Link

Consumer code must link against:

```text
libLeoJSON.a
Foundation.framework
```

## Minimal compile example

```sh
/Developer/usr/bin/gcc-4.2 \
  -ObjC -std=gnu99 -Wall \
  -arch ppc \
  -isysroot /Developer/SDKs/MacOSX10.5.sdk \
  -mmacosx-version-min=10.5 \
  -I/path/to/LeoJSON/include \
  main.m /path/to/LeoJSON/lib/libLeoJSON.a \
  -framework Foundation \
  -o example
```

## Parse JSON data

```objc
NSString *errorString = nil;

id object = LeoJSONObjectFromData(jsonData,
                                  LeoJSONReadStrict,
                                  &errorString);

if (object == nil) {
    NSLog(@"LeoJSON parse failed: %@", errorString);
    return;
}
```

## Serialize a Foundation object

```objc
NSString *errorString = nil;

NSData *jsonData = LeoJSONDataFromObject(object,
                                         LeoJSONWriteCompact,
                                         &errorString);

if (jsonData == nil) {
    NSLog(@"LeoJSON serialization failed: %@", errorString);
    return;
}
```

## Memory management

LeoJSON follows Cocoa naming rules.

Returned objects are autoreleased. The caller does not own them.

Retain or copy the returned object only if it must live beyond the current  
autorelease pool.

## Do not use JSONKit directly

Application code should not include:

```objc
#import "JSONKit.h"
```

Application code should not call JSONKit category methods directly.

LeoJSON owns the public boundary. JSONKit remains internal.  

