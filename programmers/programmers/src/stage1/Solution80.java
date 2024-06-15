package stage1;

import java.util.Map;
import java.util.TreeMap;

public class Solution80 {
	public int solution(int[] bandage, int health, int[][] attacks) {
		int answer = 0;
		int maxHealth = health;
		Map<Integer, Integer> attacksMap = new TreeMap<>();

		for (int attack[] : attacks) {
			attacksMap.put(attack[0], attack[1]);
		}
		int lastAttack = ((TreeMap<Integer, Integer>) attacksMap).lastKey();
		int bandageCnt = 0;

		for (int i = 0; i <= lastAttack; i++) {
			if (attacksMap.containsKey(i)) {
				health -= attacksMap.get(i);
				bandageCnt = 0;
				System.out.println("공격 후 체력 : " + health);
				if (health < 1) {
					return answer = -1;
				}
				
			} else if (health < maxHealth) {
				health += bandage[1];
				bandageCnt++;
				if (bandageCnt == bandage[0]) {
					health += bandage[2];
					bandageCnt = 0;
				}
				if (health > maxHealth) {
					health = maxHealth;
				}
			}
			System.out.println("현재 체력 : " + health);
		}
		System.out.println("마지막 체력" + health);
		answer = health;
		return answer;
	}

}
