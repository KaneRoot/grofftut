# Troff template (batteries included)

This repository is an introduction to the good old tools to produce documents:

- `roff` as the language to describe documents (`groff` is the implementation)
- `tbl` and **hdtbl** for tables
- `pic` for drawing images
- `grap` for drawing graphs
- `refer` for handling references and bibliography
- etc.

It also includes a few examples of custom macros and images.

Furthermore, this repository includes:

- UTF-8 characters translation into ms macros (via a script)
- source code highlight (via the `source-highlight` software and a script)
- A makefile to automatically call every tool in right order; just type `make`!

# Preview

https://t.karchnu.fr/doc/grofftut.pdf

# Limitations

Images are poorly handled, and they aren't easily managed with `roff` by default.
Some macros exist to do it properly, but it still is to include in custom macros then to document.
