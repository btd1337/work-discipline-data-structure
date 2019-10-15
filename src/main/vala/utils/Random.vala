public class Random : Object {
	private static long _correction_factor = long.MAX / int.MAX;

	public long correction_factor {
		get { return _correction_factor; }
	}

	public static long next_long ()
	{
		var randomNumbers = new Rand.with_seed (Constraints.seed);

		return randomNumbers.next_int () * randomNumbers.next_int () * 2;
	}

	public static long long_range (long begin, long end)
	{
		long max_int = int.MAX;
		var random_numbers = new Rand.with_seed (Constraints.seed);

		// Long range in Int range
		if (end <= max_int) {
			string begin_str = begin.to_string ();
			int begin_int = int.parse (begin_str);

			string end_str = end.to_string ();
			int end_int = int.parse (end_str);

			return (long)random_numbers.int_range (begin_int, end_int);
		}
		// TODO
		return begin;
	}
}