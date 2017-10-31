package com.technophillia.test.vo;

public class ShareCapitalBean 
{

	//============START Variables =========================
	
	private int slNo;
	
	private String transactionDescription;
	
	private String shareCapitalCredit;
	
	private String shareCapitalDebit;
	
	private String shareCapitalBalance;
	
	private String transactionDate;
	
	
	
	//============ END Variables ===============================
	
	//=============== START CONSTRUCTORS =============================
	
	public ShareCapitalBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ShareCapitalBean(int slNo, String transactionDescription, String shareCapitalCredit,
			String shareCapitalDebit, String shareCapitalBalance, String transactionDate) {
		super();
		this.slNo = slNo;
		this.transactionDescription = transactionDescription;
		this.shareCapitalCredit = shareCapitalCredit;
		this.shareCapitalDebit = shareCapitalDebit;
		this.shareCapitalBalance = shareCapitalBalance;
		this.transactionDate = transactionDate;
	}

	//===============END CONSTRUCTORS =============================
	
	//========= start Getters and Setters==========================
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

	public String getShareCapitalCredit() {
		return shareCapitalCredit;
	}

	public void setShareCapitalCredit(String shareCapitalCredit) {
		this.shareCapitalCredit = shareCapitalCredit;
	}

	public String getShareCapitalDebit() {
		return shareCapitalDebit;
	}

	public void setShareCapitalDebit(String shareCapitalDebit) {
		this.shareCapitalDebit = shareCapitalDebit;
	}

	public String getShareCapitalBalance() {
		return shareCapitalBalance;
	}

	public void setShareCapitalBalance(String shareCapitalBalance) {
		this.shareCapitalBalance = shareCapitalBalance;
	}

	public String getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(String transactionDate) {
		this.transactionDate = transactionDate;
	}

	
	
	//========= END Getters and Setters==========================
	
	//======================= start hashcode equals and toString ===============================
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((shareCapitalBalance == null) ? 0 : shareCapitalBalance.hashCode());
		result = prime * result + ((shareCapitalCredit == null) ? 0 : shareCapitalCredit.hashCode());
		result = prime * result + ((shareCapitalDebit == null) ? 0 : shareCapitalDebit.hashCode());
		result = prime * result + slNo;
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
		ShareCapitalBean other = (ShareCapitalBean) obj;
		if (shareCapitalBalance == null) {
			if (other.shareCapitalBalance != null)
				return false;
		} else if (!shareCapitalBalance.equals(other.shareCapitalBalance))
			return false;
		if (shareCapitalCredit == null) {
			if (other.shareCapitalCredit != null)
				return false;
		} else if (!shareCapitalCredit.equals(other.shareCapitalCredit))
			return false;
		if (shareCapitalDebit == null) {
			if (other.shareCapitalDebit != null)
				return false;
		} else if (!shareCapitalDebit.equals(other.shareCapitalDebit))
			return false;
		if (slNo != other.slNo)
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
		return "ShareCapitalBean [slNo=" + slNo + ", transactionDescription=" + transactionDescription
				+ ", shareCapitalCredit=" + shareCapitalCredit + ", shareCapitalDebit=" + shareCapitalDebit
				+ ", shareCapitalBalance=" + shareCapitalBalance + ", transactionDate=" + transactionDate + "]";
	}
	
	
	//======================= END hashcode equals and toString ===============================
	
}
