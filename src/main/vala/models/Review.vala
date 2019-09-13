class Review : Object {

	private ulong _index;
	private string _user;
	private float _rating;
	private string _comment;
	private ulong _game_id;
	private string _game_name;

	public Review () {}

	public Review.with_data (string[] review_data) {
		_index 		= ulong.parse (review_data[0]);
		_user 		= review_data[1];
		_rating 	= float.parse (review_data[2]);
		_comment 	= review_data[3];
		_game_id 	= ulong.parse (review_data[4]);
		_game_name 	= review_data[5];
	}

	public ulong index {
		get { return _index; }
		set { _index = value; }
	}

	public string user {
		get { return _user; }
		set { _user = value; }
	}

	public float rating {
		get { return _rating; }
		set { _rating = value; }
	}

	public string comment {
		get { return _comment; }
		set { _comment = value; }
	}

	public ulong game_id {
		get { return _game_id; }
		set { _game_id = value; }
	}

	public string game_name {
		get { return _game_name; }
		set { _game_name = value; }
	}

	public string to_string () {
		return _comment == "" ? @"$_index, $_user, $_rating, $_game_id, $_game_name" : @"$_index, $_user, $_rating, $_comment, $_game_id, $_game_name";
	}

}