-- D1 数据库初始化脚本
-- 在 Cloudflare Dashboard -> D1 -> 你的数据库 -> Console 中执行

-- 用户表
CREATE TABLE IF NOT EXISTS users (
    id TEXT PRIMARY KEY,
    username TEXT NOT NULL,
    name TEXT,
    avatar_url TEXT,
    share_code TEXT UNIQUE NOT NULL,
    share_password TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 会话表
CREATE TABLE IF NOT EXISTS sessions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    token TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 文件表
CREATE TABLE IF NOT EXISTS files (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    file_id TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    filename TEXT NOT NULL,
    size INTEGER NOT NULL,
    type TEXT,
    storage_key TEXT,
    upload_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    expire_time DATETIME,
    deleted INTEGER DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 创建索引
CREATE INDEX IF NOT EXISTS idx_files_user_id ON files(user_id);
CREATE INDEX IF NOT EXISTS idx_files_file_id ON files(file_id);
CREATE INDEX IF NOT EXISTS idx_users_share_code ON users(share_code);
CREATE INDEX IF NOT EXISTS idx_sessions_token ON sessions(token);
