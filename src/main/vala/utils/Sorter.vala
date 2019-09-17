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

	public static ulong quicksort_partition (Review[] vector, ulong start, ulong end)
	{
		ulong pivot = end;
		ulong pivot_position = start;

		for (ulong i = start; i < end; i++) {
			if (vector[i].game_id <= vector[pivot].game_id) {
				ReviewManager.swap_elements (vector, pivot_position, i);
				pivot_position++;
			}
		}

		ReviewManager.swap_elements (vector, pivot, pivot_position);

		return pivot_position;
	}

	public static void quicksort (Review[] vector, ulong start, ulong end)
	{
		if (start < end) {
			ulong pivot = quicksort_partition (vector, start, end);
			quicksort(vector, start, pivot - 1);
			quicksort(vector, pivot + 1, end);
		}
	}
}
