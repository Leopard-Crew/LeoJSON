
# LeoJSON API Contract

LeoJSON provides the public Leopard-Crew JSON boundary.

Application code must use LeoJSON APIs and must not call JSONKit directly.

## Public header

```text
LeoJSON.h
````

## Public functions

```objc
id LeoJSONObjectFromData(NSData *data,
                         LeoJSONReadOptions options,
                         NSString **errorString);

NSData *LeoJSONDataFromObject(id object,
                              LeoJSONWriteOptions options,
                              NSString **errorString);
```

## Ownership

LeoJSON follows Cocoa naming and ownership rules.

The public functions do not contain `Create`, `Copy`, `New`, or `Alloc` in their  
names. Returned objects are autoreleased.

The caller does not own the returned object.

If the caller needs to keep the returned object, the caller must retain or copy  
it according to normal Cocoa memory-management rules.

## Error handling

If a function fails, it returns `nil`.

If `errorString` is not `NULL`, LeoJSON stores an autoreleased diagnostic string  
in `*errorString`.

If the function succeeds, `*errorString` is set to `nil` when an error pointer is  
provided.

The diagnostic string is intended for logging and developer feedback. It is not  
a stable machine-readable error code.

## Read contract

`LeoJSONObjectFromData` expects JSON data encoded as UTF-8.

Current supported read option:

```text
LeoJSONReadStrict
```

Unsupported read options fail with an error string.

The returned object graph is Foundation-based and follows JSONKit's current  
mapping behavior behind the LeoJSON boundary.

## Write contract

`LeoJSONDataFromObject` serializes supported Foundation object graphs to compact  
UTF-8 JSON data.

Current supported write option:

```text
LeoJSONWriteCompact
```

Unsupported write options fail with an error string.

## Supported Foundation types

LeoJSON currently supports the Foundation types accepted by the vendored JSONKit  
engine, including typical JSON object graphs based on:

- NSDictionary
    
- NSArray
    
- NSString
    
- NSNumber
    
- NSNull
    

## Implementation boundary

JSONKit is an internal implementation detail.

JSONKit symbols may exist inside the static archive, but JSONKit headers,  
categories, options, and behavior are not public LeoJSON API.

Only `LeoJSON.h` defines the supported public interface.

## Stability

LeoJSON is still pre-1.0.

The project tries to keep the public API small and stable, but reserves the  
right to adjust details before the first public 1.0 release.  

