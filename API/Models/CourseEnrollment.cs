using System;
using System.Collections.Generic;

#nullable disable

namespace CourseManagement.Models
{
    public partial class CourseEnrollment
    {
        public int EnrollId { get; set; }
        public int? EmpId { get; set; }
        public int? CourseId { get; set; }
        public DateTime? EnrollDate { get; set; }

        public virtual Course Course { get; set; }
        public virtual Employee Emp { get; set; }
    }
}
