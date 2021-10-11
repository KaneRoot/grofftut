.\" .RP = report document
.nr PO 0.5i   \" page offset default 1i
.nr LL 7.5i   \" line length default 6i
.nr FM 0.5i   \" page foot margin default 1i
.R1
no-label-in-reference
accumulate
.R2
.nr DI 0
.nr FF 3   \" footnotes' type: numbered, with point, indented
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
.defcolor darkgreen rgb 0.1 0.5 0.2
.defcolor darkblue  rgb 0.3 0.3 0.7
.defcolor darkred   rgb 0.7 0.3 0.3
.de CONSTRUCTOR
.gcolor darkred
.ps 8
.ft CW
\\$1
.ft R
.gcolor
.ps
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
\# Bullet points
.de BULLET
.IP \(bu 2
..
.de ENDBULLET
.in -2   \" indent
..
.
\# Begin code box
.de b1
.B1
.sp 0.2
.ft CW
..
.
\# End code box
.de b2
.sp 0.5
.B2
.ft
..
.de HORIZONTALLINE
\l'15'
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
.\" MS Accents
.\".AM
.defcolor citation    rgb 0.4 0.4 0.4
.defcolor citationbar rgb 0.3 0.3 0.7
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
.de NAMECITATION
.ps -2
\(em\h'1'\\$*
.ps
..
.defcolor explanation    rgb 0.7 0.4 0.4
.defcolor explanationbar rgb 0.8 0.3 0.3
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
.de METAINFO1
.ft CW    \" constant width font
.ps 8     \" small font
.vs 9p    \" smaller vertical spacing between lines
..
.de METAINFO2

.vs      \" come back to the previous vertical spacing
.ps      \" come back to the previous point size
.ft      \" come back to the previous font
.sp -1   \" return one line above
..
.de PRETTY_PERCENTAGE
\v'-.7m\s[\\n(.s*6u/10u]+.7m'\\$1\v'-.7m\s0+.7m'\
\(f/\s[\\n(.s*6u/10u]\\$2\s0
..
.de TWO_COLUMNS
.2C
.nr pg@fn-colw \\n[pg@colw]   \" footnotes' column width
..