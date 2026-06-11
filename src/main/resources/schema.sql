DROP TABLE IF EXISTS policies;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    id BIGINT AUTO_INCREMENT PRIMARY KEY, -- 客戶編號
    name VARCHAR(100) NOT NULL,            -- 客戶姓名
    age INT,                               -- 年齡
    premium DOUBLE,                        -- 保費
    email VARCHAR(100),                    -- 電子郵件
    phone VARCHAR(20),                     -- 電話
    address VARCHAR(255),                  -- 地址
    gender VARCHAR(10),                    -- 性別
    birth_date DATE,                       -- 出生日期
    occupation VARCHAR(100),               -- 職業
    id_number VARCHAR(20),                 -- 身分證字號
    marital_status VARCHAR(20)             -- 婚姻狀況
);

CREATE TABLE policies (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,  -- 保單流水號
    policy_number VARCHAR(50) UNIQUE NOT NULL, -- 保單號碼
    type VARCHAR(50),                      -- 保險類型
    sum_insured INT,                       -- 保險金額
    customer_id BIGINT,                    -- 客戶ID (外鍵)
    start_date DATE,                       -- 起保日期
    end_date DATE,                         -- 結束日期
    status VARCHAR(20),                    -- 保單狀態
    premium_amount DOUBLE,                 -- 保費金額
    payment_mode VARCHAR(20),              -- 繳費方式
    branch_code VARCHAR(20),               -- 分公司代碼
    agent_code VARCHAR(20),                -- 業務員代碼
    effective_date DATE,                   -- 生效日期
    expiry_date DATE,                      -- 到期日期
    policy_term INT,                       -- 保險期間
    coverage_description TEXT,             -- 承保內容描述
    beneficiary_name VARCHAR(100),         -- 受益人姓名
    currency_code VARCHAR(10),             -- 幣別代碼
    risk_level VARCHAR(10),                -- 風險等級
    auto_renew BOOLEAN,                    -- 自動續保
    remarks VARCHAR(255),                  -- 備註
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 建立時間
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
