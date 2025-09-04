#!/bin/bash

# GitHub Pages 静态构建脚本
echo "🚀 开始 GitHub Pages 构建..."

# 设置环境变量
export NODE_ENV=production
export NEXT_EXPORT=true
export NEXT_PUBLIC_BACKEND_URL="https://your-go-backend-domain.com"
export NEXT_PUBLIC_WS_URL="wss://your-go-backend-domain.com/ws"
export NEXT_PUBLIC_API_BASE_URL="https://your-go-backend-domain.com"

# 备份 API 路由（如果存在）
if [ -d "src/app/api" ]; then
    echo "📦 备份 API 路由..."
    mkdir -p /tmp/api-backup
    mv src/app/api /tmp/api-backup/
fi

# 清理之前的构建
echo "🧹 清理构建文件..."
rm -rf .next out

# 执行构建
echo "🔨 执行静态构建..."
yarn build

# 恢复 API 路由
if [ -d "/tmp/api-backup/api" ]; then
    echo "🔄 恢复 API 路由..."
    mv /tmp/api-backup/api src/app/
    rmdir /tmp/api-backup
fi

echo "✅ GitHub Pages 构建完成！"
echo "📁 输出目录: out/"