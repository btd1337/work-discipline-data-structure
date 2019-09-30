class GIO : Object {
	public GIO()
	{

	}

	public static void write_file (string path, string [] texts)
	{
		try {
			// an output file in the current working directory
			var file = File.new_for_path (path);

			// delete if file already exists
			/*  if (file.query_exists ()) {
			        file.delete ();
			   }  */
			var dos = file.append_to (FileCreateFlags.NONE);
			foreach (var item in texts) {
				dos.write (item.data);
			}
		} catch (Error e) {
			stderr.printf ("%s\n", e.message);
		}
	}
}