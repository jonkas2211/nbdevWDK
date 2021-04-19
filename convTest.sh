#!/bin/sh

nbdev_nb2md 20_Examples.ipynb
nbdev_nb2md 30_CodeExample.ipynb
nbdev_nb2md 31_klauswertTests.ipynb

cat 20_Examples.md > test.md
cat 31_klauswertTests.md >> test.md

cat 30_CodeExample.md > Anhang.md

cat AnhangStart.md >> test.md

cat Anhang.md >> test.md

echo '\\newpage \n' >> test.md

pandoc  Anhang.md -o anhang.tex

DATE="`date +%Y-%m-%d`"

# echo $DATE
# --variable mainfont="Palatino" \

pandoc -N \
--template=URSeisvogel.tex \
--listings \
--variable fontsize=12pt \
--pdf-engine=pdflatex \
--toc \
--from markdown \
--metadata date="$DATE" \
--bibliography=WDBK.bib --csl hochschule-bonn-rhein-sieg.csl \
test.md \
-o DokuExample.pdf

# --include-after-body=anhang.tex \

