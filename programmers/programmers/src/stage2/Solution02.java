package stage2;

public class Solution02 {
	boolean solution(String s) {
		int cnt1 = 0;
		int cnt2 = 0;
		boolean isOpen = false;
		for (int i = 0; i < s.length(); i++) {
			if (isOpen == false) {
				if (s.charAt(i) == ')') {
					return false;
				} else {
					cnt1++;
					isOpen = true;
				}
			} else {
				if (s.charAt(i) == '(') {
					cnt1++;
				} else {
					cnt2++;
					if (cnt1 == cnt2) {
						isOpen = false;
					}
				}
			}
		}
		if (cnt1 == cnt2) {
			return true;
		}
		return false;
	}
}
