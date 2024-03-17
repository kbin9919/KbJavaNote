package myPrg.stage0;

public class solution1 {

	public int solution(int n) {
	    int x = 1;
	    while(true){
	       if(n%x==1){
	          break;
	       }
	        x++;
	    }
	    int answer = x;
	    return answer;
	}

}
