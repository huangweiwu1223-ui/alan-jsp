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

-- 插入 100 筆保單 (每個客戶明確分配 10 筆資料)
INSERT INTO policies (policy_number, type, sum_insured, customer_id, start_date, end_date, status, premium_amount, payment_mode, branch_code, agent_code, effective_date, expiry_date, policy_term, coverage_description, beneficiary_name, currency_code, risk_level, auto_renew, remarks) VALUES
-- 客戶 1 (張小明) 的 10 筆保單
('POL-00001', 'HEALTH', 1001000, 1, '2023-01-01', '2024-01-01', 'ACTIVE', 501.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00002', 'LIFE',   1002000, 1, '2023-01-01', '2024-01-01', 'ACTIVE', 502.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00003', 'HEALTH', 1003000, 1, '2023-01-01', '2024-01-01', 'ACTIVE', 503.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00004', 'LIFE',   1004000, 1, '2023-01-01', '2024-01-01', 'ACTIVE', 504.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00005', 'HEALTH', 1005000, 1, '2023-01-01', '2024-01-01', 'ACTIVE', 505.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00006', 'LIFE',   1006000, 1, '2023-01-01', '2024-01-01', 'ACTIVE', 506.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00007', 'HEALTH', 1007000, 1, '2023-01-01', '2024-01-01', 'ACTIVE', 507.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00008', 'LIFE',   1008000, 1, '2023-01-01', '2024-01-01', 'ACTIVE', 508.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00009', 'HEALTH', 1009000, 1, '2023-01-01', '2024-01-01', 'ACTIVE', 509.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00010', 'LIFE',   1010000, 1, '2023-01-01', '2024-01-01', 'ACTIVE', 510.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),

-- 客戶 2 (李美華) 的 10 筆保單
('POL-00011', 'HEALTH', 1011000, 2, '2023-01-01', '2024-01-01', 'ACTIVE', 511.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00012', 'LIFE',   1012000, 2, '2023-01-01', '2024-01-01', 'ACTIVE', 512.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00013', 'HEALTH', 1013000, 2, '2023-01-01', '2024-01-01', 'ACTIVE', 513.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00014', 'LIFE',   1014000, 2, '2023-01-01', '2024-01-01', 'ACTIVE', 514.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00015', 'HEALTH', 1015000, 2, '2023-01-01', '2024-01-01', 'ACTIVE', 515.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00016', 'LIFE',   1016000, 2, '2023-01-01', '2024-01-01', 'ACTIVE', 516.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00017', 'HEALTH', 1017000, 2, '2023-01-01', '2024-01-01', 'ACTIVE', 517.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00018', 'LIFE',   1018000, 2, '2023-01-01', '2024-01-01', 'ACTIVE', 518.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00019', 'HEALTH', 1019000, 2, '2023-01-01', '2024-01-01', 'ACTIVE', 519.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00020', 'LIFE',   1020000, 2, '2023-01-01', '2024-01-01', 'ACTIVE', 520.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),

-- 客戶 3 (王大同) 的 10 筆保單
('POL-00021', 'HEALTH', 1021000, 3, '2023-01-01', '2024-01-01', 'ACTIVE', 521.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00022', 'LIFE',   1022000, 3, '2023-01-01', '2024-01-01', 'ACTIVE', 522.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00023', 'HEALTH', 1023000, 3, '2023-01-01', '2024-01-01', 'ACTIVE', 523.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00024', 'LIFE',   1024000, 3, '2023-01-01', '2024-01-01', 'ACTIVE', 524.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00025', 'HEALTH', 1025000, 3, '2023-01-01', '2024-01-01', 'ACTIVE', 525.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00026', 'LIFE',   1026000, 3, '2023-01-01', '2024-01-01', 'ACTIVE', 526.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00027', 'HEALTH', 1027000, 3, '2023-01-01', '2024-01-01', 'ACTIVE', 527.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00028', 'LIFE',   1028000, 3, '2023-01-01', '2024-01-01', 'ACTIVE', 528.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00029', 'HEALTH', 1029000, 3, '2023-01-01', '2024-01-01', 'ACTIVE', 529.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00030', 'LIFE',   1030000, 3, '2023-01-01', '2024-01-01', 'ACTIVE', 530.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),

-- 客戶 4 (趙敏) 的 10 筆保單
('POL-00031', 'HEALTH', 1031000, 4, '2023-01-01', '2024-01-01', 'ACTIVE', 531.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00032', 'LIFE',   1032000, 4, '2023-01-01', '2024-01-01', 'ACTIVE', 532.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00033', 'HEALTH', 1033000, 4, '2023-01-01', '2024-01-01', 'ACTIVE', 533.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00034', 'LIFE',   1034000, 4, '2023-01-01', '2024-01-01', 'ACTIVE', 534.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00035', 'HEALTH', 1035000, 4, '2023-01-01', '2024-01-01', 'ACTIVE', 535.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00036', 'LIFE',   1036000, 4, '2023-01-01', '2024-01-01', 'ACTIVE', 536.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00037', 'HEALTH', 1037000, 4, '2023-01-01', '2024-01-01', 'ACTIVE', 537.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00038', 'LIFE',   1038000, 4, '2023-01-01', '2024-01-01', 'ACTIVE', 538.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00039', 'HEALTH', 1039000, 4, '2023-01-01', '2024-01-01', 'ACTIVE', 539.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00040', 'LIFE',   1040000, 4, '2023-01-01', '2024-01-01', 'ACTIVE', 540.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),

-- 客戶 5 (孫悟空) 的 10 筆保單
('POL-00041', 'HEALTH', 1041000, 5, '2023-01-01', '2024-01-01', 'ACTIVE', 541.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00042', 'LIFE',   1042000, 5, '2023-01-01', '2024-01-01', 'ACTIVE', 542.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00043', 'HEALTH', 1043000, 5, '2023-01-01', '2024-01-01', 'ACTIVE', 543.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00044', 'LIFE',   1044000, 5, '2023-01-01', '2024-01-01', 'ACTIVE', 544.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00045', 'HEALTH', 1045000, 5, '2023-01-01', '2024-01-01', 'ACTIVE', 545.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00046', 'LIFE',   1046000, 5, '2023-01-01', '2024-01-01', 'ACTIVE', 546.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00047', 'HEALTH', 1047000, 5, '2023-01-01', '2024-01-01', 'ACTIVE', 547.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00048', 'LIFE',   1048000, 5, '2023-01-01', '2024-01-01', 'ACTIVE', 548.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00049', 'HEALTH', 1049000, 5, '2023-01-01', '2024-01-01', 'ACTIVE', 549.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00050', 'LIFE',   1050000, 5, '2023-01-01', '2024-01-01', 'ACTIVE', 550.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),

-- 客戶 6 (林黛玉) 的 10 筆保單
('POL-00051', 'HEALTH', 1051000, 6, '2023-01-01', '2024-01-01', 'ACTIVE', 551.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00052', 'LIFE',   1052000, 6, '2023-01-01', '2024-01-01', 'ACTIVE', 552.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00053', 'HEALTH', 1053000, 6, '2023-01-01', '2024-01-01', 'ACTIVE', 553.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00054', 'LIFE',   1054000, 6, '2023-01-01', '2024-01-01', 'ACTIVE', 554.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00055', 'HEALTH', 1055000, 6, '2023-01-01', '2024-01-01', 'ACTIVE', 555.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00056', 'LIFE',   1056000, 6, '2023-01-01', '2024-01-01', 'ACTIVE', 556.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00057', 'HEALTH', 1057000, 6, '2023-01-01', '2024-01-01', 'ACTIVE', 557.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00058', 'LIFE',   1058000, 6, '2023-01-01', '2024-01-01', 'ACTIVE', 558.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00059', 'HEALTH', 1059000, 6, '2023-01-01', '2024-01-01', 'ACTIVE', 559.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00060', 'LIFE',   1060000, 6, '2023-01-01', '2024-01-01', 'ACTIVE', 560.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),

-- 客戶 7 (曹操) 的 10 筆保單
('POL-00061', 'HEALTH', 1061000, 7, '2023-01-01', '2024-01-01', 'ACTIVE', 561.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00062', 'LIFE',   1062000, 7, '2023-01-01', '2024-01-01', 'ACTIVE', 562.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00063', 'HEALTH', 1063000, 7, '2023-01-01', '2024-01-01', 'ACTIVE', 563.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00064', 'LIFE',   1064000, 7, '2023-01-01', '2024-01-01', 'ACTIVE', 564.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00065', 'HEALTH', 1065000, 7, '2023-01-01', '2024-01-01', 'ACTIVE', 565.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00066', 'LIFE',   1066000, 7, '2023-01-01', '2024-01-01', 'ACTIVE', 566.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00067', 'HEALTH', 1067000, 7, '2023-01-01', '2024-01-01', 'ACTIVE', 567.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00068', 'LIFE',   1068000, 7, '2023-01-01', '2024-01-01', 'ACTIVE', 568.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00069', 'HEALTH', 1069000, 7, '2023-01-01', '2024-01-01', 'ACTIVE', 569.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00070', 'LIFE',   1070000, 7, '2023-01-01', '2024-01-01', 'ACTIVE', 570.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),

-- 客戶 8 (劉備) 的 10 筆保單
('POL-00071', 'HEALTH', 1071000, 8, '2023-01-01', '2024-01-01', 'ACTIVE', 571.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00072', 'LIFE',   1072000, 8, '2023-01-01', '2024-01-01', 'ACTIVE', 572.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00073', 'HEALTH', 1073000, 8, '2023-01-01', '2024-01-01', 'ACTIVE', 573.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00074', 'LIFE',   1074000, 8, '2023-01-01', '2024-01-01', 'ACTIVE', 574.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00075', 'HEALTH', 1075000, 8, '2023-01-01', '2024-01-01', 'ACTIVE', 575.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00076', 'LIFE',   1076000, 8, '2023-01-01', '2024-01-01', 'ACTIVE', 576.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00077', 'HEALTH', 1077000, 8, '2023-01-01', '2024-01-01', 'ACTIVE', 577.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00078', 'LIFE',   1078000, 8, '2023-01-01', '2024-01-01', 'ACTIVE', 578.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00079', 'HEALTH', 1079000, 8, '2023-01-01', '2024-01-01', 'ACTIVE', 579.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00080', 'LIFE',   1080000, 8, '2023-01-01', '2024-01-01', 'ACTIVE', 580.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),

-- 客戶 9 (關羽) 的 10 筆保單
('POL-00081', 'HEALTH', 1081000, 9, '2023-01-01', '2024-01-01', 'ACTIVE', 581.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00082', 'LIFE',   1082000, 9, '2023-01-01', '2024-01-01', 'ACTIVE', 582.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00083', 'HEALTH', 1083000, 9, '2023-01-01', '2024-01-01', 'ACTIVE', 583.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00084', 'LIFE',   1084000, 9, '2023-01-01', '2024-01-01', 'ACTIVE', 584.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00085', 'HEALTH', 1085000, 9, '2023-01-01', '2024-01-01', 'ACTIVE', 585.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00086', 'LIFE',   1086000, 9, '2023-01-01', '2024-01-01', 'ACTIVE', 586.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00087', 'HEALTH', 1087000, 9, '2023-01-01', '2024-01-01', 'ACTIVE', 587.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00088', 'LIFE',   1088000, 9, '2023-01-01', '2024-01-01', 'ACTIVE', 588.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00089', 'HEALTH', 1089000, 9, '2023-01-01', '2024-01-01', 'ACTIVE', 589.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00090', 'LIFE',   1090000, 9, '2023-01-01', '2024-01-01', 'ACTIVE', 590.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),

-- 客戶 10 (張飛) 的 10 筆保單
('POL-00091', 'HEALTH', 1091000, 10, '2023-01-01', '2024-01-01', 'ACTIVE', 591.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00092', 'LIFE',   1092000, 10, '2023-01-01', '2024-01-01', 'ACTIVE', 592.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00093', 'HEALTH', 1093000, 10, '2023-01-01', '2024-01-01', 'ACTIVE', 593.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00094', 'LIFE',   1094000, 10, '2023-01-01', '2024-01-01', 'ACTIVE', 594.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00095', 'HEALTH', 1095000, 10, '2023-01-01', '2024-01-01', 'ACTIVE', 595.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00096', 'LIFE',   1096000, 10, '2023-01-01', '2024-01-01', 'ACTIVE', 596.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00097', 'HEALTH', 1097000, 10, '2023-01-01', '2024-01-01', 'ACTIVE', 597.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00098', 'LIFE',   1098000, 10, '2023-01-01', '2024-01-01', 'ACTIVE', 598.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00099', 'HEALTH', 1099000, 10, '2023-01-01', '2024-01-01', 'ACTIVE', 599.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated'),
('POL-00100', 'LIFE',   1100000, 10, '2023-01-01', '2024-01-01', 'ACTIVE', 600.0, 'MONTHLY', 'BR001', 'AG99', '2023-01-01', '2024-01-01', 1, 'Basic coverage', 'Family', 'TWD', 'LOW', TRUE, 'Auto-generated');