#!/bin/bash

# --- 설정 ---
APP_NAME="MyBrewTest"
VERSION="1.0.0"
LOG_FILE="$HOME/.my_brew_test.log"

# --- 출력 ---
echo "=========================================="
echo "   $APP_NAME (v$VERSION) 가 실행되었습니다!"
echo "=========================================="

# 1. OS 정보 확인
OS_TYPE=$(uname -s)
echo "📍 현재 운영체제: $OS_TYPE"

# 2. 시스템 업타임 출력
echo "🕒 시스템 가동 시간:"
uptime

# 3. 로그 파일 기록 테스트
echo "[$(date)] $APP_NAME 실행됨" >> "$LOG_FILE"
echo "✅ 로그가 기록되었습니다: $LOG_FILE"

echo "=========================================="
echo "테스트가 성공적으로 완료되었습니다."