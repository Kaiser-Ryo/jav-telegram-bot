FROM python:3.11-slim-bookworm

WORKDIR /app

# 安装系统依赖
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libxml2-dev \
    libxslt1-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

# 安装Python依赖
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# 复制所有文件（自动排除 .dockerignore 中的内容）
COPY . .

# 暴露网页端口
EXPOSE 8080

# 同时运行网页服务和机器人
CMD ["sh", "-c", "python -m http.server 8080 & python tgbot.py"]
