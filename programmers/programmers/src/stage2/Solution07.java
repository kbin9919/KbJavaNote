package stage2;

public class Solution07 {
	public int solution(int n) {
		String binaryN = Integer.toBinaryString(n);
		int binaryNCnt = countChar(binaryN, '1');
		
		while(true) {
			n++;
			binaryN = Integer.toBinaryString(n);
			int newBinaryNCnt = countChar(binaryN, '1');
			if(binaryNCnt == newBinaryNCnt) {
				break;
			}
		}
        int answer = Integer.parseInt(binaryN, 2);;
        return answer;
    }

	public static int countChar(String str, char targetChar) {
		int count = 0;
		for (int i = 0; i < str.length(); i++) {
			if (str.charAt(i) == targetChar) {
				count++;
			}
		}
		return count;
	}
}
