package stage1;

import java.util.HashMap;
import java.util.Map;

public class Solution65 {
	public String solution(String X, String Y) {
		Map<Integer, Integer> xMap = new HashMap();
		Map<Integer, Integer> yMap = new HashMap();
		
		int putNum = 0;
		for (String x : X.split("")) {
			putNum = Integer.parseInt(x);
			xMap.put(putNum, xMap.getOrDefault(putNum, 0) + 1);
		}
		
		for (String y : Y.split("")) {
			putNum = Integer.parseInt(y);
			yMap.put(putNum, yMap.getOrDefault(putNum, 0) + 1);
		}
		
		StringBuilder sb = new StringBuilder();
		
		for (int i = 9; i >= 0; i--) {
			if (xMap.containsKey(i) && yMap.containsKey(i)) {
				int cnt = Math.min(xMap.get(i), yMap.get(i));
				for (int j = 0; j < cnt; j++) {
					sb.append(i);
				}
			}
		}
		if(sb.toString().startsWith("0")) {
			return "0";
		}
		if(sb.toString().equals("")) {
			return "-1";
		}
		return sb.toString();
	}

	public static void main(String[] args) {
		Solution65 s = new Solution65();

		s.solution("100", "2345");
	}
}
