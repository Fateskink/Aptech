using System;
using myapp.models;

namespace myapp
{
	public class StudentManagement
	{
		private List<Student> _students = new List<Student>();//eager init
															  //private List<Student> _students;//lazy, field

		//property(Getter, Setter)
		//public List<Student> Students {
		//	get {
		//		_students = _students ?? new List<Student>();
		//              return _students;
		//          }
		//}
		public StudentManagement() {
			//fake data
			_students.Add(new Student()
			{
				Name = "n1",
				Province = "p1",
				BirthYear = 1993,
				Mark = new Result() {
					Math = 1,
					Physics = 1,
					Chemistry = 1
				}
			});
            _students.Add(new Student()
            {
                Name = "n2",
                Province = "p2",
                BirthYear = 1997,
                Mark = new Result()
                {
                    Math = 9,
                    Physics = 9,
                    Chemistry = 9
                }
            });
            _students.Add(new Student()
            {
                Name = "n2",
                Province = "p2",
                BirthYear = 1997,
                Mark = new Result()
                {
                    Math = 4,
                    Physics = 4,
                    Chemistry = 4
                }
            });
        }

        public void Input() {
			Console.WriteLine("Number of students : ");
			int numberOfStudents = Convert.ToInt32(Console.ReadLine());			
			for (int i = 0; i < numberOfStudents; i++) {
				Student student = new Student();
				student.Input();
                _students.Add(student);
			}
		}
		public void Display() {
			//for (int i = 0; i < _students.Count; i++) {
			//	Student student = _students[i];
   //             Console.WriteLine(student);
   //         }
			//traditional
			//foreach (Student student in _students) {
			//	Console.WriteLine(student);
			//}
			//use ForEach method of _students
			_students.ForEach((Student student) =>
			{
                Console.WriteLine(student.ToString());
            });

		}
		public void Sort() {
			_students.Sort((Student studentA, Student studentB) => {
				float studentAMark = studentA.Mark?.getTotalMark() ?? 0f;
                float studentBMark = studentB.Mark?.getTotalMark() ?? 0f ;
                return -(int) (studentAMark - studentBMark);                
            });

        }
	}
}

