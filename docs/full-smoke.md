# LeoJSON Full Smoke

LeoJSON provides a release-candidate full smoke target:

```sh
make full-smoke-gcc42
````

## Covered checks

The target runs:

- API smoke against the static library
    
- error smoke against the static library
    
- dist smoke against the release layout
    
- HeaderDoc generation
    

## Release profile

The target uses the configured release optimization profile:

```text
gcc-4.2 -O2 -fno-common -arch ppc
```

## Purpose

The full smoke target is intended as the final local verification step before  
creating a release archive.  

