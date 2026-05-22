# JSONKit Smoke Probe Results

## Result

JSONKit builds and runs successfully on real Mac OS X 10.5.8 PowerPC hardware.

This is a smoke result only. It proves that the vendored JSONKit baseline can
parse and serialize a small UTF-8 JSON document on the target system. It is not
a full correctness test and not a benchmark result.

## Test system

- Machine: PowerPC G5 iMac
- OS: Mac OS X 10.5.8 Leopard
- SDK: /Developer/SDKs/MacOSX10.5.sdk
- Architecture: ppc
- Deployment target: 10.5

## Compiler results

### gcc-4.0

Compiler:

```text
powerpc-apple-darwin9-gcc-4.0.1 (GCC) 4.0.1 (Apple Inc. build 5493)
````

Result:

```text
OK: JSONKit smoke probe passed
Roundtrip JSON: {"name":"LeoJSON","target":"Mac OS X 10.5.8 PowerPC","unicode":"Grüße vom G5","values":[1,2,3]}
```

### gcc-4.2

Compiler:

```text
powerpc-apple-darwin9-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5577)
```

Result:

```text
OK: JSONKit smoke probe passed
Roundtrip JSON: {"name":"LeoJSON","target":"Mac OS X 10.5.8 PowerPC","unicode":"Grüße vom G5","values":[1,2,3]}
```

## Interpretation

The vendored JSONKit source is buildable with both available Leopard-era PPC  
compilers and can round-trip a small Foundation-backed JSON document.

The next step is a benchmark probe. Performance claims remain unverified until  
measured on the G5.  

