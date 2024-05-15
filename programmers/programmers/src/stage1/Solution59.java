package stage1;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Solution59 {
	public int[] solution(int N, int[] stages) {
		int[] answer = new int[N];
		int Cnt[] = new int[N];
		for (int i = 0; i < stages.length; i++) {
			if (stages[i] != N + 1) {
				Cnt[stages[i] - 1]++;
			}
		}
		Map <Integer ,Double> m = new HashMap<>();
		int num = stages.length;
		for (int i = 0; i < N; i++) {
			if(Cnt[i] == 0) {
				m.put(i+1, 0.0);
			}else {
				m.put(i+1, (double)Cnt[i] / num);
			}
			num -= Cnt[i];
		}
		List<Integer> list = new ArrayList<>(m.keySet());
		list.sort((a,b) -> m.get(b).compareTo(m.get(a)));
		for(int i =0; i<N; i++) {
			answer[i] = list.get(i);
		}
		
		return answer;
	}

	public static void main(String[] args) {
		Solution59 s = new Solution59();
		int x[] = { 2, 1, 2, 6, 2, 4, 3, 3 };
		s.solution(5, x);
		
	}
}
