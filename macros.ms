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
.defcolor black     rgb 0 0 0
.
. \" with semantic
.defcolor citation       rgb 0.4 0.4 0.4
.defcolor citationbar    rgb 0.3 0.3 0.7
.defcolor explanation    rgb 0.7 0.4 0.4
.defcolor explanationbar rgb 0.8 0.3 0.3
.
.defcolor specialcolor_type        rgb 0.6 0.3 0.5
.defcolor specialcolor_constructor rgb 0.1 0.5 0.2
.defcolor specialcolor_module      rgb 0.1 0.5 0.2
.defcolor specialcolor_function    rgb 0.4 0.4 0.7
.defcolor specialcolor_question    rgb 0.0 0.0 0.7
.defcolor specialcolor_shine       rgb 0.3 0.3 0.7
.
. \" SIZES
.nr specialsize_type        8
.nr specialsize_constructor 8
.nr specialsize_module      8
.nr specialsize_function    8
.nr specialsize_question    10   \" Current point size, no change.
.nr specialsize_shine       11
.
. \" FONTS
.ds specialfont_type        CW
.ds specialfont_constructor CW
.ds specialfont_module      CW
.ds specialfont_function    I
.ds specialfont_question    I
.ds specialfont_shine       B
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
.ig
    The CITATION2 macro closes the quote then draws a line
    from current line to the start of the quote.
..
.de CITATION2
.mk D        \" set second marker to come back here
.ft          \" back to previous font
.in -1       \" remove indent
.gcolor      \" remove previous color
.gcolor citationbar
.\" r     = move upward
.\" Z D t = drawing thickness
.\" L     = draw the line
\r
\Z'\D't 1p''\
\L'|\\nCu' \" draw line (\r moves upward, \L draw the line, ...)
.gcolor black     \" remove previous color
.sp -2       \" get two lines back
\Z'\D't 1''    \" get the previous drawing thickness back
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
.
. \" Fonts and colors.
.
.de SPECIAL_WORDS
.nr current_size \\n[.s]  \" Current point size.
.gcolor specialcolor_\\*[semantictoken]
.
.if !((\\n[current_size] == \\n[specialsize_\\*[semantictoken]]) \
.ps \\n[specialsize_\\*[semantictoken]]
.
.ie '\\$2'' \{\
\f[\\*[specialfont_\\*[semantictoken]]]\\$1\f[]
.  ps \\n[current_size]
.  gcolor black      \" FIXME: should be the previous color
\}
.el \{\
\f[\\*[specialfont_\\*[semantictoken]]]\\$1\f[]\c
.  ps \\n[current_size]
.  gcolor black      \" FIXME: should be the previous color
\\$2
\}
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
.I "\\$1" "\\$2"
..
.de FUNCTION
.gcolor color_function
\f[CW]\\$1\f[]\c
.gcolor
\\$2
..
.de TYPE
.ds semantictoken type
.SPECIAL_WORDS "\\$1" "\\$2"
..
.de TYPECLASS
.I "\\$1" "\\$2"
..
.de OPERATOR
\f[CW]\\$1\f[]\\$2
..
.de QUESTION
.ds semantictoken question
.SPECIAL_WORDS "\\$1" "\\$2"
\h'5p'
..
.de CONSTRUCTOR
.ds semantictoken constructor
.SPECIAL_WORDS "\\$1" "\\$2"
..
.de MODULE
.ds semantictoken module
.SPECIAL_WORDS "\\$1" "\\$2"
..
.de SHINE
.ds semantictoken shine
.SPECIAL_WORDS "\\$1" "\\$2"
..
.de MODULEX
.MODULE \\$1 ,
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
.ps +3
.fam H   \" helvetica family
\\$*
.fam     \" back to previous font family
.ps
.PARAGRAPH_INDENTED
..
.de SUBSECTION
.NH 2
.ps +1
.fam H   \" helvetica family
\\$*
.fam     \" back to previous font family
.ps
.PARAGRAPH_INDENTED
..
.de SUBSUBSECTION
.NH 3
.fam H   \" helvetica family
\\$*
.fam     \" back to previous font family
.ps
.PARAGRAPH_INDENTED
..
.de SUBSUBSUBSECTION
.NH 4
.fam H   \" helvetica family
\\$*
.fam     \" back to previous font family
.PARAGRAPH_INDENTED
..
.de SECTION_NO_NUMBER
.SH
.fam H   \" helvetica family
\\$*
.fam     \" back to previous font family
.PARAGRAPH_INDENTED
..
.de SUBSECTION_NO_NUMBER
.SH 2
.fam H   \" helvetica family
\\$*
.fam     \" back to previous font family
.PARAGRAPH_INDENTED
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


.\".nr G 0 1 \" numéro des notes
.\".de NOTE1
.\".\" macro NOTE1 commence les notes
.\"(\\n+G)
.\".   ev 1 \" ouvre un environnement dédié aux notes
.\".   br \" casse le flux
.\".   da print \" divertit le flux vers print
.\".   sp \" espace
.\"\\nx)
.\"..
.\".de NOTE2
.\".\" macro NOTE2 ferme les notes
.\".   br \" casse le flux
.\".   di \" ferme la diversion
.\".   ev \" sort de l'environnement
.\"..
.\".de end
.\".\" macro appellée à la fin du document
.\".   br
.\".   ev 1 \" en retourne dans l'environnement des notes
.\".   print \" execute le contenu de la diversion
.\".   br
.\".   ev
.\".   pl \\n(nlu \" ajuste la taille de la page au nombre de lignes
.\"..
.\".\" définit la macro .end comme macro de fin de document:
.\".\" .em end
