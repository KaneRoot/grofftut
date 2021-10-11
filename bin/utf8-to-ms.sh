#!/bin/sh

# This program isn't by any mean complete.
# Most of text markers, accents and ligatures are handled.
# However, nothing else currently is.
# Please, do provide more translations.

# Convert input into hexadecimal and a single byte per line.
to_hex_one_column()  xxd -p -c 1

# Reverse hexadecimal to original value.
from_hex()           xxd -p -r

regroup_lines() awk '
	BEGIN {
		line_start=1
	}

	{
		if (line_start == 1)
			line = $1;
		else
			line = line " " $1;

		line_start = 0;
		if ($1 == "0a") {
			print line;
			line_start = 1
		}
	}

	END {
		if (line_start == 0)
			print line
	}
	'

accents() sed \
	-e "s/c3 81/5c 5b 27 41 5d/g"\
	-e "s/c3 89/5c 5b 27 45 5d/g"\
	-e "s/c3 8d/5c 5b 27 49 5d/g"\
	-e "s/c3 93/5c 5b 27 4f 5d/g"\
	-e "s/c3 9a/5c 5b 27 55 5d/g"\
	-e "s/c3 9d/5c 5b 27 59 5d/g"\
	-e "s/c3 a1/5c 5b 27 61 5d/g"\
	-e "s/c3 a9/5c 5b 27 65 5d/g"\
	-e "s/c3 ad/5c 5b 27 69 5d/g"\
	-e "s/c3 b3/5c 5b 27 6f 5d/g"\
	-e "s/c3 ba/5c 5b 27 75 5d/g"\
	-e "s/c3 bd/5c 5b 27 79 5d/g"\
	-e "s/c3 84/5c 5b 3a 41 5d/g"\
	-e "s/c3 8b/5c 5b 3a 45 5d/g"\
	-e "s/c3 8f/5c 5b 3a 49 5d/g"\
	-e "s/c3 96/5c 5b 3a 4f 5d/g"\
	-e "s/c3 9c/5c 5b 3a 55 5d/g"\
	-e "s/c3 a4/5c 5b 3a 61 5d/g"\
	-e "s/c3 ab/5c 5b 3a 65 5d/g"\
	-e "s/c3 af/5c 5b 3a 69 5d/g"\
	-e "s/c3 b6/5c 5b 3a 6f 5d/g"\
	-e "s/c3 bc/5c 5b 3a 75 5d/g"\
	-e "s/c3 bf/5c 5b 3a 79 5d/g"\
	-e "s/c3 82/5c 5b 5e 41 5d/g"\
	-e "s/c3 8a/5c 5b 5e 45 5d/g"\
	-e "s/c3 8e/5c 5b 5e 49 5d/g"\
	-e "s/c3 94/5c 5b 5e 4f 5d/g"\
	-e "s/c3 9b/5c 5b 5e 55 5d/g"\
	-e "s/c3 a2/5c 5b 5e 61 5d/g"\
	-e "s/c3 aa/5c 5b 5e 65 5d/g"\
	-e "s/c3 ae/5c 5b 5e 69 5d/g"\
	-e "s/c3 b4/5c 5b 5e 6f 5d/g"\
	-e "s/c3 bb/5c 5b 5e 75 5d/g"\
	-e "s/c3 80/5c 5b 60 41 5d/g"\
	-e "s/c3 88/5c 5b 60 45 5d/g"\
	-e "s/c3 8c/5c 5b 60 49 5d/g"\
	-e "s/c3 92/5c 5b 60 4f 5d/g"\
	-e "s/c3 99/5c 5b 60 55 5d/g"\
	-e "s/c3 a0/5c 5b 60 61 5d/g"\
	-e "s/c3 a8/5c 5b 60 65 5d/g"\
	-e "s/c3 ac/5c 5b 60 69 5d/g"\
	-e "s/c3 b2/5c 5b 60 6f 5d/g"\
	-e "s/c3 b9/5c 5b 60 75 5d/g"\
	-e "s/c3 83/5c 5b 7e 41 5d/g"\
	-e "s/c3 91/5c 5b 7e 4e 5d/g"\
	-e "s/c3 95/5c 5b 7e 4f 5d/g"\
	-e "s/c3 a3/5c 5b 7e 61 5d/g"\
	-e "s/c3 b1/5c 5b 7e 6e 5d/g"\
	-e "s/c3 b5/5c 5b 7e 6f 5d/g"\
	-e "s/c3 87/5c 5b 2c 43 5d/g"\
	-e "s/c3 a7/5c 5b 2c 63 5d/g"\
	-e "s/c3 85/5c 5b 6f 41 5d/g"\
	-e "s/c3 a5/5c 5b 6f 61 5d/g"\
	-e "s/c5 b8/5c 5b 3a 59 5d/g"\
	-e "s/c5 a0/5c 5b 76 53 5d/g"\
	-e "s/c5 a1/5c 5b 76 73 5d/g"\
	-e "s/c5 bd/5c 5b 76 5a 5d/g"\
	-e "s/c5 be/5c 5b 76 7a 5d/g"

# Ligatures.
ligatures() sed \
	-e "s/ef ac 80/5c 5b 66 66 5d/g"\
	-e "s/ef ac 81/5c 5b 66 69 5d/g"\
	-e "s/ef ac 82/5c 5b 66 6c 5d/g"\
	-e "s/ef ac 83/5c 5b 46 69 5d/g"\
	-e "s/ef ac 84/5c 5b 46 6c 5d/g"\
	-e "s/c5 81/5c 5b 2f 4c 5d/g"\
	-e "s/c5 82/5c 5b 2f 6c 5d/g"\
	-e "s/c3 98/5c 5b 2f 4f 5d/g"\
	-e "s/c3 b8/5c 5b 2f 6f 5d/g"\
	-e "s/c3 86/5c 5b 41 45 5d/g"\
	-e "s/c3 a6/5c 5b 61 65 5d/g"\
	-e "s/c5 92/5c 5b 4f 45 5d/g"\
	-e "s/c5 93/5c 5b 6f 65 5d/g"\
	-e "s/c4 b2/5c 5b 49 4a 5d/g"\
	-e "s/c4 b3/5c 5b 69 6a 5d/g"\
	-e "s/c4 b1/5c 5b 2e 69 5d/g"\
	-e "s/c8 b7/5c 5b 2e 6a 5d/g"

# Text markers.
text_markers() sed \
	-e "s/e2 97 8b/5c 5b 63 69 5d/g"\
	-e "s/e2 80 a2/5c 5b 62 75 5d/g"\
	-e "s/e2 80 a1/5c 5b 64 64 5d/g"\
	-e "s/e2 80 a0/5c 5b 64 67 5d/g"\
	-e "s/e2 97 8a/5c 5b 6c 7a 5d/g"\
	-e "s/e2 96 a1/5c 5b 73 71 5d/g"\
	-e "s/c2 b6/5c 5b 70 73 5d/g"\
	-e "s/c2 a7/5c 5b 73 63 5d/g"\
	-e "s/e2 98 9c/5c 5b 6c 68 5d/g"\
	-e "s/e2 98 9e/5c 5b 72 68 5d/g"\
	-e "s/e2 86 b5/5c 5b 43 52 5d/g"\
	-e "s/e2 9c 93/5c 5b 4f 4b 5d/g"

# These markers shouldn't be automatically translated in ms macros.
# @ "s/40/5c 5b 61 74 5d/g"
# # "s/23/5c 5b 73 68 5d/g"

# Legal symbols.
legal_symbols() sed \
	-e "s/c2 a9/5c 5b 63 6f 5d/g"\
	-e "s/c2 ae/5c 5b 72 67 5d/g"\
	-e "s/e2 84 a2/5c 5b 74 6d 5d/g"

hexutf8_to_hexms() {
	text_markers | accents | ligatures | legal_symbols
}

to_hex_one_column | regroup_lines | hexutf8_to_hexms | from_hex
