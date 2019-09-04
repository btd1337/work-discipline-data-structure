
static int main (string[] args) {
	read_input ("entrada.txt");

	return 0;
}

public void read_input (string path) {
	File file = File.new_for_path(path);
	if (!file.query_exists ()) {
		stderr.printf ("File '%s' doesn't exist.\n", file.get_path());
	} else {
		try {
			var dis = new DataInputStream (file.read());			
			string line = dis.read_line (null);							// it read number of analyses
			int number_analyses = int.parse (line);
			int number_elements;
			while (number_analyses-- > 0) {
				number_elements = int.parse (dis.read_line (null));		// it read number of elements that will be analysed
				ReviewManager.read_and_print_file ("bgg-13m-reviews.csv", number_elements);
			}
		} catch (Error e) {
			error("%s", e.message);
		}
	}
}