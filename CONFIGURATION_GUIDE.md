# 配置指南

## Supabase配置

### 1. 创建Supabase项目

1. 访问 [https://supabase.com](https://supabase.com)
2. 注册/登录账户
3. 创建新项目
4. 记录项目信息：
   - Project URL
   - anon public key

### 2. 配置应用

在 `index.html` 中修改第107-109行：

```javascript
const supabaseUrl = 'https://your-project.supabase.co';  // 替换为您的Project URL
const supabaseAnonKey = 'your-anon-public-key';           // 替换为您的anon public key
```

### 3. 创建数据库表

在Supabase SQL编辑器中执行以下SQL语句：

```sql
-- 学生表
CREATE TABLE students (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INTEGER,
    grade VARCHAR(20),
    parent_phone VARCHAR(20),
    address TEXT,
    enrollment_date DATE,
    student_type VARCHAR(50) DEFAULT '月托',
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 收支记录表
CREATE TABLE transactions (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    type VARCHAR(20) NOT NULL, -- 'income' or 'expense'
    amount DECIMAL(10,2) NOT NULL,
    category VARCHAR(50),
    description TEXT,
    date DATE NOT NULL,
    payment_method VARCHAR(50),
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 考勤记录表
CREATE TABLE attendance_records (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    student_id UUID REFERENCES students(id),
    date DATE NOT NULL,
    check_in_time TIME,
    check_out_time TIME,
    status VARCHAR(20) DEFAULT 'present',
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 缴费记录表
CREATE TABLE payment_records (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    student_id UUID REFERENCES students(id),
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method VARCHAR(50),
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 通知表
CREATE TABLE notifications (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    type VARCHAR(50),
    target_audience VARCHAR(50),
    publish_date DATE,
    expiry_date DATE,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 学习计划表
CREATE TABLE learning_plans (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    student_id UUID REFERENCES students(id),
    title VARCHAR(200) NOT NULL,
    content TEXT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(20) DEFAULT 'pending',
    progress INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 成绩表
CREATE TABLE grades (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    student_id UUID REFERENCES students(id),
    subject VARCHAR(50) NOT NULL,
    score DECIMAL(5,2),
    exam_date DATE,
    exam_type VARCHAR(50),
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 作业表
CREATE TABLE homework (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT,
    subject VARCHAR(50),
    due_date DATE,
    assigned_date DATE DEFAULT CURRENT_DATE,
    status VARCHAR(20) DEFAULT 'assigned',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 作业提交表
CREATE TABLE homework_submissions (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    homework_id UUID REFERENCES homework(id),
    student_id UUID REFERENCES students(id),
    submission_content TEXT,
    submission_date TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    grade DECIMAL(5,2),
    feedback TEXT,
    status VARCHAR(20) DEFAULT 'submitted',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### 4. 启用行级安全（RLS）

为每个表启用RLS：

```sql
-- 为学生表启用RLS
ALTER TABLE students ENABLE ROW LEVEL SECURITY;

-- 为收支记录表启用RLS
ALTER TABLE transactions ENABLE ROW LEVEL SECURITY;

-- 为考勤记录表启用RLS
ALTER TABLE attendance_records ENABLE ROW LEVEL SECURITY;

-- 为缴费记录表启用RLS
ALTER TABLE payment_records ENABLE ROW LEVEL SECURITY;

-- 为通知表启用RLS
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;

-- 为学习计划表启用RLS
ALTER TABLE learning_plans ENABLE ROW LEVEL SECURITY;

-- 为成绩表启用RLS
ALTER TABLE grades ENABLE ROW LEVEL SECURITY;

-- 为作业表启用RLS
ALTER TABLE homework ENABLE ROW LEVEL SECURITY;

-- 为作业提交表启用RLS
ALTER TABLE homework_submissions ENABLE ROW LEVEL SECURITY;
```

## 应用配置

### 1. 学校信息配置

在 `index.html` 第525行修改学校名称：

```javascript
const schoolName = '您的学校名称';
```

### 2. 主题配置

在 `index.html` 第24-50行可以自定义主题颜色：

```javascript
tailwind.config = {
    theme: {
        extend: {
            colors: {
                primary: {
                    50: '#EBF5FF',
                    500: '#007AFF',
                    700: '#0056B3',
                },
                // 可以修改这些颜色值
            }
        }
    }
}
```

### 3. 节假日配置

在 `index.html` 第588-596行和第1562-1570行配置节假日：

```javascript
const holidays = [
    '2025-01-01', // 元旦
    '2025-02-11', // 春节
    '2025-02-12', // 春节
    // 添加更多节假日
];
```

### 4. 签到时间配置

在 `index.html` 第1585行设置默认签到时间：

```javascript
const defaultCheckInTime = '08:00';
```

## 环境配置

### 开发环境
- 直接打开 `index.html` 文件
- 或使用本地服务器：
  ```bash
  python -m http.server 8000
  # 或
  npx serve .
  ```

### 生产环境
- 部署到静态文件托管服务
- 配置HTTPS
- 设置正确的CORS策略
- 配置域名

## 测试账号

默认测试账号：
- 手机号：13800000001
- 密码：admin123

⚠️ **重要提醒**：部署到生产环境前请务必修改默认密码！

## 故障排除

### 常见问题

1. **Supabase连接失败**
   - 检查Project URL和anon key是否正确
   - 确认网络连接正常
   - 检查CORS设置

2. **数据库表不存在**
   - 确保已执行所有SQL创建语句
   - 检查表名是否正确
   - 确认用户权限

3. **数据无法保存**
   - 检查RLS策略是否正确配置
   - 确认用户认证状态
   - 查看浏览器控制台错误信息

### 调试建议

1. 打开浏览器开发者工具
2. 查看控制台错误信息
3. 检查网络请求状态
4. 验证Supabase连接

## 更新和维护

### 备份策略
- 定期备份Supabase数据库
- 保存应用配置文件的副本
- 记录重要的配置变更

### 版本更新
- 关注Supabase的更新
- 及时更新依赖库
- 测试新功能的兼容性