package com.technophillia.test.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="balance_sheet")
public class BalanceSheetBean 
{

	@Id
	@Column(name="sl_no")
	private int slNo;
	@Column(name="member_id")
	private String memberId;
	@Column(name="member_name")
	private String memberName;
	@Column(name="share_capital_ob")
	private String shareCapitalOpeningBalance;
	@Column(name="share_capital_cy")
	private String shareCapitalCurrentYear;
	@Column(name="share_capital_cb")
	private String shareCapitalCurrentBalance;
	@Column(name="thrift_ob")
	private String thriftopeningBalance;
	@Column(name="thrift_cy")
	private String thriftCurrentYear;
	@Column(name="thrift_interest")
	private String thriftInterest;
	@Column(name="thrift_cb")
	private String thriftCurrentBalance;
	@Column(name="recurring_deposit_ob")
	private String recurringDepositOpeningBalance;
	@Column(name="recurring_deposit_cy")
	private String recurringDepositCurrentYear;
	@Column(name="recurring_deposit_refund")
	private String recurringDepositRefund;
	@Column(name="recurring_deposit_cb")
	private String recurringDepositCurrentBalance;
	@Column(name="loan_outstanding")
	private String loanOutstanding;
	@Column(name="loan_interest_paid")
	private String loanInterestPaid;
	@Column(name="rd_interest_received")
	private String recurringDepositInterestReceived;
	@Column(name="fd_interest_received")
	private String fixedDepositInterestReceived;
	@Column(name="admission_fees")
	private String admissionFees;
	@Column(name="dividend")
	private String dividend;
	
	public BalanceSheetBean() {
		super();	
	}
	
	public BalanceSheetBean(int slNo, String memberId, String memberName, String shareCapitalOpeningBalance,
			String shareCapitalCurrentYear, String shareCapitalCurrentBalance, String thriftopeningBalance,
			String thriftCurrentYear, String thriftInterest, String thriftCurrentBalance,
			String recurringDepositOpeningBalance, String recurringDepositCurrentYear, String recurringDepositRefund,
			String recurringDepositCurrentBalance, String loanOutstanding, String loanInterestPaid,
			String recurringDepositInterestReceived, String fixedDepositInterestReceived, String admissionFees,
			String dividend) {
		super();
		this.slNo = slNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.shareCapitalOpeningBalance = shareCapitalOpeningBalance;
		this.shareCapitalCurrentYear = shareCapitalCurrentYear;
		this.shareCapitalCurrentBalance = shareCapitalCurrentBalance;
		this.thriftopeningBalance = thriftopeningBalance;
		this.thriftCurrentYear = thriftCurrentYear;
		this.thriftInterest = thriftInterest;
		this.thriftCurrentBalance = thriftCurrentBalance;
		this.recurringDepositOpeningBalance = recurringDepositOpeningBalance;
		this.recurringDepositCurrentYear = recurringDepositCurrentYear;
		this.recurringDepositRefund = recurringDepositRefund;
		this.recurringDepositCurrentBalance = recurringDepositCurrentBalance;
		this.loanOutstanding = loanOutstanding;
		this.loanInterestPaid = loanInterestPaid;
		this.recurringDepositInterestReceived = recurringDepositInterestReceived;
		this.fixedDepositInterestReceived = fixedDepositInterestReceived;
		this.admissionFees = admissionFees;
		this.dividend = dividend;
	}



	public int getSlNo() {
		return slNo;
	}

	public void setSlNo(int slNo) {
		this.slNo = slNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getShareCapitalOpeningBalance() {
		return shareCapitalOpeningBalance;
	}

	public void setShareCapitalOpeningBalance(String shareCapitalOpeningBalance) {
		this.shareCapitalOpeningBalance = shareCapitalOpeningBalance;
	}

	public String getShareCapitalCurrentYear() {
		return shareCapitalCurrentYear;
	}

	public void setShareCapitalCurrentYear(String shareCapitalCurrentYear) {
		this.shareCapitalCurrentYear = shareCapitalCurrentYear;
	}

	public String getShareCapitalCurrentBalance() {
		return shareCapitalCurrentBalance;
	}

	public void setShareCapitalCurrentBalance(String shareCapitalCurrentBalance) {
		this.shareCapitalCurrentBalance = shareCapitalCurrentBalance;
	}

	public String getThriftopeningBalance() {
		return thriftopeningBalance;
	}

	public void setThriftopeningBalance(String thriftopeningBalance) {
		this.thriftopeningBalance = thriftopeningBalance;
	}

	public String getThriftCurrentYear() {
		return thriftCurrentYear;
	}

	public void setThriftCurrentYear(String thriftCurrentYear) {
		this.thriftCurrentYear = thriftCurrentYear;
	}

	public String getThriftInterest() {
		return thriftInterest;
	}

	public void setThriftInterest(String thriftInterest) {
		this.thriftInterest = thriftInterest;
	}

	public String getThriftCurrentBalance() {
		return thriftCurrentBalance;
	}

	public void setThriftCurrentBalance(String thriftCurrentBalance) {
		this.thriftCurrentBalance = thriftCurrentBalance;
	}

	public String getRecurringDepositOpeningBalance() {
		return recurringDepositOpeningBalance;
	}

	public void setRecurringDepositOpeningBalance(String recurringDepositOpeningBalance) {
		this.recurringDepositOpeningBalance = recurringDepositOpeningBalance;
	}

	public String getRecurringDepositCurrentYear() {
		return recurringDepositCurrentYear;
	}

	public void setRecurringDepositCurrentYear(String recurringDepositCurrentYear) {
		this.recurringDepositCurrentYear = recurringDepositCurrentYear;
	}

	public String getRecurringDepositRefund() {
		return recurringDepositRefund;
	}

	public void setRecurringDepositRefund(String recurringDepositRefund) {
		this.recurringDepositRefund = recurringDepositRefund;
	}

	public String getRecurringDepositCurrentBalance() {
		return recurringDepositCurrentBalance;
	}

	public void setRecurringDepositCurrentBalance(String recurringDepositCurrentBalance) {
		this.recurringDepositCurrentBalance = recurringDepositCurrentBalance;
	}

	public String getLoanOutstanding() {
		return loanOutstanding;
	}

	public void setLoanOutstanding(String loanOutstanding) {
		this.loanOutstanding = loanOutstanding;
	}

	public String getLoanInterestPaid() {
		return loanInterestPaid;
	}

	public void setLoanInterestPaid(String loanInterestPaid) {
		this.loanInterestPaid = loanInterestPaid;
	}

	public String getRecurringDepositInterestReceived() {
		return recurringDepositInterestReceived;
	}

	public void setRecurringDepositInterestReceived(String recurringDepositInterestReceived) {
		this.recurringDepositInterestReceived = recurringDepositInterestReceived;
	}

	public String getFixedDepositInterestReceived() {
		return fixedDepositInterestReceived;
	}

	public void setFixedDepositInterestReceived(String fixedDepositInterestReceived) {
		this.fixedDepositInterestReceived = fixedDepositInterestReceived;
	}

	public String getAdmissionFees() {
		return admissionFees;
	}

	public void setAdmissionFees(String admissionFees) {
		this.admissionFees = admissionFees;
	}

	public String getDividend() {
		return dividend;
	}

	public void setDividend(String dividend) {
		this.dividend = dividend;
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((admissionFees == null) ? 0 : admissionFees.hashCode());
		result = prime * result + ((dividend == null) ? 0 : dividend.hashCode());
		result = prime * result
				+ ((fixedDepositInterestReceived == null) ? 0 : fixedDepositInterestReceived.hashCode());
		result = prime * result + ((loanInterestPaid == null) ? 0 : loanInterestPaid.hashCode());
		result = prime * result + ((loanOutstanding == null) ? 0 : loanOutstanding.hashCode());
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + ((memberName == null) ? 0 : memberName.hashCode());
		result = prime * result
				+ ((recurringDepositCurrentBalance == null) ? 0 : recurringDepositCurrentBalance.hashCode());
		result = prime * result + ((recurringDepositCurrentYear == null) ? 0 : recurringDepositCurrentYear.hashCode());
		result = prime * result
				+ ((recurringDepositInterestReceived == null) ? 0 : recurringDepositInterestReceived.hashCode());
		result = prime * result
				+ ((recurringDepositOpeningBalance == null) ? 0 : recurringDepositOpeningBalance.hashCode());
		result = prime * result + ((recurringDepositRefund == null) ? 0 : recurringDepositRefund.hashCode());
		result = prime * result + ((shareCapitalCurrentBalance == null) ? 0 : shareCapitalCurrentBalance.hashCode());
		result = prime * result + ((shareCapitalCurrentYear == null) ? 0 : shareCapitalCurrentYear.hashCode());
		result = prime * result + ((shareCapitalOpeningBalance == null) ? 0 : shareCapitalOpeningBalance.hashCode());
		result = prime * result + slNo;
		result = prime * result + ((thriftCurrentBalance == null) ? 0 : thriftCurrentBalance.hashCode());
		result = prime * result + ((thriftCurrentYear == null) ? 0 : thriftCurrentYear.hashCode());
		result = prime * result + ((thriftInterest == null) ? 0 : thriftInterest.hashCode());
		result = prime * result + ((thriftopeningBalance == null) ? 0 : thriftopeningBalance.hashCode());
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
		BalanceSheetBean other = (BalanceSheetBean) obj;
		if (admissionFees == null) {
			if (other.admissionFees != null)
				return false;
		} else if (!admissionFees.equals(other.admissionFees))
			return false;
		if (dividend == null) {
			if (other.dividend != null)
				return false;
		} else if (!dividend.equals(other.dividend))
			return false;
		if (fixedDepositInterestReceived == null) {
			if (other.fixedDepositInterestReceived != null)
				return false;
		} else if (!fixedDepositInterestReceived.equals(other.fixedDepositInterestReceived))
			return false;
		if (loanInterestPaid == null) {
			if (other.loanInterestPaid != null)
				return false;
		} else if (!loanInterestPaid.equals(other.loanInterestPaid))
			return false;
		if (loanOutstanding == null) {
			if (other.loanOutstanding != null)
				return false;
		} else if (!loanOutstanding.equals(other.loanOutstanding))
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (memberName == null) {
			if (other.memberName != null)
				return false;
		} else if (!memberName.equals(other.memberName))
			return false;
		if (recurringDepositCurrentBalance == null) {
			if (other.recurringDepositCurrentBalance != null)
				return false;
		} else if (!recurringDepositCurrentBalance.equals(other.recurringDepositCurrentBalance))
			return false;
		if (recurringDepositCurrentYear == null) {
			if (other.recurringDepositCurrentYear != null)
				return false;
		} else if (!recurringDepositCurrentYear.equals(other.recurringDepositCurrentYear))
			return false;
		if (recurringDepositInterestReceived == null) {
			if (other.recurringDepositInterestReceived != null)
				return false;
		} else if (!recurringDepositInterestReceived.equals(other.recurringDepositInterestReceived))
			return false;
		if (recurringDepositOpeningBalance == null) {
			if (other.recurringDepositOpeningBalance != null)
				return false;
		} else if (!recurringDepositOpeningBalance.equals(other.recurringDepositOpeningBalance))
			return false;
		if (recurringDepositRefund == null) {
			if (other.recurringDepositRefund != null)
				return false;
		} else if (!recurringDepositRefund.equals(other.recurringDepositRefund))
			return false;
		if (shareCapitalCurrentBalance == null) {
			if (other.shareCapitalCurrentBalance != null)
				return false;
		} else if (!shareCapitalCurrentBalance.equals(other.shareCapitalCurrentBalance))
			return false;
		if (shareCapitalCurrentYear == null) {
			if (other.shareCapitalCurrentYear != null)
				return false;
		} else if (!shareCapitalCurrentYear.equals(other.shareCapitalCurrentYear))
			return false;
		if (shareCapitalOpeningBalance == null) {
			if (other.shareCapitalOpeningBalance != null)
				return false;
		} else if (!shareCapitalOpeningBalance.equals(other.shareCapitalOpeningBalance))
			return false;
		if (slNo != other.slNo)
			return false;
		if (thriftCurrentBalance == null) {
			if (other.thriftCurrentBalance != null)
				return false;
		} else if (!thriftCurrentBalance.equals(other.thriftCurrentBalance))
			return false;
		if (thriftCurrentYear == null) {
			if (other.thriftCurrentYear != null)
				return false;
		} else if (!thriftCurrentYear.equals(other.thriftCurrentYear))
			return false;
		if (thriftInterest == null) {
			if (other.thriftInterest != null)
				return false;
		} else if (!thriftInterest.equals(other.thriftInterest))
			return false;
		if (thriftopeningBalance == null) {
			if (other.thriftopeningBalance != null)
				return false;
		} else if (!thriftopeningBalance.equals(other.thriftopeningBalance))
			return false;
		return true;
	}



	@Override
	public String toString() {
		return "BalanceSheetBean [slNo=" + slNo + ", memberId=" + memberId + ", memberName=" + memberName
				+ ", shareCapitalOpeningBalance=" + shareCapitalOpeningBalance + ", shareCapitalCurrentYear="
				+ shareCapitalCurrentYear + ", shareCapitalCurrentBalance=" + shareCapitalCurrentBalance
				+ ", thriftopeningBalance=" + thriftopeningBalance + ", thriftCurrentYear=" + thriftCurrentYear
				+ ", thriftInterest=" + thriftInterest + ", thriftCurrentBalance=" + thriftCurrentBalance
				+ ", recurringDepositOpeningBalance=" + recurringDepositOpeningBalance
				+ ", recurringDepositCurrentYear=" + recurringDepositCurrentYear + ", recurringDepositRefund="
				+ recurringDepositRefund + ", recurringDepositCurrentBalance=" + recurringDepositCurrentBalance
				+ ", loanOutstanding=" + loanOutstanding + ", loanInterestPaid=" + loanInterestPaid
				+ ", recurringDepositInterestReceived=" + recurringDepositInterestReceived
				+ ", fixedDepositInterestReceived=" + fixedDepositInterestReceived + ", admissionFees=" + admissionFees
				+ ", dividend=" + dividend + "]";
	}
	
}
