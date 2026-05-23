# LeoJSON Public Boundary

LeoJSON exists to prevent JSONKit from leaking into Leopard-Crew application  
code.

## Public

The supported public API is defined by:

```text
sources/LeoJSON/LeoJSON.h
```

Release packages expose this header as:

```text
include/LeoJSON.h
```

## Private

The following are private implementation details:

- vendor/JSONKit/
    
- JSONKit headers
    
- JSONKit categories
    
- JSONKit parse/write options
    
- JSONKit internal Unicode handling
    

## Static archive note

LeoJSON currently ships as a static library.

Because static archives contain object files, JSONKit symbols may be visible to  
developer tools such as `nm`.

This does not make them public API.

Only `LeoJSON.h` is supported for application use.

## Rule

Applications include LeoJSON.

LeoJSON includes JSONKit.

Applications must not include JSONKit.  

