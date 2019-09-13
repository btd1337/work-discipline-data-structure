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

	public static long[] quicksort (Array<Review> vector)
	{
		long start = 0;
		long end = vector.length - 1;
		quicksort_aux(vector, start, end);

		return vector;
	}

	public static void quicksort_aux (Array<Review> vector, long start, long end)
	{
		if (start < end) {
			long p = vector.index(start);
			long i = start + 1;
			long f = end;

			while (i <= f) {
				if (vector.index(i) <= p) {
					i++;
				} else if (p < vector.index(f)) {
					f--;
				} else {
					long aux = vector.index(i);
					vector.index(i) = vector.index(f);
					vector.index(f) = aux;
					i++;
					f--;
				}
			}

			vector.index(start) = vector.index(f);
			vector.index(f) = p;

			quicksort_aux(vector, start, f - 1);
			quicksort_aux(vector, f + 1, end);
		}
	}
}