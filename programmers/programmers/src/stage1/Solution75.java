package stage1;

public class Solution75 {
	public int[] solution(String[] wallpaper) {
		int lux = 99;
		int luy = 99;
		int rdx = 0;
		int rdy = 0;

		for (int i = 0; i < wallpaper.length; i++) {
			for (int j = 0; j < wallpaper[i].length(); j++) {
				if (wallpaper[i].charAt(j) == '#') {
					lux = Math.min(lux, i);
					luy = Math.min(luy, j);
					rdx = Math.max(rdx, i);
					rdy = Math.max(rdy, j);
				}
			}
		}
		
		int[] answer = {lux, luy, rdx+1, rdy+1};
		return answer;
	}

	public static void main(String[] args) {
		Solution75 s = new Solution75();
		String[] str = { ".#...", "..#..", "...#." };
		s.solution(str);
	}

}
