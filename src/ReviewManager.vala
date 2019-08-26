using Readline;

class ReviewManager : Object {

public static void get_student_data () {
	int cmd = 0;
	var student = new Student ();

	do {
		stdout.printf("\n==== NEW STUDENT ===\n\n");
		student.registration_number = int.parse (readline ("Registration Number: "));
		student.name = readline ("Name: ");
		student.set_test_grade(1, float.parse (readline ("Exam Note 1: ")));
		student.set_test_grade(2, float.parse (readline ("Exam Note 2: ")));

		write_student_data("class.txt", student);

		cmd = int.parse (readline ("Continue? (0- No, 1- Yes): "));
	} while (cmd != 0);
}

/**
 * It reads a list of students and print each record
 */
public static void read_classrom_data (string path) {
	File file = File.new_for_path(path);

	if (!file.query_exists ()) {
		stderr.printf ("File '%s' doesn't exist.\n", file.get_path());
	} else {
		try {
			var dis = new DataInputStream (file.read());
			string line;

			while ((line = dis.read_line(null)) != null) {
				stdout.printf ("%s\n", line);
			}
		} catch (Error e) {
			error("%s", e.message);
		}
	}
}

/**
 * It reads a csv file and print: student name - average
 */
public static void read_and_print_media (string path) {
	File file = File.new_for_path(path);
	int review_number_properties = 30;

	if (!file.query_exists ()) {
		stderr.printf ("File '%s' doesn't exist.\n", file.get_path());
	} else {
		try {
			var dis = new DataInputStream (file.read());
			var review_data = new string[review_number_properties];
			string line;
			// while ((line = dis.read_line(null)) != null) {
			int i=0;
			while (i++ < 5) {
				line = dis.read_line(null);
				review_data = CSVHandler.csv_to_array (line);

				//stdout.printf ("Aluno: %s\tMédia: %.2f\n", review_data[1], ((float.parse (review_data[2]) + float.parse (review_data[3]))/2));
				stdout.printf ("Review: ");
				foreach (var item in review_data) {
					stdout.printf ("%s ", item);
				}
				stdout.printf ("\n");
			}
		} catch (Error e) {
			error("%s", e.message);
		}
	}
}

public static void write_student_data (string path, Student student) {
	// reference a local file name
	File file = File.new_for_path (path);

	try {
		// create a new file with this name
		FileOutputStream file_stream = file.append_to (FileCreateFlags.NONE);
		file_stream.write (@"$student\n".data);

	} catch (Error e) {
		stderr.printf ("Error: %s\n", e.message);
	}
}
}
