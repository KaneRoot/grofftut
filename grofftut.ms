.    \" comments start with: \"
.    \" lines containing only a point: ignored by troff
.    \" empty lines = paragraph separator, produce vertical space
.so macros.ms   \" First, let's import some macros.
.so header.ms
.TWO_COLUMNS
.SH   \" new section, without number
Before we start
.PP
.QUESTION "Why a PDF instead of a website?"
Documentation is about providing information in a comprehensive manner.
There are different ways, roughly summarised in the following as
.I website
and
.I book
(maybe as a PDF document and not a physical book, but you get the idea).

.TS
allbox tab(:);
c | c
c | lew(2.8i).
Doc. : Perks
Web :T{
Quick and easy to create and share,
very small contributions are shared,
easily updated
T}
Book :T{
All related informations in a single place,
collectible,
very little updates
T}
.TE

From the constraint of having to deliver a final document that cannot be updated, comes one of the biggest perks of books.
Authors are forced to write to the best of their abilities.

.TS
allbox tab(:);
c | c
c | lew(2.8i).
Doc. : Flaws
Web :T{
All differents,
perishable,
non easily collectible for backups,
scattered information (articles),
often not pedagogical or with little effort put in explanations,
hard to follow updates
T}
Book :T{
Way harder to write
T}
.TE

Books can be written using a lot of different tools, including \fILaTeX\f[] or WYSIWYG editors such as \fILibreoffice\f[].
None are simpler or withstood the test of time better than troff.
Troff still works almost as its debuts in 1970, and as of today, it produces high quality documents with little effort or complexity.

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

.ft CW
 .FRAC 5.5 20
.ft

Produces:
.FRAC 5.5 20

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
.BULLET with
.BULLET bullet
.BULLET points
.ENDBULLET

.METAINFO1
 .BULLET with
 .BULLET bullet
 .BULLET points
 .ENDBULLET
.METAINFO2

.HORIZONTALLINE

Numbered lists
.ENUM Orange
.ENUM Apple
.ENUM Pear
.ENDENUM

.METAINFO1
 .ENUM Orange
 .ENUM Apple
 .ENUM Pear
 .ENDENUM
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

.SECTION_NO_NUMBER Read the source code for the next figures.
Both figures have very few lines of code.
The source code can be read without prior knowledge of
.B pic ,
it's almost plain English!

.PS
reset

.\" Radius for different circles.
rad_large_circle = 0.6
rad_empty_space  = 0.5
rad_light_source = 0.3
rad_aperture     = 0.1

.\" Light intensity.
fill_large_circle = 0.1   # Very bright.
fill_empty_space  = 0.6   # Little bright.
fill_light_source = 0     # Completely bright.

arrow_x_shift = 0.05
txt_y_shift = 0.25   # Allow space for text.

.\" Circles.
HALO:     circle                   rad rad_large_circle  fill fill_large_circle
EMPTY:    circle with .c at HALO.c rad rad_empty_space   fill fill_empty_space 
SOURCE:   circle with .c at HALO.c rad rad_light_source  fill fill_light_source
APERTURE: circle with .c at HALO.c rad rad_aperture fill fill_light_source dashed

.\" Legend.
TAPERTURE: "Aperture, where light can pass through" ljust at HALO.e + (0.3, 0)
TSOURCE:  "Main visible light source, very bright"  ljust at Here + (0, -txt_y_shift)
TEMPTY:   "Empty space, very little light"          ljust at Here + (0, -txt_y_shift)
THALO:    "Halo, thin light"                        ljust at Here + (0, -txt_y_shift)

.\" Arrows.
arrow from TAPERTURE + (-arrow_x_shift,0) to APERTURE chop 0 chop rad_aperture
arrow from TSOURCE   + (-arrow_x_shift,0) to SOURCE   chop 0 chop rad_light_source
arrow from TEMPTY    + (-arrow_x_shift,0) to EMPTY    chop 0 chop rad_empty_space
arrow from THALO     + (-arrow_x_shift,0) to HALO     chop 0 chop rad_large_circle

.\" Let's cheat a little: centering the figure.
false_line_x = 2.7
line from SOURCE + (false_line_x,0) to SOURCE + (false_line_x,0)

.ps 14
"Circular diffraction" at HALO.s + (1, -1)
.PE

Seriously, just check the source code.
It's filled with dead simple lines, such as:
.SOURCE C ps=7 vs=9p
circle rad rad_large_circle fill fill_large_circle
.SOURCE
.gcolor black

.PS
.vs 9p
.ps 7
reset

.\" Drawing direction.
down

scale = 1.4


.\""""""""""""""""""""""""""""""
.\" Variables to ajust elements.

.\" Distances x and y between the massive object and magnified ones.
mag_obj_x = 1.4
mag_obj_y = -1

.\" Radius of the different celestial objects.
rad_obs         = 0.3
rad_massive_obj = 0.5
rad_mag         = 0.4
rad_dist        = 0.27

.\" Distance between the light beam of the distant object
.\" reaching the observer and the massive object's center.
dist_beam_massive_obj = 0.32


.\"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
.\" Drawing of the celestial corpses (planets, galaxies, etc.).

.\" Observer, massive object and the distant object.
OBSERVER:    circle radius rad_obs "Observer"
move
MASSIVE_OBJ: circle radius rad_massive_obj "Massive" "object"
move
TARGET:      circle radius rad_dist "Distant" "object"

.\" "radius" can be abreviated in "rad".

.\" Magnified objects.
MAGNIFIED1: circle rad rad_mag "Magnified" "distant" "object" at MASSIVE_OBJ + ( mag_obj_x, mag_obj_y)
MAGNIFIED2: circle rad rad_mag "Magnified" "distant" "object" at MASSIVE_OBJ + (-mag_obj_x, mag_obj_y)

.\" Lines from the magnified objects to the observer.
.\" chop = do not draw within the circles (a radius is given).

line from MAGNIFIED1 to OBSERVER chop rad_mag chop rad_obs dashed
line from MAGNIFIED2 to OBSERVER chop rad_mag chop rad_obs dashed

.\" Arrows, from distant object to the observer.
spline -> from TARGET to MASSIVE_OBJ.e + (dist_beam_massive_obj,0)  to OBSERVER chop rad_dist chop rad_obs
spline -> from TARGET to MASSIVE_OBJ.w + (-dist_beam_massive_obj,0) to OBSERVER chop rad_dist chop rad_obs

.vs
.ps 14
"Gravitational lensing" at TARGET + (0,-0.7)
.PE

Both figures came from my summary of the book
.B "A Universe From Nothing" "\*[*]"
from
.I "Lawrence Krauss" .
.FOOTNOTE1
.\" I've no idea why footnotes line length changed.
.\" This is related to figures, but it needs some investigation.
.ll 7.5i
Available at:
.br
.ps 7.8
.ft CW
\*[WEBSITE]/universe-from-nothing.pdf
.ft
.ps
.FOOTNOTE2
.NH
Some graphs with grap.
.LP
.PS
reset
.PE
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
This wasn't implemented in troff, since it comes from 1972, and neither in the later implementation
.B groff .
But, you can write UTF-8 characters anyway, thanks to the troff preprocessor
.B preconv .

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
Tables with hdtbl
.PP
.mso hdtbl.tmac
.\"
.ds t*bgc  white\" background color
.\".ds t*fgc  black  \" foreground color
.\".nr t*cpd  0.1n   \"  cell padding
.ds t*bc   pink2\"  border color
.
.TBL cols=3 width='20% 35%'
.  CPTN val=b This is a fine table. This is a fine table. This is a fine table. This is a fine table. This is a fine table. This is a fine table.
.  TR
.    TD fst=I first cell
.    TD fgc=green4 bgc= 1*2
.    TD hal=c val=m rowspan=2 hello
.  TR .TD 2*1 ".TD bgc=pink" 2*2
.  TR height=0.5i .TD 3*1 ".TD colspan=2 hal=r fst=B" Last cell
.ETB

.TBL cols=3 width='50% 25%'
.  TR
.    TD fst=I first cell, long message
.    TD fgc=green4 bgc= second
.    TD bgc= 3
.ETB

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
.nr figurespace 15
.\" KS and KE: keep different stuff together (no page break)
.KS
.PDFPIC -R "./are-you.pdf" 3.2
.sp \n[figurespace]
.KE
.\".sv \n[figurespace]

.METAINFO1
Note: for now, on my system, I need a hack.
The included PDF has no length, despite having installed the poppler-utils package.
So, I added vertical spaces by hand (with
.I sp
and
.I sv
requests).
The length is an empirical constant.
I'll try to search for a better way, someday.
.METAINFO2

.NH
Final words
.PP
It is customary in old tools such as troff to read the source code and hack your way.
Once you're familiar with the basics, if you need something that isn't in the official troff documentation, don't hesitate to read provided macros (mines, but also ms macros as well, for instance).
You'll quickly learn a lot.
