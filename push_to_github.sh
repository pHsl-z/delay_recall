#!/bin/bash

# GitHub仓库推送脚本
# 用于将托管班管理系统推送到GitHub

echo "🚀 准备推送到GitHub..."

# 检查git状态
echo "📋 检查git状态..."
git status

# 添加所有文件
echo "📁 添加所有文件..."
git add .

# 提交更改
echo "💾 提交更改..."
git commit -m "Update: 完善文档和配置文件"

# 检查是否有远程仓库
if git remote -v | grep -q "origin"; then
    echo "🔗 检测到远程仓库，开始推送..."
    git push -u origin main
else
    echo "⚠️  未检测到远程仓库配置"
    echo ""
    echo "请按照以下步骤操作："
    echo "1. 在GitHub上创建新仓库："
    echo "   - 访问 https://github.com/new"
    echo "   - 仓库名：daycare-management-system"
    echo "   - 描述：托管班管理系统 - 完整的Web应用"
    echo "   - 选择 Public"
    echo "   - 不要初始化 README"
    echo ""
    echo "2. 创建仓库后，复制仓库的HTTPS地址"
    echo "   例如：https://github.com/your-username/daycare-management-system.git"
    echo ""
    echo "3. 运行以下命令："
    echo "   git remote add origin 您的仓库地址"
    echo "   git branch -M main"
    echo "   git push -u origin main"
    echo ""
    echo "或者重新运行此脚本，它会自动完成推送"
fi

echo "✅ 完成！"