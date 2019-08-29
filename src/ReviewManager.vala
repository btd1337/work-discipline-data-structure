using Readline;

class ReviewManager : Object {

/**
 * It reads a csv file and
 */
public static void read_and_print_file (string path, long number_records) {
	long total_number_reviews = 13170074;        // bgg-13m-reviews
	uint range = (uint) (total_number_reviews / number_records);
	long number_drawn;
	int review_number_properties = 6;

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
				number_drawn = Random.int_range (1, (int) range); // percorrer de range em range
				for (long j = 0; j < range; j++ ) {
					line = dis.read_line();

					if (j == number_drawn) {
						review_data = CSVHandler.csv_to_array (line);
						foreach (var item in review_data) {
							stdout.printf ("%s ", item);
						}
						stdout.printf ("\n");
					}
				}
			}
		} catch (Error e) {
			error("%s", e.message);
		}
	}
}

}