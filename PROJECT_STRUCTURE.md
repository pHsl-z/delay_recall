# 项目结构说明

## 文件结构

```
daycare-management-system/
├── index.html          # 主应用文件（包含所有前端代码）
├── README.md           # 项目说明文档
└── PROJECT_STRUCTURE.md # 项目结构文档
```

## 技术架构

### 前端技术
- **React 18**: 用户界面框架
- **Tailwind CSS**: 样式框架
- **Chart.js**: 数据可视化
- **Babel**: JSX转译

### 后端服务
- **Supabase**: 
  - PostgreSQL数据库
  - 身份认证
  - 实时数据同步

### 第三方库
- **React**: `https://unpkg.com/react@18/umd/react.development.js`
- **React DOM**: `https://unpkg.com/react-dom@18/umd/react-dom.development.js`
- **Babel**: `https://unpkg.com/@babel/standalone/babel.min.js`
- **Tailwind CSS**: `https://cdn.tailwindcss.com`
- **Supabase**: `https://unpkg.com/@supabase/supabase-js@2.39.0/dist/umd/supabase.js`
- **Chart.js**: `https://unpkg.com/chart.js@4.4.0/dist/chart.umd.js`
- **SheetJS**: `https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js`
- **CodeMirror**: 代码编辑器

## 功能模块

### 1. 仪表盘模块
- 数据概览
- 图表展示
- 快速统计

### 2. 学生管理模块
- 学生信息CRUD
- 托管方式管理
- 数据导入导出

### 3. 财务管理模块
- 收支记录
- 缴费管理
- 财务报表

### 4. 考勤管理模块
- 签到签退
- 出勤统计
- 请假管理

### 5. 成绩管理模块
- 成绩录入
- 成绩查询
- 成绩分析

### 6. 作业管理模块
- 作业发布
- 作业提交
- 作业批改

### 7. 学习计划模块
- 计划制定
- 进度跟踪
- 学习评估

### 8. 通知管理模块
- 消息推送
- 公告发布
- 提醒功能

## 配置说明

### Supabase配置
在 `index.html` 第107-109行：
```javascript
const supabaseUrl = '您的Supabase项目URL';
const supabaseAnonKey = '您的Supabase anon public key';
```

### 学校信息配置
在 `index.html` 第525行可以修改学校名称。

### 主题配置
在 `index.html` 第24-50行可以自定义主题颜色。

## 部署说明

### 本地部署
1. 直接打开 `index.html` 文件
2. 或使用本地服务器：
   ```bash
   # Python
   python -m http.server 8000
   
   # Node.js
   npx serve .
   ```

### 在线部署
支持部署到任何静态文件托管服务：
- GitHub Pages
- Netlify
- Vercel
- 阿里云OSS
- 腾讯云COS

## 注意事项

1. **数据库配置**: 需要在Supabase中创建相应的表结构
2. **安全设置**: 生产环境需要启用RLS（行级安全）策略
3. **密钥管理**: 不要将真实的Supabase密钥提交到公开仓库
4. **HTTPS**: 生产环境建议使用HTTPS协议

## 更新日志

### v3.5.0 (2025-11-09)
- 完整的托管班管理系统
- 支持学生管理、财务管理、考勤管理等核心功能
- 集成Supabase后端服务
- 响应式设计，支持移动端
- 数据导出功能
- 通知管理系统