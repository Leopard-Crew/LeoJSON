https://chatgpt.com/g/g-p-69e4e05cc780819186298fa6fccc3424-11-leopard/c/6a0f53ca-5eb8-83eb-a519-8a6b5aeb0180

# LeoJSON Build Policy

LeoJSON follows the Leopard-Crew baseline build policy.

## Platform baseline

LeoJSON targets the official Leopard PowerPC world:

- Mac OS X 10.5.8 Leopard
- PowerPC only
- Big Endian only
- G4/G5 compatible
- no Intel target
- no Universal Binary target
- no Tiger target

## Principle

Release builds may be produced on a G5, but must remain suitable for the
official Leopard PowerPC range. LeoJSON must not exclude G4 systems through
unnecessary processor-specific build flags.

For older PowerPC systems, runtime performance is usually more important than
saving a few kilobytes of binary size.

## Compiler profiles

### baseline

Conservative comparison profile.

```text
gcc-4.0 -O2 -arch ppc
````

### release

Default release profile for LeoJSON.

```text
gcc-4.2 -O2 -fno-common -arch ppc
```

### size

Optional size-focused profile. This is not the default because the measured  
LeoJSON throughput loss is much larger than the binary size gain.

```text
gcc-4.2 -Os -fno-common -arch ppc
```

### g5-probe

Local measurement profile only. This profile must not become the default release  
profile because LeoJSON should remain G4/G5 compatible.

```text
gcc-4.2 -O2 -fno-common -mtune=970 -arch ppc
```

## G5-specific acceleration

Performance-critical Leopard-Crew projects may provide optional G5-specific  
accelerated artifacts.

Rules:

- the normal release artifact must remain G4/G5 compatible
    
- the G5-specific artifact must be optional
    
- runtime loading must fall back cleanly to the baseline artifact
    
- G5-specific code must not be required for normal operation
    
- G5-specific optimization must be justified by measurement
    

LeoJSON itself does not currently require a G5-specific artifact.  

