using CourseManagement.Interfaces;
using CourseManagement.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CourseManagement.Services
{
    public class RxemployeeService : Repository<Rxemployee>,IRxemployee
    {
        public CourseManagementContext DBContext { get; set; }
        public RxemployeeService(CourseManagementContext courseManagementContext) : base(courseManagementContext)
        {
            DBContext = courseManagementContext;
        }

        public dynamic GetAllEmployees()
        {
            return DBContext.Rxemployees.Select(u=>
            new
            {
                nodeId = u.EmpId,
                employeeName = u.EmployeeName,
                officialEmail = u.OfficialEmail,
                operationUnit = u.OperationUnit,
                parentNodeId = u.ParentempId
            });
        }

        public dynamic GetMyTeam(int empID)
        {

            List<RxempDTO> list;
            string sql = "EXEC dbo.getmyfullteam @empID";
            var param = new SqlParameter("@empID", empID);

            list = DBContext.RxempDTOs.FromSqlRaw<RxempDTO>(sql,param).ToList();
            
            //list = DBContext.Rxemployees.FromSqlRaw<RxempDTO>(sql).ToList();

            return list;

        }
    }
}
