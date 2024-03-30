package sellPhone;

public class SellPhoneVo {
	private String memberId;
	private String no;
	private String sellDate;
	private String phoneModel;
	private String price;
	private String breakYn;
	private String battery;
	private String grade;
	private String capacity;
	
	public SellPhoneVo(String memberId, String no, String sellDate, String phoneModel, String price, String breakYn,
			String battery, String grade, String capacity) {
		super();
		this.memberId = memberId;
		this.no = no;
		this.sellDate = sellDate;
		this.phoneModel = phoneModel;
		this.price = price;
		this.breakYn = breakYn;
		this.battery = battery;
		this.grade = grade;
		this.capacity = capacity;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getSellDate() {
		return sellDate;
	}
	public void setSellDate(String sellDate) {
		this.sellDate = sellDate;
	}
	public String getPhoneModel() {
		return phoneModel;
	}
	public void setPhoneModel(String phoneModel) {
		this.phoneModel = phoneModel;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getBreakYn() {
		return breakYn;
	}
	public void setBreakYn(String breakYn) {
		this.breakYn = breakYn;
	}
	public String getBattery() {
		return battery;
	}
	public void setBattery(String battery) {
		this.battery = battery;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	@Override
	public String toString() {
		return "SellPhoneVo [memberId=" + memberId + ", no=" + no + ", sellDate=" + sellDate + ", phoneModel="
				+ phoneModel + ", price=" + price + ", breakYn=" + breakYn + ", battery=" + battery + ", grade=" + grade
				+ ", capacity=" + capacity + "]";
	}
	
	
	
}
