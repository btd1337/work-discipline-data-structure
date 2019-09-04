class CSVHandler : Object {

public static string[] csv_to_array (string record) {
	string[] items = {};
	string character;
	string previous_character = "";
	string current_item = "";
	bool isEscapeOpened = false;
	for (int i = 0; i < record.char_count(); i++) {
		character = record.get_char(record.index_of_nth_char(i)).to_string();

		switch (character) {
			case ",": {
				if (!isEscapeOpened) {
					items += current_item;
					current_item = "";
				} else {
					current_item += character;
				}
				break;
			}
			case " ": {
				if (!(previous_character == "," && !isEscapeOpened)) {
					current_item += character;
				}
				break;
			}
			case "\"": {
				if (!isEscapeOpened) {
					isEscapeOpened = true;
				} else {
					isEscapeOpened = false;
				}
				break;
			}
			default: {
				current_item += character;
				break;
			}
		}
	}
	// check last position
	if (current_item != "") {
		items += current_item;
	}

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