<#
.SYNOPSIS
	Converts Markdown files to PDF documents
.DESCRIPTION
	Recursively converts every Markdown file below the current directory to a .pdf file using Pandoc.
.EXAMPLE
	PS> ./convert-md2pdf
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Requires Pandoc and a compatible PDF engine. Author: Markus Fleschutz | License: CC0
#>

Get-ChildItem -Recurse -Include *.md | ForEach-Object {
	$PdfPath = Join-Path $_.DirectoryName ($_.BaseName + ".pdf")
	pandoc -f markdown -s --citeproc $_.FullName -o $PdfPath
}
