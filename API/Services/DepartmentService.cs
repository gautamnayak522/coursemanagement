using CourseManagement.Interfaces;
using CourseManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CourseManagement.Services
{
    public class DepartmentService : Repository<Department>, IDepartment
    {

        //public CourseManagementContext DBContext { get; set; }

        public DepartmentService(CourseManagementContext courseManagementContext) : base(courseManagementContext)
        {
            //DBContext = courseManagementContext
        }
    }
}
