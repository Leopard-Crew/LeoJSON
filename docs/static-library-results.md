# LeoJSON Static Library Results

## Result

LeoJSON builds successfully as a static library on real Mac OS X 10.5.8
PowerPC hardware.

The API smoke probe links against the generated static library instead of
compiling LeoJSON and JSONKit implementation files directly into the probe.

## Build products

```text
build/libLeoJSON_gcc40.a
build/libLeoJSON_gcc42.a
````

## Interpretation

This confirms that LeoJSON can be consumed as a small reusable brick:

- application code includes LeoJSON.h
    
- application code links against libLeoJSON
    
- JSONKit remains hidden inside the library
    
- Foundation remains the only public framework dependency  
    

