package main;

import java.util.Scanner;

import board.BoardController;
import member.MemberController;
import member.MemberVo;

public class Main {
   public static final Scanner SC = new Scanner(System.in);
   public static MemberVo loginMember = null;
   public static void main(String[] args) throws Exception {
      
      BoardController bc = new BoardController();
      MemberController mc = new MemberController();
      while(true) {
         System.out.println("1. MEMBER");
         System.out.println("2. BOARD");
         System.out.println("9. 종료하기");
         System.out.println("원하는 번호 입력 : ");
         String num = Main.SC.nextLine();
         switch(num) {
         case "1" : mc.printMenu(); break;
         case "2" : bc.printMenu(); break;
         case "3" : System.out.println("프로그램 종료"); break;
         default : System.out.println("잘못된 입력입니다.");
         }
      }
            
      
      
   }
}
