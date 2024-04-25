package programmers;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Solution38 {
	public int[] solution(int[] numbers) {
        Set<Integer> set = new HashSet<Integer>();
        
        for(int i = 0; i < numbers.length; i++) {
        	for(int j = 0; j<numbers.length; j++) {
        		if(i != j) {
        			set.add(numbers[i]+numbers[j]);
        		}
        	}
        }
        int[] answer = new int[set.size()];
        Iterator iter = set.iterator();
        int i = 0;
        while (iter.hasNext()) { 
        	answer[i] = (int) iter.next();
			System.out.println(answer[i]);
			i++;
		}
        Arrays.sort(answer);
        return answer;
    }
	public static void main(String[] args) {
		Solution38 s = new Solution38();
		int [] x = {2,1,3,4,1};
		s.solution(x);
	}
}
