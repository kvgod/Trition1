package com.technophillia.test.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="thrift_account")
public class ThriftBean 
{

	@Id
	@Column(name="sl_no")
	private int slNo;
	
	@Column(name="thrift_description")
	private String transactionDescription;
	@Column(name="credit")
	private String thriftCredit;
	@Column(name="debit")
	private String thriftDebit;
	@Column(name="current_balance")
	private String thriftBalance;
	@Column(name="transaction_timestamp")
	private String transactionDate;
	public int getSlNo() {
		return slNo;
	}
	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}
	public String getTransactionDescription() {
		return transactionDescription;
	}
	public void setTransactionDescription(String transactionDescription) {
		this.transactionDescription = transactionDescription;
	}
	public String getThriftCredit() {
		return thriftCredit;
	}
	public void setThriftCredit(String thriftCredit) {
		this.thriftCredit = thriftCredit;
	}
	public String getThriftDebit() {
		return thriftDebit;
	}
	public void setThriftDebit(String thriftDebit) {
		this.thriftDebit = thriftDebit;
	}
	public String getThriftBalance() {
		return thriftBalance;
	}
	public void setThriftBalance(String thriftBalance) {
		this.thriftBalance = thriftBalance;
	}
	public String getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(String transactionDate) {
		this.transactionDate = transactionDate;
	}
	public ThriftBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ThriftBean(int slNo, String transactionDescription, String thriftCredit, String thriftDebit,
			String thriftBalance, String transactionDate) {
		super();
		this.slNo = slNo;
		this.transactionDescription = transactionDescription;
		this.thriftCredit = thriftCredit;
		this.thriftDebit = thriftDebit;
		this.thriftBalance = thriftBalance;
		this.transactionDate = transactionDate;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + slNo;
		result = prime * result + ((thriftBalance == null) ? 0 : thriftBalance.hashCode());
		result = prime * result + ((thriftCredit == null) ? 0 : thriftCredit.hashCode());
		result = prime * result + ((thriftDebit == null) ? 0 : thriftDebit.hashCode());
		result = prime * result + ((transactionDate == null) ? 0 : transactionDate.hashCode());
		result = prime * result + ((transactionDescription == null) ? 0 : transactionDescription.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ThriftBean other = (ThriftBean) obj;
		if (slNo != other.slNo)
			return false;
		if (thriftBalance == null) {
			if (other.thriftBalance != null)
				return false;
		} else if (!thriftBalance.equals(other.thriftBalance))
			return false;
		if (thriftCredit == null) {
			if (other.thriftCredit != null)
				return false;
		} else if (!thriftCredit.equals(other.thriftCredit))
			return false;
		if (thriftDebit == null) {
			if (other.thriftDebit != null)
				return false;
		} else if (!thriftDebit.equals(other.thriftDebit))
			return false;
		if (transactionDate == null) {
			if (other.transactionDate != null)
				return false;
		} else if (!transactionDate.equals(other.transactionDate))
			return false;
		if (transactionDescription == null) {
			if (other.transactionDescription != null)
				return false;
		} else if (!transactionDescription.equals(other.transactionDescription))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "ThriftBean [slNo=" + slNo + ", transactionDescription=" + transactionDescription + ", thriftCredit="
				+ thriftCredit + ", thriftDebit=" + thriftDebit + ", thriftBalance=" + thriftBalance
				+ ", transactionDate=" + transactionDate + "]";
	}
	
	
	
	
	
	
}
