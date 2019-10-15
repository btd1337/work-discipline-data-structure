public class Statistic : Object {
	ulong _number_elements;
	ulong _comparisons_number;
	ulong _swaps_number;
	ulong _start_time;
	ulong _end_time;
	ulong _runtime;

	public Statistic(ulong number_elements)
	{
		_number_elements = number_elements;
		_comparisons_number = 0;
		_swaps_number = 0;
		_start_time = (ulong)GLib.get_real_time () / 1000;
	}

	public ulong number_elements {
		get { return _number_elements; }
		set { _number_elements = value; }
	}

	public ulong comparisons_number {
		get { return _comparisons_number; }
	}

	public ulong swaps_number {
		get { return _swaps_number; }
	}

	public ulong runtime {
		get { return _runtime; }
	}

	public void increment_comparisons_number ()
	{
		_comparisons_number++;
	}

	public void increment_swaps_number ()
	{
		_swaps_number++;
	}

	public void finish_runtime ()
	{
		_end_time = (ulong)GLib.get_real_time () / 1000;
		_runtime = _end_time - _start_time;
	}

	public string to_string ()
	{
		return @"Number of elements: $number_elements || Comparisons Number: $comparisons_number || Swaps Number: $swaps_number || Runtime: $runtime ms";
	}
}