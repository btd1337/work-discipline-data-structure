class Sorter : Object {
/*  public static void bubble_sort (Array<Review> collection) {
        bool isChanged;
        for (long i = 0; i < collection.length; i++) {
                for (long j = 0; j < collection.length - 1; j++) {
                        if (is_greater_than (collection.index (j), collection.index (j+1))) {
                                swap_items (collection, j, j+1);
                        }
                }
        }
   }
 */

	public static void quicksort (QuicksortType type, Review[] vector, ulong start, ulong end, Statistic statistic)
	{
		if (start < end) {
			ulong pivot;
			ulong left_pivot_element;

			switch (type) {
			case QuicksortType.RECURSIVE: {
				pivot = quicksort_partition (vector, start, end, statistic, QuicksortType.RECURSIVE);
				left_pivot_element = pivot != 0 ? pivot - 1 : 0;  // prevent unsigned 0 subtract

				quicksort (QuicksortType.RECURSIVE, vector, start, left_pivot_element, statistic);
				quicksort (QuicksortType.RECURSIVE, vector, pivot + 1, end, statistic);
				break;
			};
			case QuicksortType.MEDIAN: {
				pivot = quicksort_partition (vector, start, end, statistic, QuicksortType.MEDIAN);
				left_pivot_element = pivot != 0 ? pivot - 1 : 0;  // prevent unsigned 0 subtract

				quicksort (QuicksortType.MEDIAN, vector, start, left_pivot_element, statistic);
				quicksort (QuicksortType.MEDIAN, vector, pivot + 1, end, statistic);
				break;
			};
			default:
				break;
			}
		}
	}

	public static ulong quicksort_partition (Review[] vector, ulong start, ulong end, Statistic statistic, QuicksortType type)
	{
		ulong pivot = get_pivot (vector, start, end, type);
		bool is_start_in_index_zero = (start == 0) ? true : false;

		ulong pivot_position = start;

		for (ulong i = start; i < end; i++) {
			statistic.increment_comparisons_number();
			if (vector[i].game_id < vector[pivot].game_id) {
				ReviewManager.swap_elements (vector, pivot_position, i);
				pivot_position++;
				statistic.increment_swaps_number();
			}
		}

		ReviewManager.swap_elements (vector, pivot, pivot_position);
		statistic.increment_swaps_number();

		return pivot_position;
	}



	public static ulong get_pivot (Review[] vector, ulong start, ulong end, QuicksortType type)
	{
		uint number_elements;
		switch (type) {
			case QuicksortType.RECURSIVE: {
				number_elements = 1;
				break;
			}
			case QuicksortType.MEDIAN: {
				number_elements = 3;
				break;
			}
			default: {
				number_elements = 1;
				break;
			}
		}
		// var randomNumbers = new Rand.with_seed (Constraints.seed);
		if (number_elements == 1) {
			// TODO implement random long range
			// return randomNumbers.int_range (start, end);
			return end;
		} else {
			// TODO implement random long range
			// var lista = new Multiset<Pair>();
			return end;
		}
	}
}
