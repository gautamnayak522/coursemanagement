using CourseManagement.Interfaces;
using CourseManagement.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CourseManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DepartmentController : ControllerBase
    {

        public IDepartment departmentservice { get; set; }
        public DepartmentController(IDepartment department)
        {
            departmentservice = department;
        }

        [HttpGet]
        public IActionResult Get()
        {
            return Ok(departmentservice.Get());
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            return Ok(departmentservice.Get(id));
        }

        [HttpPost]
        public IActionResult Post(Department d)
        {
            return Ok(departmentservice.Post(d));
        }


        [HttpPut]
        public IActionResult Put(int id, Department d)
        {
            Department d1 = departmentservice.Get(id);
            return Ok(departmentservice.Put(d1, d));
        }


        [HttpDelete]
        public IActionResult Delete(int id)
        {
            Department d = departmentservice.Get(id);
            return Ok(departmentservice.Delete(d));
        }

    }
}
