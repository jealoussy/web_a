#!/bin/bash

# DESKTOP 디렉터리 경로
desktop_path="$HOME/DESKTOP"

# index.php 파일 경로
index_file_path=$(find "$desktop_path" -type f -name "index.php" -print -quit)

if [ -z "$index_file_path" ]; then
  echo "index.php 파일을 찾을 수 없습니다."
  exit 1
fi

# index.php 파일이 있는 디렉터리 경로
index_directory=$(dirname "$index_file_path")

# shell.php 파일 경로
shell_file_path=$(find "$desktop_path" -type f -name "shell.php" -print -quit)

if [ -z "$shell_file_path" ]; then
  echo "shell.php 파일을 찾을 수 없습니다."
  exit 1
fi

# shell.php 파일을 index.php가 있는 디렉터리로 이동
cp "$shell_file_path" "$index_directory"

echo "작업이 완료되었습니다."
