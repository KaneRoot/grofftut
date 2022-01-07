# Troff template (batteries included)

This repository is an introduction to the good old tools to produce documents:

- `roff` as the language to describe documents (`groff` is the implementation)
- `tbl` and **hdtbl** for tables
- `eqn` for math equations
- `pic` for drawing images
- `grap` for drawing graphs
- `refer` for handling references and bibliography
- etc.

It also includes a few examples of custom macros and images.

Furthermore, this repository includes:

- UTF-8 characters translation into ms macros (via a script)
- source code highlight (via the `source-highlight` software and a script)
- A makefile to automatically call every tool in right order; just type `make`!

# How to compile

You need `groff` installed on your system, and `source-highlight` (or remove the right line in the makefile).

Then:
```sh
make
```

If you have `entr` on your system, you can also recompile your file each time you modify it:
```sh
make serve
```

Read the makefile for more options.

# Preview

https://t.karchnu.fr/doc/grofftut.pdf

(Read this document on a PDF viewer, not directly in your browser!)

# Limitations

Images are poorly handled, and they aren't easily managed with `roff` by default.
Some macros exist to do it properly, but it still is to include in custom macros then to document.

Browser preview is ugly as fuck.
It may have something to do with font embedding, I have to investigate, but right now you just can't have a nice preview on a browser.
