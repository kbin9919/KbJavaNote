package member;

public class MemberVo {
	private String no;
	private String id;
	private String pwd;
	private String bankAccountNumber;
	
	public MemberVo() {
		super();
	}
	public MemberVo(String no, String id, String pwd, String bankAccountNumber) {
		super();
		this.no = no;
		this.id = id;
		this.pwd = pwd;
		this.bankAccountNumber = bankAccountNumber;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getBankAccountNumber() {
		return bankAccountNumber;
	}
	public void setBankAccountNumber(String bankAccountNumber) {
		this.bankAccountNumber = bankAccountNumber;
	}
	
	@Override
	public String toString() {
		return "MemberVo [no=" + no + ", id=" + id + ", pwd=" + pwd + ", bankAccountNumber=" + bankAccountNumber + "]";
	}
	
}
