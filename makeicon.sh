#!/bin/bash

# Имя исходного файла без расширения
filename="telegram"

# Создаём временную директорию
mkdir ${filename}.iconset

# Изменяем размеры изображения и сохраняем их в папку iconset
sips -z 16 16     ${filename}.png --out ${filename}.iconset/icon_16x16.png
sips -z 32 32     ${filename}.png --out ${filename}.iconset/icon_16x16@2x.png
sips -z 32 32     ${filename}.png --out ${filename}.iconset/icon_32x32.png
sips -z 64 64     ${filename}.png --out ${filename}.iconset/icon_32x32@2x.png
sips -z 128 128   ${filename}.png --out ${filename}.iconset/icon_128x128.png
sips -z 256 256   ${filename}.png --out ${filename}.iconset/icon_128x128@2x.png
sips -z 256 256   ${filename}.png --out ${filename}.iconset/icon_256x256.png
sips -z 512 512   ${filename}.png --out ${filename}.iconset/icon_256x256@2x.png
sips -z 512 512   ${filename}.png --out ${filename}.iconset/icon_512x512.png
sips -z 1024 1024 ${filename}.png --out ${filename}.iconset/icon_512x512@2x.png

# Конвертируем папку .iconset в файл .icns
iconutil -c icns ${filename}.iconset

# Удаляем временную директорию
rm -R ${filename}.iconset

# Добавляем комментарий к файлу
osascript -e 'set theFile to POSIX file "'"${PWD}/${filename}.icns"'" as alias' -e 'tell application "Finder" to set comment of theFile to "2023©Made by VladGohn with AI"'
