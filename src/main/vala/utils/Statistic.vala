class Statistic : Object {
	ulong _comparisons_number;
	ulong _swaps_number;

	public Statistic()
	{
		_comparisons_number = 0;
		_swaps_number = 0;
	}

	public ulong comparisons_number {
		get { return _comparisons_number; }
	}

	public ulong swaps_number {
		get { return _swaps_number; }
	}

	public void increment_comparisons_number ()
	{
		_comparisons_number++;
	}

	public void increment_swaps_number ()
	{
		_swaps_number++;
	}

	public string to_string ()
	{
		return @"Comparisons Number: $comparisons_number || Swaps Number: $swaps_number";
	}
}