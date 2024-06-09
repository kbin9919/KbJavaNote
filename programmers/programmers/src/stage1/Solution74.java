package stage1;

public class Solution74 {
	public String solution(String new_id) {
		new_id = new_id.toLowerCase();
		new_id = new_id.replaceAll("[^a-z0-9-_.]", "");
		new_id = new_id.replaceAll("\\.{2,}", ".");
		new_id = new_id.replaceAll("^\\.|\\.$", "");
		if (new_id.isEmpty()) {
			new_id = "a";
		}
		if (new_id.length() >= 16) {
			new_id = new_id.substring(0, 15);
			new_id = new_id.replaceAll("\\.$", "");
		}
		while (new_id.length() < 3) {
			new_id += new_id.charAt(new_id.length() - 1);
		}
		String answer = new_id;
		return answer;
	}

	public static void main(String[] args) {
		// A-Z = 65 - 90
		// a-z = 97 - 122
		// . = 46 / _ =95 / - = 45
		Solution74 s = new Solution74();
		String str = "...!@BaT#*..y.abcdefghijklm";
		s.solution(str);
	}
}
