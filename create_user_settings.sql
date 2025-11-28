-- 创建用户设置表，用于存储用户偏好设置
CREATE TABLE user_settings (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    last_care_days INTEGER DEFAULT 5,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    
    -- 确保每个用户只有一条记录
    CONSTRAINT unique_user_id UNIQUE (user_id)
);

-- 创建索引以提高查询性能
CREATE INDEX idx_user_settings_user_id ON user_settings(user_id);

-- 创建更新时间的触发器
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = timezone('utc'::text, now());
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_user_settings_updated_at 
    BEFORE UPDATE ON user_settings 
    FOR EACH ROW 
    EXECUTE FUNCTION update_updated_at_column();

-- 启用RLS（行级安全）
ALTER TABLE user_settings ENABLE ROW LEVEL SECURITY;

-- 创建策略：用户只能查看和修改自己的设置
CREATE POLICY "用户只能查看自己的设置" ON user_settings
    FOR SELECT USING (auth.uid() = user_id);

CREATE POLICY "用户只能插入自己的设置" ON user_settings
    FOR INSERT WITH CHECK (auth.uid() = user_id);

CREATE POLICY "用户只能更新自己的设置" ON user_settings
    FOR UPDATE USING (auth.uid() = user_id);

CREATE POLICY "用户只能删除自己的设置" ON user_settings
    FOR DELETE USING (auth.uid() = user_id);