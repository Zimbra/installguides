#!/bin/bash
if [ $# -eq 0 ]; then
  echo "Building all docs in place."
  loc="."
else
  echo "Building in target directory: $1"
  loc=$1
fi

echo "multi-server-install.adoc..."
asciidoctor -b html5 -o $loc/multi.html multi-server-install.adoc
asciidoctor-pdf -a allow-uri-read -o $loc/multi-server-install.pdf multi-server-install.adoc

echo "single-server-install.adoc..."
asciidoctor -b html5 -o $loc/single.html index-single-server-install.adoc
asciidoctor-pdf -a allow-uri-read -o $loc/single-server-install.pdf index-single-server-install.adoc

echo "upgrade.adoc..."
asciidoctor -b html5 -o $loc/upgrade.html upgrade.adoc
asciidoctor-pdf -o $loc/upgrade.pdf upgrade.adoc

echo "done"
