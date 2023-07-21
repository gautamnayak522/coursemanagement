using CourseManagement.Interfaces;
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
    public class CourseController : ControllerBase
    {
        public ICourse courseservice { get; set; }

        public CourseController(ICourse course)
        {
            courseservice = course;
                
        }

        [HttpGet]
        public IActionResult GetCourses()
        {

            return Ok(courseservice.Get());
        }

        [HttpGet ("GetCourseMaster")]
        public IActionResult GetCourseMaster()
        {
            return Ok(courseservice.GetCourseMaster());
        }
    }
}
