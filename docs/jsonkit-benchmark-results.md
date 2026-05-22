# JSONKit G5 Benchmark Results

## Result

LeoJSON's vendored JSONKit baseline has been benchmarked on real Mac OS X
10.5.8 PowerPC hardware.

This is an initial baseline benchmark. It compares JSONKit parsing and
serialization against native NSPropertyListSerialization XML and binary plist
handling for one synthetic Foundation object graph.

## Test system

- Machine: PowerPC G5 iMac
- OS: Mac OS X 10.5.8 Leopard
- SDK: /Developer/SDKs/MacOSX10.5.sdk
- Architecture: ppc
- Deployment target: 10.5
- Iterations: 1000

## Payload sizes

```text
JSON:         28393 bytes
XML plist:    90691 bytes
Binary plist: 25472 bytes
````

## gcc-4.0 results

Compiler:

```text
powerpc-apple-darwin9-gcc-4.0.1 (GCC) 4.0.1 (Apple Inc. build 5493)
```

Command:

```sh
make bench-gcc40
./build/leojson_jsonkit_bench_gcc40 1000
```

Results:

```text
JSONKit parse                          1000 iterations      3.1311 sec      319.38 ops/sec
JSONKit serialize                      1000 iterations      1.0966 sec      911.94 ops/sec
XML plist parse                        1000 iterations     10.5623 sec       94.68 ops/sec
XML plist serialize                    1000 iterations     11.0440 sec       90.55 ops/sec
Binary plist parse                     1000 iterations      2.6888 sec      371.91 ops/sec
Binary plist serialize                 1000 iterations      3.1596 sec      316.49 ops/sec
```

## gcc-4.2 results

Compiler:

```text
powerpc-apple-darwin9-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5577)
```

Command:

```sh
make bench-gcc42
./build/leojson_jsonkit_bench_gcc42 1000
```

Results:

```text
JSONKit parse                          1000 iterations      3.1971 sec      312.78 ops/sec
JSONKit serialize                      1000 iterations      1.0901 sec      917.38 ops/sec
XML plist parse                        1000 iterations     10.5419 sec       94.86 ops/sec
XML plist serialize                    1000 iterations     11.0220 sec       90.73 ops/sec
Binary plist parse                     1000 iterations      2.6245 sec      381.03 ops/sec
Binary plist serialize                 1000 iterations      3.1624 sec      316.21 ops/sec
```

## Interpretation

JSONKit performs very well on Leopard/PowerPC.

For this payload:

- JSONKit parsing is about 3.3x faster than XML plist parsing.
    
- JSONKit parsing is slightly slower than binary plist parsing.
    
- JSONKit serialization is about 10x faster than XML plist serialization.
    
- JSONKit serialization is about 2.9x faster than binary plist serialization.
    
- gcc-4.0 and gcc-4.2 produce broadly comparable results.
    

## Project conclusion

JSONKit is suitable as LeoJSON's initial parser and serializer engine candidate.

However, native binary plist remains relevant for internal Leopard-only storage.  
LeoJSON should therefore be positioned as the structured text interchange brick,  
not as a blanket replacement for property lists.  

