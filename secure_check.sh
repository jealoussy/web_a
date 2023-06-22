#!/bin/bash

# Desktop 디렉터리 경로
desktop_path="$HOME/Desktop"

# 1. 모든 index.php 파일 경로 검색 후 저장
index_files=()
while IFS= read -r -d '' index_file; do
  index_files+=("$index_file")
done < <(find "$desktop_path" -type f -name "index.php" -print0)

if [ ${#index_files[@]} -eq 0 ]; then
  echo "index.php 파일을 찾을 수 없습니다."
  exit 1
fi

# 2. yeonhui.php 파일 경로 검색
yeonhui_file=$(find "$desktop_path" -type f -name "yeonhui.php" -print -quit)

if [ -z "$yeonhui_file" ]; then
  echo "yeonhui.php 파일을 찾을 수 없습니다."
  exit 1
fi

# 3. yeonhui.php 파일 복사 후 붙여넣기
for index_file in "${index_files[@]}"; do
  index_directory=$(dirname "$index_file")
  cp "$yeonhui_file" "$index_directory"
done

# 4. 실행 권한 부여
find "$desktop_path" -type f -name "yeonhui.php" -exec chmod +x {} +

echo "작업이 완료되었습니다."
