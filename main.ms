.    \" comments start with: \"
.    \" lines containing only a point: ignored by troff
.    \" empty lines = paragraph separator, produce vertical space
.so macros.ms   \" First, let's import some macros.
.so header.ms
.TWO_COLUMNS
.NH   \" new section
Sections and paragraphs
.PP  \" new paragraph (with indentation on first line)
Some indented paragraph.
As you can see, contrary to the first one you encountered in the previous section.
.NH 2  \" new inner section, goes from 1 to 4
Sub-section
.LP
Some unindented paragraph.

Basics of sections and paragraphs in troff (ms macros):
.METAINFO1
 .NH
 Section
 .PP
 Some indented paragraph.
 .NH 2
 Sub-section
 .LP
 Some unindented paragraph.
.METAINFO2

.NH
Some highlights: the basics
.LP
.I "Combining"            \" italics
.UL "several"             \" underlined
.B "ways"                 \" bold
to
.BX highlight             \" box
.ft CW                    \" changing font: constant width
some text.
.ft                       \" reverting to previous font

.METAINFO1
 .I "Combining"   \\" italics
 .UL "several"    \\" underlined
 .B "ways"        \\" bold
 to
 .BX highlight    \\" box
 .ft CW           \\" changing font: constant width
 some text.
 .ft              \\" reverting to previous font
.METAINFO2

Avoiding underlining the
.UL "final point" .

.METAINFO1
 .UL "final point" .  \\" point is a second parameter
.METAINFO2

.I "Again, in italics but surrounded" ) (   \" order: text-in-italics after before

.METAINFO1
 .I "Again, in italics but surrounded" ) (
 \\" order: text-in-italics after before
.METAINFO2

.NH
Brief overview of custom macros (in macros.ms)
.LP
The file
.ft CW
macros.ms
.ft
includes many small contributions to easily make nice PDF outputs.
For example, the following code and its result:
.METAINFO1
 .EXPLANATION1
  Very important sentence.
 .EXPLANATION2
.METAINFO2

.EXPLANATION1
Very important sentence.
.EXPLANATION2

.HORIZONTALLINE

There is also an helper to make citations.
.METAINFO1
 .CITATION1
 Seriously, these macros are awesome guys.
 .CITATION2
 .NAMECITATION "Albert Einstein"
.METAINFO2

.CITATION1
Seriously, these macros are awesome guys.
.CITATION2
.NAMECITATION "Albert Einstein"

.HORIZONTALLINE

(Temporary name for the following macro)
.ft CW
 .PRETTY_PERCENTAGE 5.5 20
.ft
.br
Produces:
.PRETTY_PERCENTAGE 5.5 20

.HORIZONTALLINE

Meta informations are in smaller text size and in constant width, with this code:
.METAINFO1
 .METAINFO1
 Some text.
 .METAINFO2
.METAINFO2

Example:
.br
.METAINFO1
This is how I put meta informations in my documents: the text is smaller and in constant width.
.METAINFO2

.HORIZONTALLINE

These horizontal lines are produced by
.METAINFO1
 .HORIZONTALLINE
.METAINFO2

.HORIZONTALLINE

Listing stuff
.BULLET
with
.BULLET
bullet
.BULLET
points
.ENDBULLET

.METAINFO1
 .BULLET
 with
 .BULLET
 bullet
 .BULLET
 points
 .ENDBULLET
.METAINFO2

.NH
Source code syntax highlighting
.PP
Source code for a number of languages can be colored with the following code\*[*]:
.FS  \" footnote starts (\*[*] is its reference)
Under the hood, this involves the
.ft CW
source-highlight
.ft
software and the script
.ft CW
ghighlight
.ft
in the \f(CW./bin/\f[] directory (see the Makefile for more information).
.FE    \" footnote ends

.METAINFO1
 .SOURCE C
 int main(int argc, char **argv) {
   return 0;
 }
 .SOURCE
.METAINFO2

.SOURCE C
int main(int argc, char **argv) {
  return 0;
}
.SOURCE

.NH   \" new section
Some figures with pic.
.LP   \" new paragraph (without indentation on first line)
This is a paragraph before the picture.
.PS  \" this starts a 'pic' section, to draw figures
.defcolor lightgreen rgb 0.9 1.0 0.9
box "A box." shaded "lightgreen"
line
circle "A circle." rad 0.4
.PE  \" this ends the 'pic' section

This is written in the code this way:
.METAINFO1
 .PS
 .defcolor lightgreen rgb 0.9 1.0 0.9
 box "A box." shaded "lightgreen"
 line
 circle "A circle." rad 0.4
 .PE
.METAINFO2

.NH
Some graphs with grap.
.LP
.G1
GROWTHFACTOR=0.07
grid bot  dotted from 0 to 100 by 10
grid left dotted from 0 to 800 by 50
frame ht 2.5 wid 2.8
define expo { $1+$1*GROWTHFACTOR }
value = 1
draw LINEAR solid
for i from 1 to 100 by 1 do {
  next LINEAR at i, i
  times at i, value
  value = expo(value)
}
line from 0,650 to 3,650
"    linear curve" ljust at 1,650
"    exponential curve" ljust at 1,600
times at 1,600
label top "Exponential curves: growth over time (7%)" up -.2
.G2
.BELLOWEXPLANATION1
Exponentials: always fun and games when talking about economy.
A complete nighmare when talking about mineral extraction costs.
.BELLOWEXPLANATION2

.METAINFO1
 .G1
 GROWTHFACTOR=0.07
 grid bot  dotted from 0 to 100 by 10
 grid left dotted from 0 to 800 by 50
 frame ht 2.5 wid 2.8
 define expo { $1+$1*GROWTHFACTOR }
 value = 1
 draw LINEAR solid
 for i from 1 to 100 by 1 do {
   next LINEAR at i, i
   times at i, value
   value = expo(value)
 }
 line from 0,650 to 3,650
 "    linear curve" ljust at 1,650
 "    exponential curve" ljust at 1,600
 times at 1,600
 label top "Exponential curves: growth over time (7%)" up -.2
 .G2
.METAINFO2

.\" Neighbor Discovery, RS... IPv6 stuff
.\" .PS
.\" reset
.\" space_between_machines = 2.0
.\" space_lines = 0.1
.\" space_hdr = 0.8
.\" space_step = 0.3
.\" space_step_small = 0.2
.\" 
.\" .ps 16
.\" A: "A" ; move space_between_machines
.\" R: "R" ; move space_between_machines
.\" B: "B"
.\" 
.\" .ps 12
.\" move to A + (0, -space_hdr)
.\" "start" rjust; move down space_lines
.\" START: line left ; move right; move right space_between_machines; move down space_step
.\" DAD_SOL: line right ; move to START + (0, -space_step)
.\" RS_A: line left  ; move right; move right space_between_machines; move down space_step
.\" RS_B: line right ; move left ; move down space_step_small
.\" RS_C: line right ; move left ; move left space_between_machines; move down space_step
.\" RS_D: line left "New IP @" "" ; move right
.\" move down space_step_small
.\" DAD_SEC_A: line left ; move right; move right space_between_machines; move down space_step
.\" DAD_SEC_B: line right ; move to DAD_SEC_A + (0, -space_step)
.\" 
.\" 
.\" .ps 8
.\" line -> from START to DAD_SOL "DAD: Neighbor Sollicitation" "" ""
.\" line -> from RS_A to RS_B "Router Sollicitation" "" ""
.\" line -> from RS_C to RS_D "Router Advertisment" "" ""
.\" line -> from DAD_SEC_A to DAD_SEC_B "(second) DAD: Neighbor Sollicitation" "" ""
.\" .PE

.NH
Some equations with eqn
.LP
Let's see a few equations.
.EQ
E = mc sup 2
.EN
.METAINFO1
 .EQ
 E = mc sup 2
 .EN
.METAINFO2

Inline equations, via the "\[Do]" sign:
.METAINFO1
 .EQ
 delim \[Do]\[Do]
 .EN
 Inlining equations also is possible: \[Do]a sup b = c\[Do]
.METAINFO2

.EQ
delim $$
.EN
.\" \h'5p'   => horizontal space
Inlining equations also is possible:\h'5p' $a sup b = c$
.EQ
delim off
.EN
And this can be set off, with "delim off".

.NH
UTF-8
.PP
UTF-8 is wonderful.
Unfortunately, this wasn't implemented in troff, since it comes from 1972, and neither in the later implementation
.B groff .
So, I wrote the \f[CW]./bin/utf8-to-ms.sh\f[] filter to automatically convert an extensive list of accents, ligatures, and text markers in their equivalent ms macros.
Therefore, one can write in UTF-8 (or at least a good chunk of it) in the input file\*[*].
.FS
All characters cannot be converted so easily.
Some of them are used in troff, such as the arobase, the backslash, etc.
However, my script is a good enough solution for me to write in my mother tongue without any problem.
.FE

Examples (all written in UTF-8 in the troff file):
.br
©®àÀÇçéÉÙÛâÂÔ¡¿œŒæÆ

.NH
Tables with tbl
.PP
.TS
allbox tab(:);
c | c
c | lew(2.5i).
Column1 : Column2
cell : cell content
cell :T{
Hello this is a way longer content, way more than what the cell can hold in a single line.
T}
.TE
.METAINFO1
 .TS
 allbox tab(:);
 c | c
 c | lew(2.5i).
 Column1 : Column2
 cell : cell content
 cell :T{
 Hello this is a way longer content, way more than what the cell can hold in a single line.
 T}
 .TE
.METAINFO2

.NH
Some references
.PP
Let's reference a few documents, such as A Universe from Nothing
.[
universe
.]
and a book about the excellent Haskell language.
.[
haskell
.]

.METAINFO1
 Let's reference a few documents, such as A Universe from Nothing
 .[
 universe
 .]
 and a book about the excellent Haskell language.
 .[
 haskell
 .]
.METAINFO2

.NH
Images
.PP
Only PDF can be included, so images need to be converted beforehand.

.METAINFO1
 .PDFPIC -R "./are-you.pdf" 3.5
.METAINFO2
.
.nr figurespace 17
.sp \n[figurespace]
.PDFPIC -R "./are-you.pdf" 3.5
.sp \n[figurespace]

.METAINFO1
Note: for now, on my system, I need a hack.
The included PDF has no length, despite having installed the poppler-utils package.
So, I added spaces by hand.
I'll try to search for a better way, someday.
.METAINFO2

.METAINFO1
 .nr figurespace 17
 .sp \\n[figurespace]
 .PDFPIC -R "./are-you.pdf" 3.5
 .sp \\n[figurespace]
.METAINFO2
