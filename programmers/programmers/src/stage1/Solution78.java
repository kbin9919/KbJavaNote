package stage1;

public class Solution78 {
	public static int[] solution(String[] park, String[] routes) {
        int H = park.length;
        int W = park[0].length();
        int x = 0, y = 0;
        for (int i = 0; i < H; i++) {
            for (int j = 0; j < W; j++) {
                if (park[i].charAt(j) == 'S') {
                    x = i;
                    y = j;
                    break;
                }
            }
        }
        int[][] directions = {
            {0, 1},  // E 
            {0, -1}, // W 
            {-1, 0}, // N 
            {1, 0}   // S 
        };

        for (String route : routes) {
            String[] split = route.split(" ");
            String dir = split[0];
            int distance = Integer.parseInt(split[1]);
            int dx = 0, dy = 0;
            switch (dir) {
                case "E":
                    dx = directions[0][0];
                    dy = directions[0][1];
                    break;
                case "W":
                    dx = directions[1][0];
                    dy = directions[1][1];
                    break;
                case "N":
                    dx = directions[2][0];
                    dy = directions[2][1];
                    break;
                case "S":
                    dx = directions[3][0];
                    dy = directions[3][1];
                    break;
            }
            boolean canMove = true;
            int nx = x, ny = y;
            for (int i = 0; i < distance; i++) {
                nx += dx;
                ny += dy;
                
                if (nx < 0 || nx >= H || ny < 0 || ny >= W || park[nx].charAt(ny) == 'X') {
                    canMove = false;
                    break;
                }
            }
            if (canMove) {
                x = nx;
                y = ny;
            }
        }
        return new int[]{x, y};
    }
}
