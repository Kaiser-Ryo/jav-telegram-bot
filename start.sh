#!/bin/bash

# 检查是否提供HTML_URL
if [ -n "$HTML_URL" ]; then
  echo "正在下载自定义HTML文件: $HTML_URL"
  if curl -sSLf "$HTML_URL" -o /app/index.html; then
    echo "自定义HTML下载成功"
  else
    echo "下载失败，检查网络或URL有效性"
    exit 1
  fi
else
  # 仅在默认文件不存在时创建
  if [ ! -f /app/index.html ]; then
    echo "生成默认HTML文件"
    cat <<EOF > /app/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
        }
        .content {
            text-align: center;
            padding: 2rem;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="content">
        <h1>Hello World!</h1>
        <p>Current time: <span id="time"></span></p>
    </div>
    <script>
        function updateTime() {
            document.getElementById('time').textContent = new Date().toLocaleString();
        }
        setInterval(updateTime, 1000);
        updateTime();
    </script>
</body>
</html>
EOF
  else
    echo "检测到已有index.html文件"
  fi
fi

# 启动服务
echo "启动Web服务和机器人"
python -m http.server 8080 & 
python tgbot.py &
wait