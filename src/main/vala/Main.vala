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
			string line = dis.read_line (null);                                    // it read number of analyses
			ulong number_analyses = ulong.parse (line);
			ulong number_elements;
			Statistic[] statistics = {};
			while (number_analyses-- > 0) {
				number_elements = ulong.parse (dis.read_line (null));
				stdout.printf ("\nReading the file...\n");             // it read number of elements that will be analysed
				Review[] reviews = ReviewManager.read_and_get_reviews ("bgg-13m-reviews.csv", number_elements);

				var statistic = new Statistic (number_elements);
				Sorter.quicksort (reviews, 0, reviews.length - 1, statistic);
				statistic.finish_runtime ();
				// print_reviews (reviews);
				statistics += statistic;
			}
			stdout.printf ("\n== Quicksort Statistics ==\n");
			foreach (var item in statistics) {
				stdout.printf ("%s\n", item.to_string());
			}
			write_quicksort_statistics(statistics);
		} catch (Error e) {
			error("%s", e.message);
		}
	}
}

public void print_reviews (Review[] reviews)
{
	for (ulong i = 0; i < reviews.length; i++) {
		stdout.printf ("%lu\n", reviews[i].game_id);
	}
}

public void write_quicksort_statistics (Statistic[] statistics)
{
	string[] texts = {};
	texts += "===   QuickSort ===   \n";
	foreach (var item in statistics) {
		texts += item.to_string();
	}
	texts += "\n";
	GIO.write_file ("saida.txt", texts);
}
