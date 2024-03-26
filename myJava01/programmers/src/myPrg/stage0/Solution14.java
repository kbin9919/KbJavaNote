package programmers.stage1;

import java.util.ArrayList;
import java.util.Collections;

public class Solution14 {
	public int[] solution(int[] arr) {
	 	int[] result = new int[1];
	 	result[0] = -1;
        ArrayList<Integer> list = new ArrayList<>();
        for(int i = 0; i<arr.length; i++) {
        	list.add(arr[i]); 
        }
        list.sort(null);
        Collections.reverse(list);
        int[] answer = new int[arr.length-1];
        int[] result2 = new int[answer.length];
        
        for(int i = 0; i<answer.length; i++) {
        	answer[i] = list.get(i);
        }
        int cnt = 0;
        for(int i = 0; i<arr.length; i++) {
        	for(int j = 0; j<answer.length; j++) {
        		if(arr[i] == answer[j]) {
        			result2[cnt] = answer[j];
        			System.out.println(result2[cnt]);
        			cnt++;
        		}
        	}
        }
        if(arr.length <= 1) {
        	return result; 
        }
        return result2;
    }
}
