#!/bin/bash

# DESKTOP 디렉터리 경로
desktop_path="$HOME/Desktop"

# yeonhui.php 파일 경로
yeonhui_file_path=$(find "$desktop_path" -type f -name "yeonhui.php")

if [ -z "$yeonhui_file_path" ]; then
  echo "yeonhui.php 파일을 찾을 수 없습니다."
  exit 1
fi

# DESKTOP 디렉터리 내의 모든 index.php 파일에 대해 작업 수행
find "$desktop_path" -type f -name "index.php" | while IFS= read -r index_file; do
  # index.php 파일이 있는 디렉터리 경로
  index_directory=$(dirname "$index_file")
  
  # yeonhui.php 파일을 해당 디렉터리로 복사
  cp "$yeonhui_file_path" "$index_directory"
done

# 복사한 yeonhui.php 파일에 실행 권한 부여
find "$desktop_path" -type f -name "yeonhui.php" -exec chmod +x {} +

echo "작업이 완료되었습니다."
