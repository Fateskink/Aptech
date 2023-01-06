namespace StudentManagement.Models
{
    public class Student
    {
        public int StudentID { get; set; }
        public string StudentName { get; set; }
        public string Email { get; set;}
        public string? Address { get; set; }
        public DateOnly DOB { get; set; }

        //navigation property
        public ICollection<Enrollment> Enrollments { get; set; }
    }
}
