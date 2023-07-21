using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

#nullable disable

namespace CourseManagement.Models
{
    public partial class Rxemployee
    {
        public Rxemployee()
        {
            InverseParentemp = new HashSet<Rxemployee>();
        }

        public int EmpId { get; set; }
        public string EmployeeName { get; set; }
        public string OfficialEmail { get; set; }
        public int? ParentempId { get; set; }

        [JsonIgnore]
        public string Password { get; set; }

        [JsonIgnore]
        public string OperationUnit { get; set; }

        public virtual Rxemployee Parentemp { get; set; }
        public virtual ICollection<Rxemployee> InverseParentemp { get; set; }
    }
}
