
LeoJSON is intentionally PowerPC-only and Big-Endian-first.

The project does not target Intel Macs, universal binaries, or modern macOS.
Release builds must remain suitable for the officially supported Leopard
PowerPC range, especially G4 and G5 systems.

G5-specific tuning may be used for local measurements, but must not become the
default release profile unless the project explicitly decides to drop G4.
