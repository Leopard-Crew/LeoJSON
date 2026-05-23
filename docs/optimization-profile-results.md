
# LeoJSON Optimization Profile Results

## Result

For LeoJSON, gcc-4.2 with `-O2` remains the preferred release profile.

The size-focused `-Os -fno-common` profile reduces the static library size, but  
the measured JSON throughput loss is much larger than the binary size gain.

## Test system

- Machine: PowerPC G5 iMac
    
- OS: Mac OS X 10.5.8 Leopard
    
- SDK: /Developer/SDKs/MacOSX10.5.sdk
    
- Architecture: ppc
    
- Deployment target: 10.5
    

## Static library size

### gcc-4.2 -O2

```text
JSONKit_gcc42.o       83940 bytes
LeoJSON_gcc42.o        4016 bytes
libLeoJSON_gcc42.a    88808 bytes
```

### gcc-4.2 -Os

```text
JSONKit_gcc42.o       81168 bytes
LeoJSON_gcc42.o        3920 bytes
libLeoJSON_gcc42.a    85936 bytes
```

### gcc-4.2 -Os -fno-common

```text
JSONKit_gcc42.o       81168 bytes
LeoJSON_gcc42.o        3920 bytes
libLeoJSON_gcc42.a    85936 bytes
```

## Throughput comparison

### gcc-4.2 -O2

```text
JSONKit parse                          1000 iterations      3.1971 sec      312.78 ops/sec
JSONKit serialize                      1000 iterations      1.0901 sec      917.38 ops/sec
XML plist parse                        1000 iterations     10.5419 sec       94.86 ops/sec
XML plist serialize                    1000 iterations     11.0220 sec       90.73 ops/sec
Binary plist parse                     1000 iterations      2.6245 sec      381.03 ops/sec
Binary plist serialize                 1000 iterations      3.1624 sec      316.21 ops/sec
```

### gcc-4.2 -Os -fno-common

```text
JSONKit parse                          1000 iterations      4.0083 sec      249.48 ops/sec
JSONKit serialize                      1000 iterations      1.4296 sec      699.49 ops/sec
XML plist parse                        1000 iterations     13.0156 sec       76.83 ops/sec
XML plist serialize                    1000 iterations     14.0389 sec       71.23 ops/sec
Binary plist parse                     1000 iterations      3.4324 sec      291.34 ops/sec
Binary plist serialize                 1000 iterations      4.0543 sec      246.65 ops/sec
```

## Interpretation

`-Os -fno-common` reduces `libLeoJSON_gcc42.a` from 88808 bytes to 85936 bytes,  
a reduction of 2872 bytes, or about 3.2%.

However, JSON throughput drops much more significantly:

- JSON parse drops from 312.78 ops/sec to 249.48 ops/sec
    
- JSON serialize drops from 917.38 ops/sec to 699.49 ops/sec
    

For old PowerPC systems, this is not a good default tradeoff.

## Decision

LeoJSON uses the following preferred release profile:

```text
gcc-4.2 -O2 -fno-common -arch ppc
```

The size profile remains available for comparison, but is not the default.  

