#!/bin/bash
# ralph.sh
# Usage: ./ralph.sh <iterations>
set -e
if [ -z "$1" ]; then
  echo "Usage: $0 <iterations>"
  exit 1
fi

# 删除任务结束标志文件
DONE_FILE="./done.txt" 
rm -f $DONE_FILE

# 开始牛马循环
for ((i=1; i<=$1; i++)); do
  # 每次迭代：运行 Claude Code，传入相同的提示
  result=$(cat prompt.md | claud --dangerously-skip-permissions -p) 
  echo "$result"
  if [ -f "$DONE_FILE" ]; then 
    echo "任务完成，退出。"
    exit 0
  fi
done


