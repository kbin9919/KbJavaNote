package main;

import java.sql.SQLException;

import member.MemberController;
import member.MemberInfo;
import phone.PhoneInfo;
import sellPhone.SellPhone;
import util.Util;


public class Main {
	public void menu() throws SQLException {
		boolean run = true;
		MemberController mc = new MemberController();
		SellPhone sp = new SellPhone();
		PhoneInfo pi = new PhoneInfo();
		MemberInfo mi = new MemberInfo();
		while(run) {
			System.out.println("1. 로그인");
			System.out.println("2. 중고폰 판매");
			System.out.println("3. 회원 정보 조회");
			System.out.println("4. 중고폰 가격 조회");
			System.out.println("0. 종료");
			System.out.println("번호 입력 : ");
			
			String inputNum = Util.SC.nextLine();
			
			switch(inputNum) {
			case "1" : try {
					mc.printMenu();
					Thread.sleep(2000);
				} catch (Exception e) {
					e.printStackTrace();
				} break;
			case "2" : sp.sellPhone(); break;
			case "3" : mi.memberInfo(); break;
			case "4" : pi.phoneInfo(); break;
			case "0" : System.out.println("*사용 종료"); run = false; break;
			default : System.out.println("잘못된 입력입니다. 다시 입력해 주세요.");
			}
		}
	}
	
	public static void main(String[] args) throws SQLException {
		Main main = new Main();
		main.menu();
		
		
	}
}
