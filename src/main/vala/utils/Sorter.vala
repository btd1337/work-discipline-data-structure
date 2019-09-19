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

/*  private bool is_greater_than (long val_a, long val_b) {
        return val_a.game_id > val_b.game_id ? true : false;
   }
   private void swap_items (Array<Review> collection, long index_a, long index_b) {
        Review aux_item = collection.index (j);
        collection.index (j) = collection.index (j+1);
        collection.index (j+1) = aux_item;
   }  */

	public static ulong quicksort_partition (Review[] vector, ulong start, ulong end, Statistic statistic)
	{
		ulong pivot = end;
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

	public static void quicksort (Review[] vector, ulong start, ulong end, Statistic statistic)
	{
		if (start < end) {
			ulong pivot = quicksort_partition (vector, start, end, statistic);
			ulong left_pivot_element = pivot != 0 ? pivot - 1 : 0;  // prevent unsigned 0 subtract

			quicksort(vector, start, left_pivot_element, statistic);
			quicksort(vector, pivot + 1, end, statistic);
		}
	}
}
