class Student : Object {

private int _registration_number;
private string _name;
private float [] _test_grades;

public Student() {
	this._test_grades = new float[2];
}

public Student.with_data(int registration_number, string name, float [] test_grades) {
	this._registration_number = registration_number;
	this._name = name;
	this._test_grades = test_grades;
}

public int registration_number {
	get { return _registration_number; }
	set { _registration_number = value; }
}

public string name {
	get { return _name; }
	set { _name = value; }
}

public float get_test_grade (int test_number) {
	return this._test_grades[test_number - 1];
}

public void add_test_grade (float grade) {
	this._test_grades += grade;
}

public void set_test_grade (int test_number, float grade) {
	this._test_grades[test_number - 1] = grade;
}

public float average_tests_grade () {
	float note = 0;

	foreach (var grade in this._test_grades) {
		note += grade;
	}

	return note/this._test_grades.length;
}

public string to_string() {
	string plain_object = @"$_registration_number, $_name";

	foreach (var grade in this._test_grades) {
		plain_object += @", $grade";
	}
	return plain_object;
}
}