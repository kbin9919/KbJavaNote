package stage1;

import java.util.HashMap;

public class Solution77 {
	public String[] solution(String[] players, String[] callings) {
		String[] answer = new String[players.length];
		HashMap<String, Integer> PlayerMap = new HashMap<>();
		HashMap<Integer, String> RankMap = new HashMap<>();
		for (int i = 0; i < players.length; i++) {
			PlayerMap.put(players[i], i);
			RankMap.put(i, players[i]);
		}
		for (int i = 0; i < callings.length; i++) {
			// 추월한 유저 순위
			// 추월한 유저 이름
			int currentRank = PlayerMap.get(callings[i]);
			String player = RankMap.get(currentRank);
			// 바로 앞 플레이어
			String frontPlayer = RankMap.get(currentRank - 1);
			// swap
			PlayerMap.put(player, currentRank - 1);
			PlayerMap.put(frontPlayer, currentRank);
			RankMap.put(currentRank - 1, player);
			RankMap.put(currentRank, frontPlayer);
		}

		for (int i = 0; i < players.length; i++) {
			answer[i] = RankMap.get(i);
		}

		return answer;
	}

	public static void main(String[] args) {
		Solution77 s = new Solution77();
		String[] str1 = { "mumu", "soe", "poe", "kai", "mine" };
		String[] str2 = { "kai", "kai", "mine", "mine" };
		s.solution(str1, str2);
	}
}
