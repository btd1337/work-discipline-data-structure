using Readline;

class ReviewManager : Object {

	/**
	 * It reads a csv file and print analysed records
	 * 
	 * number_records: Number of elements that will be draw
	 * range: Interval between each number to be drawn
	 */
	public static void read_and_print_file (string path, long number_records) {
		long total_number_reviews = 13170074;        					// bgg-13m-reviews
		uint range = (uint) (total_number_reviews / number_records);
		long number_drawn;
		int review_number_properties = 6;
		var analyzed_reviews = new Array<Review>();
		

		File file = File.new_for_path(path);

		if (!file.query_exists ()) {
			stderr.printf ("File '%s' doesn't exist.\n", file.get_path());
		} else {
			try {
				var dis = new DataInputStream (file.read());
				var review_data = new string[review_number_properties];
				string line;
				// while ((line = dis.read_line(null)) != null) {
				line = dis.read_line();
				for (long i = 0; i < number_records; i++) {
					number_drawn = Random.int_range (1, (int) range); 		
					for (long j = 0; j < range; j++ ) {							// go from range to range
						line = dis.read_line();

						if (j == number_drawn) {
							review_data = CSVHandler.csv_to_array (line);		// get a review in array format
							var review = new Review.with_data (review_data);
							analyzed_reviews.append_val (review);
						}
					}
				}

				// Print array that is being analyzed
				for (int i = 0; i < analyzed_reviews.length; i++) {
					stdout.printf ("%s\n", analyzed_reviews.index (i).to_string ());
				}
			} catch (Error e) {
				error("%s", e.message);
			}
		}
	}
}