class ReviewManager : Object {

	/**
	 * It reads a csv file and print analysed records
	 *
	 * number_records: Number of elements that will be draw
	 * range: Interval between each number to be drawn
	 */
	public static Review[] read_and_get_reviews (string path, ulong number_records)
	{
		ulong total_number_reviews = 13170074;                                           // bgg-13m-reviews
		ulong range = (total_number_reviews / number_records);
		stdout.printf ("Range: %lu\n", range);
		ulong number_drawn;
		int review_number_properties = 6;
		Review[] analyzed_reviews = {};

		File file = File.new_for_path(path);

		if (!file.query_exists ()) {
			stderr.printf ("File '%s' doesn't exist.\n", file.get_path());
		} else {
			try {
				var dis = new DataInputStream (file.read());
				var review_data = new string[review_number_properties];
				string line;
				ulong record_number = 0;
				// while ((line = dis.read_line(null)) != null) {
				line = dis.read_line();
				for (ulong i = 0; i < number_records; i++) {
					number_drawn = Random.int_range (1, (int)range);
					for (ulong j = 0; j < range; j++ ) {                            // go from range to range
						line = dis.read_line();

						if (j == number_drawn) {
							review_data = CSVHandler.csv_to_array (line);           // get a review in array format
							var review = new Review.with_data (review_data);
							analyzed_reviews += review;
							record_number++;
						}
						if (analyzed_reviews.length == number_records) {
							break;
						}
					}
				}
				stdout.printf ("Reading completed.\n");
				// Print array that is being analyzed
				/*  for (int i = 0; i < analyzed_reviews.length; i++) {
				        stdout.printf ("%s\n", analyzed_reviews.index (i).to_string ());
				   }  */
			} catch (Error e) {
				error("%s", e.message);
			}
		}
		return analyzed_reviews;
	}

	public static void swap_elements (Review[] reviews, ulong position_a, ulong position_b)
	{
		Review temp = reviews[position_a];
		reviews[position_a] = reviews[position_b];
		reviews[position_b] = temp;
	}
}