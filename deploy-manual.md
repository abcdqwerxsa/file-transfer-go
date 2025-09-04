# 手动部署指南

## GitHub Pages 手动部署

1. **构建静态文件**
```bash
cd chuan-next
yarn install
yarn build:ssg
```

2. **推送到 gh-pages 分支**
```bash
# 安装 gh-pages 工具
npm install -g gh-pages

# 部署到 gh-pages 分支
gh-pages -d out
```

## Vercel 手动部署

1. **准备环境变量**
在 Vercel 项目设置中添加：
- `NEXT_PUBLIC_BACKEND_URL`: 你的 Go 后端地址
- `NEXT_PUBLIC_WS_URL`: WebSocket 地址
- `NEXT_PUBLIC_API_BASE_URL`: API 基础地址

2. **连接 GitHub 仓库**
- 在 Vercel 控制台导入项目
- 选择 `chuan-next` 作为根目录
- 自动部署

## 重要注意事项

⚠️ **后端部署要求**：
- 静态前端需要独立的 Go 后端服务
- 后端需要支持 CORS 跨域请求
- WebSocket 连接需要 WSS (HTTPS)

🔧 **配置后端 CORS**：
确保你的 Go 后端允许前端域名的跨域请求。