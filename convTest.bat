rem @echo off
nbdev_nb2md.exe 20_Examples.ipynb
nbdev_nb2md.exe 30_CodeExample.ipynb
nbdev_nb2md.exe 31_klauswertTests.ipynb

type 20_Examples.md > gesamtDoku.md
type 31_klauswertTests.md >> gesamtDoku.md

rem hier beginnt der Anhang
type AnhangStart.md >> gesamtDoku.md
type 30_CodeExample.md >> gesamtDoku.md

rem Zeilenumbruch vor Quellenverzeichnis
rem echo '\newpage ' >> gesamtDoku.md

rem Umwandlung in utf8-Format
Powershell.exe -Command "Get-Content gesamtDoku.md | Set-Content -Encoding utf8 gesamtDoku8.md"

rem set DATE="`date +%Y-%m-%d`"

rem # echo $DATE

rem --metadata date="$DATE" ^
rem --variable mainfont="Palatino" ^
rem --pdf-engine=xelatex ^
rem --include-after-body=anhang.tex ^
rem -s -o gesamtDoku8.tex

pandoc -N ^
--template=URSeisvogel.tex ^
--listings ^
--variable fontsize=12pt ^
--pdf-engine=pdflatex ^
--toc ^
--bibliography=WDBK.bib --csl hochschule-bonn-rhein-sieg.csl ^
--from markdown ^
gesamtDoku8.md ^
-o gesamtDoku.pdf

