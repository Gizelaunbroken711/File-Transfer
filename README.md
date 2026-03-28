# 文件中转站 | File Transfer

基于 Cloudflare Workers + R2 的文件分享服务，支持大文件分片上传，最大支持 100GB。
![community](https://github.com/user-attachments/assets/653f2b6b-ee32-4f0f-abe0-1ba96e4bb473)

## 功能特性

- **大文件支持**：最大支持 100GB 文件上传
- **分片上传**：大于 100MB 的文件自动使用分片上传，避免超时
- **分享密码**：可为文件设置访问密码
- **过期自动清理**：文件可设置过期时间，过期自动删除
- **临时下载链接**：下载链接 5 分钟有效，安全可靠
- **二维码分享**：一键生成分享二维码
- **并发上传**：支持多文件同时上传

## 部署

### 1. 创建 Cloudflare Workers

```bash
# 使用 wrangler CLI
wrangler login
wrangler init file-transfer
```

### 2. 创建 R2 Bucket

在 Cloudflare Dashboard 中创建一个 R2 Bucket，名称默认为 `file-transfer`（可在配置中修改）。

### 3. 绑定 R2 Bucket

在 `wrangler.toml` 中添加：

```toml
[[r2_buckets]]
binding = "file-transfer"
bucket_name = "file-transfer"
```

### 4. 部署

```bash
wrangler deploy
```

## 配置

编辑 `worker.js` 中的 `CONFIG` 对象：

```javascript
const CONFIG = {
  // R2 Bucket 名称
  BUCKET_NAME: 'file-transfer',
  
  // 全局访问密码（留空则不启用）
  ACCESS_PASSWORD: '',
  
  // 文件分享密码密钥（用于生成临时下载签名）
  SHARE_SECRET_KEY: '',
  
  // 临时下载链接有效期（毫秒）默认5分钟
  TEMP_LINK_EXPIRE: 5 * 60 * 1000,
  
  // 文件大小限制（字节）默认 100GB
  MAX_FILE_SIZE: 100 * 1024 * 1024 * 1024,
  
  // 文件过期时间（毫秒）默认 7天，0 表示永不过期
  FILE_EXPIRE_TIME: 7 * 24 * 60 * 60 * 1000,
  
  // 允许的文件类型（留空数组表示允许所有）
  ALLOWED_TYPES: [],
  
  // 自定义域名（可选）
  CUSTOM_DOMAIN: '',
  
  // 最大并发上传数
  MAX_CONCURRENT_UPLOADS: 3,
  
  // 分片上传配置
  CHUNK_SIZE: 50 * 1024 * 1024,  // 分片大小 50MB
  MULTIPART_THRESHOLD: 100 * 1024 * 1024,  // 大于100MB启用分片
};
```

## API 接口

### 获取上传链接
```http
POST /api/upload-url
Content-Type: application/json

{
  "filename": "example.zip",
  "size": 104857600,
  "type": "application/zip",
  "password": "optional-share-password"
}
```

响应：
```json
{
  "uploadUrl": "...",
  "fileId": "...",
  "downloadUrl": "...",
  "hasPassword": false,
  "useMultipart": true,
  "chunkSize": 52428800
}
```

### 上传文件（小文件）
```http
PUT /api/upload/{fileId}
Content-Type: {file-type}

[binary data]
```

### 分片上传（大文件）

1. **初始化分片上传**
```http
POST /api/multipart/create
Content-Type: application/json

{
  "fileId": "...",
  "totalChunks": 20
}
```

2. **上传分片**
```http
POST /api/multipart/upload?fileId={fileId}&chunkIndex=0

[binary chunk data]
```

3. **完成分片上传**
```http
POST /api/multipart/complete
Content-Type: application/json

{
  "fileId": "..."
}
```

### 下载文件

访问分享链接：`/d/{fileId}`

如果需要密码，会显示密码输入页面。验证通过后会自动跳转到临时下载链接。

## 技术说明

### 分片上传原理

1. 前端将大文件切分为 50MB 的分片
2. 逐个上传分片，失败自动重试（最多 3 次）
3. 同时上传 2 个分片，控制并发
4. 后端将分片保存在 R2 中
5. 下载时按顺序流式读取所有分片

### 安全特性

- 所有下载链接都是临时的（默认 5 分钟有效）
- 支持设置文件访问密码
- 支持设置全局访问密码
- 文件可设置过期时间

## 注意事项

1. Cloudflare Workers 免费版有每日 100,000 次请求限制
2. R2 存储有容量和出站流量限制
3. 分片上传时，Workers 内存限制为 128MB，因此单分片大小不能超过 50MB
4. 大文件下载时，由于需要流式读取多个分片，首字节时间可能稍长

## 许可证

Apache License 2.0
