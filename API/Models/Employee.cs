using System;
using System.Collections.Generic;

#nullable disable

namespace CourseManagement.Models
{
    public partial class Employee
    {
        public Employee()
        {
            CourseEnrollments = new HashSet<CourseEnrollment>();
        }

        public int EmpId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailAddress { get; set; }
        public decimal? MobileNo { get; set; }
        public int? DeptId { get; set; }

        public virtual Department Dept { get; set; }
        public virtual ICollection<CourseEnrollment> CourseEnrollments { get; set; }
    }
}
