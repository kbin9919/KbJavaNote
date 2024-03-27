package main;

import java.sql.SQLException;
import java.util.Scanner;

public class Main {
	public static final Scanner SC = new Scanner(System.in);
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		OracleJDBC04 oc = new OracleJDBC04();
		oc.printMenu();
	}
}
