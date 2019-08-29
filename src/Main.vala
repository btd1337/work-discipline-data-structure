
static int main (string[] args) {
	// stdout.printf ("%s\n", student.to_string ());
	// stdout.printf ("Registro: %d", student.registration_number);
	// ClassroomManager.get_student_data ();
	// ClassroomManager.read_classrom_data ("class.txt");
	/*  var mylist = CSVHandler.read_and_convert_to_array ("class.txt");

	   for (int i = 0; i < mylist.length ; i++) {
	        foreach (unowned string str in mylist.index (i)) {
	                stdout.printf ("'%s'\n", str);
	        }
	   }  */
	read_input ("entrada.txt");

	return 0;
}

/*  public void sort_by_id (Array <Review> collection) {
        Sorter.bubble_sort (collection);
   }  */

public void read_input (string path) {
	File file = File.new_for_path(path);
	if (!file.query_exists ()) {
		stderr.printf ("File '%s' doesn't exist.\n", file.get_path());
	} else {
		try {
			var dis = new DataInputStream (file.read());
			string line;
			line = dis.read_line (null);
			int number_analyses = int.parse (line);
			int number_elements;
			while (number_analyses-- > 0) {
				number_elements = int.parse (dis.read_line (null));
				ReviewManager.read_and_print_file ("bgg-13m-reviews.csv", number_elements);
			}
		} catch (Error e) {
			error("%s", e.message);
		}
	}
}