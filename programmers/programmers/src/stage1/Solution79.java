package stage1;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Solution79 {
	public int[] solution(String[] id_list, String[] report, int k) {
        Map<String, Set<String>> reports = new HashMap<>();
        Map<String, Integer> reportCount = new HashMap<>();
        for (String id : id_list) {
            reports.put(id, new HashSet<>()); 
            reportCount.put(id, 0); 
        }
        for (String rep : report) {
            String[] split = rep.split(" "); 
            String reporter = split[0]; 
            String reported = split[1]; 
            if (!reports.get(reporter).contains(reported)) {
                reports.get(reporter).add(reported); 
                reportCount.put(reported, reportCount.get(reported) + 1); 
            }
        }
        Set<String> suspendedUsers = new HashSet<>();
        for (String id : id_list) {
            if (reportCount.get(id) >= k) {
                suspendedUsers.add(id);
            }
        }
        int[] result = new int[id_list.length];
        for (int i = 0; i < id_list.length; i++) {
            String user = id_list[i];
            int mailCount = 0;
            for (String reportedUser : reports.get(user)) {
                if (suspendedUsers.contains(reportedUser)) {
                    mailCount++;
                }
            }
            result[i] = mailCount; 
        }
        return result;
    }
}
