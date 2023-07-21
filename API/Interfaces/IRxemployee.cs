using CourseManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CourseManagement.Interfaces
{
    public interface IRxemployee : IRepository<Rxemployee>
    {
        public dynamic GetAllEmployees();

        public dynamic GetMyTeam(int empID);

    }
}
