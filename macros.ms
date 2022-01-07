.\" .RP = report document
.nr PO 0.5i   \" page offset default 1i
.nr LL 7.5i   \" line length default 6i
.nr FM 0.8i   \" page foot margin default 1i
.nr DI 0
.nr FF 3   \" footnotes' type: numbered, with point, indented
.
.
.nr LIST_NUMBER 0
.
.R1
no-label-in-reference
accumulate
.R2
.
. \" COLORS
.defcolor darkgreen rgb 0.1 0.5 0.2
.defcolor darkblue  rgb 0.3 0.3 0.7
.defcolor darkred   rgb 0.7 0.3 0.3
.
.defcolor citation       rgb 0.4 0.4 0.4
.defcolor citationbar    rgb 0.3 0.3 0.7
.defcolor explanation    rgb 0.7 0.4 0.4
.defcolor explanationbar rgb 0.8 0.3 0.3
.
.
.de BELLOWEXPLANATION1
.sp 0.5
.ps 7     \" point size (~= font size)
.vs 8p    \" vertical spacing between lines
..
.de BELLOWEXPLANATION2
.br
.ps 9
.vs 11p
..
.
.\" BULLET and ENUM => do not add space when no parameter are provided
.de BULLET         \" Bullet points
.IP \(bu 2
.ie '\\$1'' \
.
.el         \\$*
..
.de ENDBULLET
.in -2   \" indent
..
.
.de ENUM           \" Numbered list
.nr LIST_NUMBER +1
.IP \\n[LIST_NUMBER] 2
.ie '\\$1'' \
.
.el         \\$*
..
.de ENDENUM
.nr LIST_NUMBER 0
.in -2   \" indent
..
.
.de b1     \" Begin code box
.B1
.sp 0.2
.ft CW
..
.de b2     \" End code box
.sp 0.5
.B2
.ft
..
.
.de CITATION1
.KS          \" start a keep
.ft I        \" citation in italics
.mk C        \" set a marker for line drawing
.in +1       \" indent a bit
.gcolor citation
..
.de CITATION2
.mk D        \" set second marker to come back here
.ft          \" back to previous font
.in -1       \" remove indent
.gcolor      \" remove previous color
.gcolor citationbar
\r\L'|\\nCu' \" draw line (\r moves upward, \L draw the line, ...)
.sp '|\\nDu' \" return to the second marker
.gcolor      \" remove previous color
.sp -2       \" get two lines back
.KE          \" end of the keep
..
.
.de NAMECITATION
.ps -2
\(em\h'1'\\$*
.ps
..
.
.de EXPLANATION1
.KS          \" start a keep
.ft B        \" citation in italics
.mk C        \" set a marker for line drawing
.in +1       \" indent a bit
.gcolor explanation
..
.de EXPLANATION2
.ft          \" back to previous font
.in -1       \" remove indent
.gcolor      \" remove previous color
.gcolor explanationbar
\r\L'|\\nCu' \" draw line (\r moves upward, \L draw the line, ...)
.gcolor      \" remove previous color
.sp -1       \" get two lines back
.KE          \" end of the keep
..
.
.de METAINFO1
.ft CW    \" constant width font
.ps 8     \" small font
.vs 9p    \" smaller vertical spacing between lines
..
.de METAINFO2
.sp 1
.vs      \" come back to the previous vertical spacing
.ps      \" come back to the previous point size
.ft      \" come back to the previous font
.sp -1   \" return one line above
..
.
.
.de FRAC
\v'-.7m\s[\\n(.s*6u/10u]+.7m'\\$1\v'-.7m\s0+.7m'\
\(f/\s[\\n(.s*6u/10u]\\$2\s0
..
.de FOOTNOTE_TO_COLUMN_WIDTH
.nr pg@fn-colw \\n[pg@colw]   \" footnotes' column width
..
.de SINGLE_COLUMN
.1C
.FOOTNOTE_TO_COLUMN_WIDTH
..
.de TWO_COLUMNS
.2C
.FOOTNOTE_TO_COLUMN_WIDTH
..
.de HORIZONTALLINE
\l'15'
.FOOTNOTE_TO_COLUMN_WIDTH
..
.de SMALLFONT
.ps 8
.vs 9p
..
.de NORMALFONT
.vs
.ps
..
.de COMMAND1
.b1
..
.de COMMAND2
.b2
..
.de COMMANDNAME
.I "\\$1"
..
.de FUNCTION
.I "\\$1" "\\$2"
..
.de TYPE
.gcolor darkgreen
.ps 8
.ft CW
\\$1
.ft R
.gcolor
.ps
..
.de TYPECLASS
.I "\\$1" "\\$2"
..
.de OPERATOR
.I "\\$1" "\\$2"
..
.de QUESTION
.I "\\$1" "\\$2"
\h'5p'
..
.de CONSTRUCTOR
.gcolor darkred
.ps 8
.ft CW
\\$1
.ft R
.gcolor
.ps
..
.de MODULE
.gcolor darkblue
.ps 8
.ft CW
\\$1
.ft R
.gcolor
.ps
..
.de SHINE
.gcolor darkblue
.ft B
\\$1
.ft R
.gcolor
..
.de MODULEX
.MODULE "\\$1,"
..
.de TBD
.ft B
To be defined or to finish.
.ft R
..
.de ARROW
.br
\(->\h'5p' \\$*
..
.ds CURRENT_DATE \\n(dy/\\n(mo/\\n[year]
.ds WEBSITE      https://t.karchnu.fr/doc
.ds EMAIL        karchnu@karchnu.fr
.de INFORMATIONS
Check out for newer versions:
.ft CW
.ps 8
\h'2p' \\$1
.ps
.ft
.br
And if you have questions:
.ft CW
\h'13p' \\$2
.ft
.\" .DE

.LP
Lastly compiled the
.SHINE \*[CURRENT_DATE]
(day/month/year, you know, like in any sane civilization).
..
.de INFORMATIONS_FR
.LP
Nouvelles versions :
.ft CW
.ps 8
\h'2p' \\$1
.ps
.ft
.br
Questions :
.ft CW
\h'36p' \\$2
.ft
.\" .DE

.LP
Compilé pour la dernière fois le
.SHINE \*[CURRENT_DATE]
..
.
.\" RENAMING REQUESTS
.
.de SECTION
.NH
\\$*
..
.de SUBSECTION
.NH 2
\\$*
..
.de SUBSUBSECTION
.NH 3
\\$*
..
.de SUBSUBSUBSECTION
.NH 4
\\$*
..
.de SECTION_NO_NUMBER
.SH
\\$*
..
.de SUBSECTION_NO_NUMBER
.SH 2
\\$*
..
.de PARAGRAPH_INDENTED
.PP
..
.de PARAGRAPH_UNINDENTED
.LP
..
.de NO_ABSTRACT
.AB no
..
.de ABSTRACT1
.AB
..
.de ABSTRACT2
.AE
..
.de TITLE
.TL
\\$*
..
.de AUTHOR
.AU
.ie '\\$1'' \
.
.el \
\\$*
..
.de FOOTNOTE1
.FS
..
.de FOOTNOTE2
.FE
..
.de VOCABULARY1
.KS
.BULLET
.UL "\\$*" :
..
.de VOCABULARY2
.KE
..
