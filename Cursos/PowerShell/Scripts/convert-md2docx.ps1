<#
.SYNOPSIS
	Converts Markdown files to Microsoft Word documents
.DESCRIPTION
	Recursively converts every Markdown file below the current directory to a .docx file using Pandoc.
.EXAMPLE
	PS> ./convert-md2docx
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Requires Pandoc. Author: Markus Fleschutz | License: CC0
#>

Get-ChildItem -Recurse -Include *.md | ForEach-Object {
	$DocxPath = Join-Path $_.DirectoryName ($_.BaseName + ".docx")
	pandoc -f markdown -s --citeproc $_.FullName -o $DocxPath
}
