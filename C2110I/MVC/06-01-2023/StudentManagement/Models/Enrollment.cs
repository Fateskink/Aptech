﻿namespace StudentManagement.Models
{
    public enum Grade { 
        A, B, C, D, E
    }
    public class Enrollment
    {
        public int StudentID { get; set; }
        public int CourseID { get; set; }
        public Grade Grade { get; set; }
        public string? Remarks { get; set; }

        //navigation
        public Course Course { get; set; }
        public Student Student { get; set; }

    }
}
