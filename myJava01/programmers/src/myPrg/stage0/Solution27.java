package programmers;

import java.util.ArrayList;

public class Solution27 {
	public int solution(int[] d, long budget) {
        int answer = 0;
        ArrayList<Integer> list = new ArrayList<Integer>();
        for(int i =0; i<d.length; i++) {
        	list.add(d[i]);
        }
        list.sort(null);
        for(int i = 0; i < d.length; i ++) {
        	if(d[i] > budget) {
        		break;
        	}
        	budget -= d[i];
        	answer++;
        }
        return answer;
    }
}
