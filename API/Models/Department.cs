using System;
using System.Collections.Generic;

#nullable disable

namespace CourseManagement.Models
{
    public partial class Department
    {
        public Department()
        {
            Courses = new HashSet<Course>();
            Employees = new HashSet<Employee>();
        }

        public int DeptId { get; set; }
        public string DeptName { get; set; }

        public virtual ICollection<Course> Courses { get; set; }
        public virtual ICollection<Employee> Employees { get; set; }
    }
}
