using System;
using System.Collections.Generic;

#nullable disable

namespace CourseManagement.Models
{
    public partial class Task
    {
        public int TaskId { get; set; }
        public string TaskTitle { get; set; }
        public bool? IsDone { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? DoneDate { get; set; }
    }
}
