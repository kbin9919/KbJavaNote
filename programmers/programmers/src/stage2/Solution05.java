package stage2;

public class Solution05 {
	public int[] solution(String s) {
		int removeCnt = 0;
		int changeCnt = 0;
		while (!s.equals("1")) {
			int sl = s.length();
			s = s.replace("0", "");
			int newSl = s.length();
			removeCnt += (sl - newSl);
			
			s = Integer.toBinaryString(newSl);
			changeCnt++;
		}
		int[] answer = {changeCnt,removeCnt};
		
		return answer;
	}
}


