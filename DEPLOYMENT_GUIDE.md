# 部署指南

## GitHub上传步骤

### 方法1：使用GitHub网页界面

1. **打开GitHub网站**
   - 访问 https://github.com
   - 登录您的GitHub账户

2. **创建新仓库**
   - 点击右上角的 "+" 按钮
   - 选择 "New repository"
   - 填写仓库信息：
     - Repository name: `daycare-management-system`
     - Description: `托管班管理系统 - 完整的Web应用，采用React 18 + Supabase架构`
     - 选择 "Public"
     - **不要**勾选 "Initialize this repository with a README"
   - 点击 "Create repository"

3. **获取仓库地址**
   - 创建完成后，复制仓库的HTTPS地址
   - 格式类似：`https://github.com/你的用户名/daycare-management-system.git`

4. **推送到GitHub**
   在终端中运行：
   ```bash
   cd "/Users/t.song/Library/Mobile Documents/com~apple~CloudDocs/Downloads/tgnew/delay_recall"
   git remote add origin https://github.com/你的用户名/daycare-management-system.git
   git branch -M main
   git push -u origin main
   ```

### 方法2：使用推送脚本

运行我为您创建的推送脚本：
```bash
./push_to_github.sh
```

脚本会引导您完成推送过程。

## 部署到GitHub Pages

上传成功后，您可以启用GitHub Pages来在线访问应用：

1. 进入仓库设置页面
2. 找到 "Pages" 选项
3. 选择部署源为 "Deploy from a branch"
4. 选择 "main" 分支和 "/ (root)" 目录
5. 点击保存

几分钟后，您就可以通过 `https://你的用户名.github.io/daycare-management-system` 访问应用了。

## 其他部署选项

### 1. Netlify部署

1. 访问 https://netlify.com
2. 拖拽 `index.html` 文件到部署区域
3. 自动获得在线访问地址

### 2. Vercel部署

1. 访问 https://vercel.com
2. 导入GitHub仓库
3. 自动部署并获得域名

### 3. 静态托管服务

- 阿里云OSS
- 腾讯云COS
- 七牛云
- 又拍云

## 配置注意事项

### 1. Supabase配置
上传前请确保：
- 已配置正确的Supabase连接信息
- 已创建必要的数据库表
- 已启用行级安全(RLS)

### 2. 安全设置
- 修改默认测试账号密码
- 启用HTTPS
- 配置CORS策略

### 3. 性能优化
- 启用CDN加速
- 压缩静态资源
- 配置缓存策略

## 验证部署

部署完成后，请验证以下功能：

1. ✅ 页面正常加载
2. ✅ 可以登录系统
3. ✅ 学生管理功能正常
4. ✅ 数据可以正常保存和读取
5. ✅ 导出功能可用

## 故障排除

### 常见问题

**问题1：页面空白**
- 检查浏览器控制台错误
- 确认所有CDN资源加载正常
- 验证Supabase连接

**问题2：无法保存数据**
- 检查Supabase表结构
- 确认RLS策略配置
- 验证用户权限

**问题3：样式异常**
- 检查Tailwind CSS加载
- 确认网络连接正常
- 清除浏览器缓存

### 获取帮助

如遇到问题，可以：
1. 查看浏览器控制台错误信息
2. 检查Supabase日志
3. 参考项目文档
4. 在GitHub Issues中寻求帮助

## 更新维护

### 定期更新
- 关注Supabase更新
- 及时修复安全漏洞
- 优化用户体验

### 备份策略
- 定期备份数据库
- 保存配置文件副本
- 记录重要变更