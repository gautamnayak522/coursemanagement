using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace CourseManagement.Models
{
    public class RxempDTO
    {
        [Key]
        public int nodeId { get; set; }
        public string EmployeeName { get; set; }
        public string OfficialEmail { get; set; }
        public int? ParentNodeId { get; set; }
    }
}
