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
    public class TaskController : ControllerBase
    {

        public ITask taskservice { get; set; }
        public TaskController(ITask service)
        {
            taskservice = service;
        }

        [HttpGet ("Gettodo")]
        public IActionResult Gettodo()
        {
            return Ok(taskservice.Gettodo());
        }

        [HttpGet("Getdone")]
        public IActionResult Getdone()
        {
            return Ok(taskservice.Getdone());
        }

        [HttpPost ("SetDoneList")]
        public IActionResult SetDoneList(List<string> donelist)
        {
            return Ok(taskservice.SetDoneList(donelist));
        }

        [HttpPost]
        public IActionResult addnewTask([FromBody] Models.Task t)
        {
            return Ok(taskservice.addnewTask(t));
        }
    }
}
