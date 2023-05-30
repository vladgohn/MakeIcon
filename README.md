<p align="left">
  <img src="./resouces/MakeIconApp.png" width="128" alt="Иконка Visual Studio Code">
</p>

# Bash MakeIcon
Bash MakeIcon - это простой bash-скрипт для преобразования изображения PNG в иконку ICNS на Mac. Этот скрипт также добавляет кастомный комментарий в метаданные иконки.

## Использование
Скачайте или клонируйте этот репозиторий на ваш компьютер.
Откройте терминал и перейдите в папку с файлом `makeicon.sh`.
Дайте файлу makeicon.sh разрешение на выполнение с помощью команды

```bash
chmod +x makeicon.sh
```

Запустите скрипт и передайте ему путь к файлу `PNG`, который вы хотите преобразовать в иконку ICNS: `./makeicon.sh /path/to/your/image.png`.
Готово! Ваш новый файл `.icns` будет находиться в той же папке, что и исходное изображение PNG.

## Интеграция в оболочку
Вы можете добавить функцию makeicon в ваш ~/.bashrc или ~/.zshrc файл для удобства использования из любого места в терминале. Добавьте следующую функцию в ваш `~/.bashrc` или `~/.zshrc` файл:

```bash
makeicon() {
    # Имя исходного файла без расширения
    filename=$(basename "$1" .png)

    # Создаём временную директорию
    mkdir ${filename}.iconset

    # Изменяем размеры изображения и сохраняем их в папку iconset
    sips -z 16 16     $1 --out ${filename}.iconset/icon_16x16.png
    sips -z 32 32     $1 --out ${filename}.iconset/icon_16x16@2x.png
    sips -z 32 32     $1 --out ${filename}.iconset/icon_32x32.png
    sips -z 64 64     $1 --out ${filename}.iconset/icon_32x32@2x.png
    sips -z 128 128   $1 --out ${filename}.iconset/icon_128x128.png
    sips -z 256 256   $1 --out ${filename}.iconset/icon_128x128@2x.png
    sips -z 256 256   $1 --out ${filename}.iconset/icon_256x256.png
    sips -z 512 512   $1 --out ${filename}.iconset/icon_256x256@2x.png
    sips -z 512 512   $1 --out ${filename}.iconset/icon_512x512.png
    sips -z 1024 1024 $1 --out ${filename}.iconset/icon_512x512@2x.png

    # Конвертируем папку .iconset в файл .icns
    iconutil -c icns ${filename}.iconset

    # Удаляем временную директорию
    rm -R ${filename}.iconset

    # Добавляем комментарий к файлу
    osascript -e 'set theFile to POSIX file "'"${PWD}/${filename}.icns"'" as alias' -e 'tell application "Finder" to set comment of theFile to "2023©Made by VladGohn with AI"'
}
```
Теперь вы можете использовать команду makeicon в терминале с путем к файлу .png в качестве аргумента.
