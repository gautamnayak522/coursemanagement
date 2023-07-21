using CourseManagement.Interfaces;
using CourseManagement.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CourseManagement.Services
{
    public class EmployeeService : Repository<Employee>,IEmployee
    {
        public CourseManagementContext DBContext { get; set; }
        public EmployeeService(CourseManagementContext courseManagementContext) : base (courseManagementContext)
        {
            DBContext = courseManagementContext;
        }

        public dynamic getemployeemaster()
        {
            var returndata = DBContext.Employees.Include(x=>x.CourseEnrollments).ToList();
            return returndata;
        }
    }
}
