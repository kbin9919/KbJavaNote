package stage1;

import java.util.ArrayList;
import java.util.List;

public class Solution06 {
	public long solution(long n) {
		long answer = 0;
		String str = Long.toString(n);
		Long[] x = new Long[str.length()];
		List<Long> y = new ArrayList<Long>();
		String st = " ";
		for (int i = 0; i < str.length(); i++) {
			x[i] = Long.valueOf(str.charAt(i) - 48);
			y.add(x[i]);
		}
		y.sort(null);
		for (int i = y.size() - 1; i >= 0; i--) {
			st += y.get(i);
		}
		return answer = Long.parseLong(st.substring(1, st.length()));
	}
}
