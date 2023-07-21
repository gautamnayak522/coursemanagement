using CourseManagement.Interfaces;
using CourseManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CourseManagement.Services
{
    public class PermissionService: Repository<Permission>,IPermission
    {
        public PermissionService(CourseManagementContext courseManagementContext):base(courseManagementContext)
        {

        }
    }
}
