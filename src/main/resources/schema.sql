DROP TABLE IF EXISTS policies;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    premium DOUBLE,
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255),
    gender VARCHAR(10),
    birth_date DATE,
    occupation VARCHAR(100),
    id_number VARCHAR(20),
    marital_status VARCHAR(20)
);

CREATE TABLE policies (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    policy_number VARCHAR(50) UNIQUE NOT NULL,
    type VARCHAR(50),
    sum_insured INT,
    customer_id BIGINT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),
    premium_amount DOUBLE,
    payment_mode VARCHAR(20),
    branch_code VARCHAR(20),
    agent_code VARCHAR(20),
    effective_date DATE,
    expiry_date DATE,
    policy_term INT,
    coverage_description TEXT,
    beneficiary_name VARCHAR(100),
    currency_code VARCHAR(10),
    risk_level VARCHAR(10),
    auto_renew BOOLEAN,
    remarks VARCHAR(255),
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
