using System;
using System.Collections.Generic;

#nullable disable

namespace CourseManagement.Models
{
    public partial class Module
    {
        public Module()
        {
            InverseParentModule = new HashSet<Module>();
            Permissions = new HashSet<Permission>();
        }

        public int ModuleId { get; set; }
        public string ModuleName { get; set; }
        public bool? IsActive { get; set; }
        public int? ParentModuleId { get; set; }

        public virtual Module ParentModule { get; set; }
        public virtual ICollection<Module> InverseParentModule { get; set; }
        public virtual ICollection<Permission> Permissions { get; set; }
    }
}
