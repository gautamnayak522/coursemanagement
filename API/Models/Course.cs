using System;
using System.Collections.Generic;

#nullable disable

namespace CourseManagement.Models
{
    public partial class Course
    {
        public Course()
        {
            CourseEnrollments = new HashSet<CourseEnrollment>();
        }

        public int CourseId { get; set; }
        public string CourseName { get; set; }
        public int? DeptId { get; set; }
        public int? TimeDuration { get; set; }
        
        public string Description { get; set; }

        public int? AuthorId { get; set; }

        public virtual Department Dept { get; set; }

        public virtual Author Author { get; set; } 
        public virtual ICollection<CourseEnrollment> CourseEnrollments { get; set; }
    }
}
