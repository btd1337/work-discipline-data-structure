
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

	ReviewManager.read_and_print_media ("bgg-13m-reviews.csv");

	return 0;
}

/*  public void sort_by_id (Array <Review> collection) {
        Sorter.bubble_sort (collection);
   }  */