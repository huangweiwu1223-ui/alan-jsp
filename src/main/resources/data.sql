-- 插入 10 筆客戶
INSERT INTO customers (name, age, premium, email, phone, address, gender, birth_date, occupation, id_number, marital_status) VALUES
('張小明', 30, 5000.0, 'ming@test.com', '0912-345-678', '台北市信義路', 'Male', '1994-01-01', 'Engineer', 'A123456789', 'Single'),
('李美華', 45, 12000.0, 'hua@test.com', '0922-345-678', '台中市公益路', 'Female', '1979-05-20', 'Teacher', 'B223456789', 'Married'),
('王大同', 28, 3000.0, 'tong@test.com', '0933-111-222', '高雄市中山路', 'Male', '1996-10-10', 'Designer', 'E123123123', 'Single'),
('趙敏', 35, 8500.0, 'min@test.com', '0944-555-666', '新北市板橋區', 'Female', '1989-02-14', 'Accountant', 'F221122334', 'Married'),
('孫悟空', 500, 99999.0, 'monkey@heaven.com', '0900-000-000', '花果山水簾洞', 'Male', '1500-01-01', 'King', 'G100000001', 'Single'),
('林黛玉', 22, 1500.0, 'daiyu@red.com', '0955-888-999', '大觀園', 'Female', '2002-03-03', 'Student', 'H229988776', 'Single'),
('曹操', 55, 50000.0, 'cao@wei.com', '0966-000-111', '許昌市', 'Male', '1969-07-07', 'CEO', 'K112233445', 'Married'),
('劉備', 52, 45000.0, 'liu@shu.com', '0977-222-333', '成都市', 'Male', '1972-08-08', 'Manager', 'L112233446', 'Married'),
('關羽', 50, 30000.0, 'guan@shu.com', '0988-333-444', '荊州市', 'Male', '1974-09-09', 'General', 'M112233447', 'Married'),
('張飛', 48, 25000.0, 'zhang@shu.com', '0999-444-555', '巴西郡', 'Male', '1976-12-12', 'General', 'N112233448', 'Married');

-- 插入 100 筆保單 (每個客戶分配約 10 筆)
-- 這裡使用重複 SQL 模式模擬，為求簡潔展示部分。實際執行時此檔案需包含 100 行。
INSERT INTO policies (policy_number, type, sum_insured, customer_id, start_date, end_date, status, premium_amount, payment_mode, branch_code, agent_code, effective_date, expiry_date, policy_term, coverage_description, beneficiary_name, currency_code, risk_level, auto_renew, remarks)
SELECT 
    CONCAT('POL-', LPAD(x, 5, '0')), 
    CASE WHEN MOD(x, 2) = 0 THEN 'LIFE' ELSE 'HEALTH' END,
    1000000 + (x * 1000), 
    MOD(x, 10) + 1, 
    '2023-01-01', '2024-01-01', 'ACTIVE', 
    500.0 + x, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 
    'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'
FROM (
    SELECT ROW_NUMBER() OVER() AS x FROM SYSTEM_RANGE(1, 100)
);
