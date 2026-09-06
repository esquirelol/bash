#!/bin/bash

set -euo pipefail

if [[ $# -ne 1 ]]; then
	echo "Неверное количество аргументов"
	exit 1
fi

if [[ ! -d  "$1" ]]; then
	echo "Такой папки не существует"
	exit 2
fi

countdocs=0
countimages=0
countarchives=0
countother=0

for file in "$1"/*; do
	echo "Обрабатывается файл "$file" "
case "$file" in
	*.txt|*.pdf|*.doc)
	mkdir -p docs
	mv "$file" docs/
	countdocs=$((countdocs + 1))
	;;
	*.jpg|*.png|*.gif)
	mkdir -p images
	mv "$file" images/
	countimages=$((countimages + 1))
	;;
	*.zip|*.tar|*.gz)
	mkdir -p archives
	mv "$file" archives/
	countarchives=$((countarchives + 1))
	;;
	*)
	mkdir -p other
	mv "$file" other/
	countother=$((countother + 1))
	;;

esac
done

echo "Документов: "$countdocs""
echo "Изображений: "$countimages""
echo "Архивов: "$countarchives""
echo "Прчоих: "$countother""
