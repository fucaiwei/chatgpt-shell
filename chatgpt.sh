#!/bin/bash

#caiwei
#https://github.com/fucaiwei/chatgpt-shell.git

URL="https://api.openai.com/v1/chat/completions"
MODEL="gpt-3.5-turbo"
ROLE="user"

# 设置OpenAI API密钥和其他请求参数
read -p "请输入OPENAI_API_KEY: " OPENAI_API_KEY

# 循环对话
while true; do
  # 读取用户输入
  read -p "请输入内容: " MESSAGE

  # 发送请求并获取回复
  RESPONSE=$(curl -s -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d "{\"model\":\"$MODEL\",\"messages\":[{\"role\":\"$ROLE\",\"content\":\"$MESSAGE\"}]}" \
    $URL | jq -r '.choices[0].message.content')

  # 输出AI回复
  echo "AI: $RESPONSE"
done
