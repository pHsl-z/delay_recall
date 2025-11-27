# 托管班管理系统

一个完整的托管班管理Web应用，采用React 18 + Supabase架构。

## 功能特性

- 📊 **仪表盘** - 数据概览、学校名称可自定义
- 👥 **学生管理** - 学生信息的增删改查、智能数据同步
- 💰 **收支管理** - 收入记录管理
- 📈 **财务管理** - 全面的财务管理
- ✅ **考勤管理** - 出勤记录、自动出勤
- 📝 **成绩管理** - 成绩录入和查询
- 📚 **作业管理** - 作业发布和批改
- 📅 **学习计划** - 计划制定和跟踪
- 📢 **通知管理** - 消息通知功能
- 📤 **数据导出** - Excel/PDF导出
- 🛠️ **工具箱** - 系统工具集合

## 技术栈

- **前端框架**：React 18 (CDN)
- **样式系统**：Tailwind CSS + Glassmorphism
- **后端服务**：Supabase (PostgreSQL + Auth + Real-time)
- **图表库**：Chart.js
- **表格导出**：SheetJS (xlsx)
- **代码编辑器**：CodeMirror

## 快速开始

1. **配置Supabase连接信息**
   - 修改第107-109行的Supabase配置
   - 替换为您的Project URL和anon public key

2. **在浏览器中直接打开**
   - 直接在浏览器中打开 `index.html` 文件
   - 或使用本地服务器：
   ```bash
   # 使用Python
   python -m http.server 8000
   
   # 或使用Node.js
   npx serve .
   ```

3. **测试账号**
   - 手机号：13800000001
   - 密码：admin123

## 系统要求

- 现代浏览器（Chrome 90+, Firefox 88+, Safari 14+, Edge 90+）
- 互联网连接（用于加载CDN资源和连接Supabase）
- Supabase账户和项目

## 数据库表结构

系统需要以下表：
- `students` - 学生信息
- `transactions` - 收支记录（需要notes和payment_method列）
- `attendance_records` - 考勤记录
- `payment_records` - 缴费记录
- `notifications` - 通知
- `learning_plans` - 学习计划

## 重要配置

- **Supabase配置**：第107-109行
- **学校名称**：第525行（或通过界面编辑）
- **主题颜色**：第24-50行
- **节假日列表**：第588-596行、第1562-1570行
- **默认签到时间**：第1585行

## 安全提示

- 部署前修改默认密码
- 不要将Supabase密钥提交到公开仓库
- 生产环境使用HTTPS
- 启用RLS（行级安全）策略

## 许可证

仅供学习和内部使用

## 作者

MiniMax Agent

最后更新：2025-11-09