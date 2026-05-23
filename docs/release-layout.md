
# LeoJSON Release Layout

LeoJSON release artifacts use a small static-library layout.

## Layout

```text
LeoJSON-<version>/
  include/
    LeoJSON.h
  lib/
    libLeoJSON.a
  README.md
  docs/
````

## Consumer contract

Applications should include:

```objc
#import "LeoJSON.h"
```

Applications should link against:

```text
libLeoJSON.a
Foundation.framework
```

Application code must not include JSONKit headers directly. JSONKit remains an  
internal implementation detail of LeoJSON.

## Release compiler profile

LeoJSON release artifacts use the Leopard-Crew release profile:

```text
gcc-4.2 -O2 -fno-common -arch ppc
```

This keeps the artifact PowerPC Big Endian, G4/G5 compatible, and optimized for  
real old-machine usability rather than minimum file size.  

