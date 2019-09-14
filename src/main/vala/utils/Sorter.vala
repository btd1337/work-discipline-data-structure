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

	public static uint quicksort_partition (Array<Review> vector, uint start, uint end)
	{
		uint pivot = start;
		Review aux = new Review ();

		for (uint i = start + 1; i < end + 1; i++) {
			if (vector.index (pivot).game_id <= vector.index (start).game_id) {
				pivot += 1;
				aux = vector.index (pivot);
				vector.index (pivot) = vector.index (i);
				vector.index (i) = aux;
			}
		}

		aux = vector.index (pivot);
		vector.index (pivot) = vector.index (start);
		vector.index (start) = aux;

		return pivot;
	}

	public static void quicksort (Array<Review> vector, uint start, uint end)
	{
		uint pivot;
		if (start < end) {
			pivot = quicksort_partition (vector, start, end);

			quicksort(vector, start, pivot - 1);
			quicksort(vector, pivot + 1, end);
		}
	}
}
