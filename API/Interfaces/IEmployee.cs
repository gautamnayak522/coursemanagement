﻿using CourseManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CourseManagement.Interfaces
{
    public interface IEmployee : IRepository<Employee>
    {
        public dynamic getemployeemaster();

    }
}
