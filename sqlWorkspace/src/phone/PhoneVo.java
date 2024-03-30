package phone;

public class PhoneVo {
	
	private String phone_name;
	private String grade;
	private String capacity;
	private String sell_price;
	
	public PhoneVo() {
		super();
	}

	public PhoneVo(String phone_name, String grade, String capacity, String sell_price) {
		super();
		this.phone_name = phone_name;
		this.grade = grade;
		this.capacity = capacity;
		this.sell_price = sell_price;
	}

	public String getPhone_name() {
		return phone_name;
	}

	public void setPhone_name(String phone_name) {
		this.phone_name = phone_name;
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

	public String getSell_price() {
		return sell_price;
	}

	public void setSell_price(String sell_price) {
		this.sell_price = sell_price;
	}

	@Override
	public String toString() {
		return "중고폰 정보 조회 [기종 : " + phone_name + ", 등급 : " + grade + ", 용량 : " + capacity + ", 가격 : "
				+ sell_price + "]";
	}
	
	
}
