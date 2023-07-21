using System;
using System.Collections.Generic;

#nullable disable

namespace CourseManagement.Models
{
    public partial class Permission
    {
        public int PermissionId { get; set; }
        public int? UserId { get; set; }
        public int? ModuleId { get; set; }
        public bool? CalView { get; set; }
        public bool? CanAdd { get; set; }
        public bool? CanUpdate { get; set; }
        public bool? CanDelete { get; set; }

        public virtual Module Module { get; set; }
        public virtual User User { get; set; }
    }
}
