package stage1;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;

public class Solution72 {

	public int[][] solution(int[][] data, String ext, int val_ext, String sort_by) {
		final int firstSortColumn = filter(ext);

		final int threshold = val_ext;

		final int secondSortColumn = filter(sort_by);

		Arrays.sort(data, new Comparator<int[]>() {
			@Override
			public int compare(int[] a, int[] b) {
				return Integer.compare(a[firstSortColumn], b[firstSortColumn]);
			}
		});

		ArrayList<int[]> filteredList = new ArrayList<>();
		for (int[] row : data) {
			if (row[firstSortColumn] < threshold) {
				filteredList.add(row);
			}
		}

		int[][] filteredArray = new int[filteredList.size()][];
		filteredArray = filteredList.toArray(filteredArray);

		Arrays.sort(filteredArray, new Comparator<int[]>() {
			@Override
			public int compare(int[] a, int[] b) {
				return Integer.compare(a[secondSortColumn], b[secondSortColumn]);
			}
		});

		int[][] resultArray = new int[filteredArray.length][];
		for (int i = 0; i < filteredArray.length; i++) {
			resultArray[i] = Arrays.copyOf(filteredArray[i], filteredArray[i].length);
		}
		return resultArray;
	}

	private int filter(String val) {
		int ext = 0;
		if (val.equals("date")) {
			ext = 1;
		} else if (val.equals("maximum")) {
			ext = 2;
		} else if (val.equals("remain")) {
			ext = 3;
		}
		return ext;
	}

}
