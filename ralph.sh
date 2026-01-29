#!/bin/bash
# ralph.sh
# Usage: ./ralph.sh <iterations>
set -e
if [ -z "$1" ]; then
  echo "Usage: $0 <iterations>"
  exit 1
fi

# 删除任务结束标志文件
DONE_FILE="./done.txt" 
rm -f $DONE_FILE

# 开始牛马循环
for ((i=1; i<=$1; i++)); do
  echo "=== 迭代 $i / $1 ==="
  
  # 每次迭代：运行 Claude Code，传入相同的提示
  cat prompt.md | claude --dangerously-skip-permissions -p
  
  if [ -f "$DONE_FILE" ]; then
    echo "检测到任务结束标志文件 $DONE_FILE，退出循环"
    break
  fi
  echo "===未检测到完成标志==="
done

