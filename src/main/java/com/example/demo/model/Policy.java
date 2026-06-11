package com.example.demo.model;

public class Policy {
    private Long id;
    private String policyNumber;
    private String type;
    private int sumInsured;
    private Long customerId;
    private String startDate;
    private String endDate;
    private String status;
    private double premiumAmount;
    private String paymentMode;
    private String branchCode;
    private String agentCode;
    private String effectiveDate;
    private String expiryDate;
    private int policyTerm;
    private String coverageDescription;
    private String beneficiaryName;
    private String currencyCode;
    private String riskLevel;
    private boolean autoRenew;
    private String remarks;
    private String createTime;

    public Policy() {}

    public Policy(String policyNumber, String type, int sumInsured) {
        this.policyNumber = policyNumber;
        this.type = type;
        this.sumInsured = sumInsured;
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getPolicyNumber() { return policyNumber; }
    public void setPolicyNumber(String policyNumber) { this.policyNumber = policyNumber; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public int getSumInsured() { return sumInsured; }
    public void setSumInsured(int sumInsured) { this.sumInsured = sumInsured; }
    public Long getCustomerId() { return customerId; }
    public void setCustomerId(Long customerId) { this.customerId = customerId; }
    public String getStartDate() { return startDate; }
    public void setStartDate(String startDate) { this.startDate = startDate; }
    public String getEndDate() { return endDate; }
    public void setEndDate(String endDate) { this.endDate = endDate; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public double getPremiumAmount() { return premiumAmount; }
    public void setPremiumAmount(double premiumAmount) { this.premiumAmount = premiumAmount; }
    public String getPaymentMode() { return paymentMode; }
    public void setPaymentMode(String paymentMode) { this.paymentMode = paymentMode; }
    public String getBranchCode() { return branchCode; }
    public void setBranchCode(String branchCode) { this.branchCode = branchCode; }
    public String getAgentCode() { return agentCode; }
    public void setAgentCode(String agentCode) { this.agentCode = agentCode; }
    public String getEffectiveDate() { return effectiveDate; }
    public void setEffectiveDate(String effectiveDate) { this.effectiveDate = effectiveDate; }
    public String getExpiryDate() { return expiryDate; }
    public void setExpiryDate(String expiryDate) { this.expiryDate = expiryDate; }
    public int getPolicyTerm() { return policyTerm; }
    public void setPolicyTerm(int policyTerm) { this.policyTerm = policyTerm; }
    public String getCoverageDescription() { return coverageDescription; }
    public void setCoverageDescription(String coverageDescription) { this.coverageDescription = coverageDescription; }
    public String getBeneficiaryName() { return beneficiaryName; }
    public void setBeneficiaryName(String beneficiaryName) { this.beneficiaryName = beneficiaryName; }
    public String getCurrencyCode() { return currencyCode; }
    public void setCurrencyCode(String currencyCode) { this.currencyCode = currencyCode; }
    public String getRiskLevel() { return riskLevel; }
    public void setRiskLevel(String riskLevel) { this.riskLevel = riskLevel; }
    public boolean isAutoRenew() { return autoRenew; }
    public void setAutoRenew(boolean autoRenew) { this.autoRenew = autoRenew; }
    public String getRemarks() { return remarks; }
    public void setRemarks(String remarks) { this.remarks = remarks; }
    public String getCreateTime() { return createTime; }
    public void setCreateTime(String createTime) { this.createTime = createTime; }
}
