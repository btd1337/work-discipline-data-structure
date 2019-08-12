class CSVHandler : Object {

public static string[] csv_to_array (string record) {
	string[] items = record.split (", ");

	return items;
}

/*  public static void create () {

   }

   public static void read_and_print (string path) {
        read_file (path, CSVOptions.PRINT);
   }

   public static Array<string[]> read_and_convert_to_array (string path) {
        return read_file (path, CSVOptions.CSV_TO_ARRAY);
   }

   private static Array<string[]> read_file (string path, CSVOptions option) {
        File file = File.new_for_path(path);

   if (!file.query_exists ()) {
    stderr.printf ("File '%s' doesn't exist.\n", file.get_path());
   } else {
    try {
        var dis = new DataInputStream (file.read());
                        string line;
                        switch (option) {
                                case CSVOptions.PRINT: {
                                        while ((line = dis.read_line(null)) != null) {
                                                stdout.printf ("%s\n", line);
                                        }
                                        break;
                                }
                                case CSVOptions.CSV_TO_ARRAY: {
                                        Array<Array<string>> records = new Array<Array<string>> ();
                                        Array<string> line_item = new Array<string> ();

                                        while ((line = dis.read_line(null)) != null) {
                                                line_item = csv_to_array (line);
                                                records.append_val (line_item);
                                        }
                                        return records;
                                }
                        }
    } catch (Error e) {
        error("%s", e.message);
    }
        }
        return null;
   }  */
}

/*  public enum CSVOptions {
    PRINT = 1,
    CSV_TO_ARRAY = 2
   }  */