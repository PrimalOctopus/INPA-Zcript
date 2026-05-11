﻿# INPA-Zcript

INPA-Zcript is a collection of tools and scripts which improve the functionality of INPA. Allowing logging to disk and monitoring of additional parameters not usually exposed.

________________________________________________________
INPA_Crawler:   Helps you find relevant ECU files.\
.vscode:    Contains project settings and batch scripts that make building and running your scripts faster and easier.\
ECU:    Contains scripts for logging/monitoring for various engines/DME's.
________________________________________________________
## How to use:

Use [INPA CRAWLER](\INPA CRAWLER\INPA-Crawler.py) to find your ECU file.\
Edit the last line of INPA-Crawler.py to include your search term, for example:\
>print(Crawl_ECU("N42"))

To search for the N42 motor.\

Extract "ecu-name.prg" using 
>C:\EDIABAS\Bin\xtract.exe ecu.name.prg -F

Please note INPA_Crawler may return multiple files in which case I recommend manually comparing their contents.\\

Find the jobs you want to run in the newly created file 
>C:\EDIABAS\Bin\ecu-name.biv
_______________________________________________________
Consult "C:\EC-APPS\INPA\DOKU" for documentation on how to write INPA script.\

Write your script and then compile it using either.

>"C:\EC-APPS\INPA\BIN\INPACOMP.exe"

OR

[VSCODE](\.vscode) project config.
