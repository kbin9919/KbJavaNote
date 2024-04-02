package programmers;

import java.util.Stack;

public class Solution26 {
	public int solution(int n) {
        int answer = 0;
        Stack<Integer> stack = new Stack<Integer>();

        int count = 0;

        while(true){
            count++;
            stack.add(n%3);
            n = n / 3;
            if(n == 0)break;
        }

        for(int i=0; i<count; i++){
//        	System.out.println(stack.pop());
            answer += stack.pop() * (Math.pow(3,i));
            System.out.println(answer);
        }

        return answer;
    }
	public static void main(String[] args) {
		Solution26 s = new Solution26();
//		System.out.println(s.solution(45));
		s.solution(45);
	}
}
