
static int main (string[] args)
{
	read_input ("entrada.txt");

	return 0;
}

public void read_input (string path)
{
	File file = File.new_for_path(path);
	if (!file.query_exists ()) {
		stderr.printf ("File '%s' doesn't exist.\n", file.get_path());
	} else {
		try {
			var dis = new DataInputStream (file.read());
			string line = dis.read_line (null);                                                     // it read number of analyses
			int number_analyses = int.parse (line);
			int number_elements;
			while (number_analyses-- > 0) {
				number_elements = int.parse (dis.read_line (null));             // it read number of elements that will be analysed
				Array<Review> vector = ReviewManager.read_and_get_reviews ("bgg-13m-reviews.csv", number_elements);
				Sorter.quicksort (vector, 0, vector.length - 1);
				print_reviews (vector);

			}
		} catch (Error e) {
			error("%s", e.message);
		}
	}
}

public void print_reviews (Array<Review> reviews)
{
	for (int i = 0; i < reviews.length; i++) {
		stdout.printf ("%s\n", reviews.index (i).to_string ());
	}
}