using System;
using System.Collections.Generic;

#nullable disable

namespace CourseManagement.Models
{
    public partial class User
    {
        public User()
        {
            Permissions = new HashSet<Permission>();
        }

        public int UserId { get; set; }
        public string UserName { get; set; }
        public string EmailAddress { get; set; }
        public string Password { get; set; }
        public int? RoleId { get; set; }
        public int Balance { get; set; }

        public virtual Role Role { get; set; }
        public virtual ICollection<Permission> Permissions { get; set; }
    }
}
