using CourseManagement.Hubs;
using CourseManagement.Interfaces;
using CourseManagement.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace CourseManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    [Authorize]
    public class EmployeeController : ControllerBase
    {
        private readonly IHubContext<myHub> _hubContext;
        public IEmployee employeeservice { get; set; }
        public IUser userservice { get; set; }

        public EmployeeController(IEmployee service,IUser _userservice, IHubContext<myHub> hubContext)
        {
            employeeservice = service;
            _hubContext = hubContext;
            userservice = _userservice;
        }
        [AllowAnonymous]
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(employeeservice.Get());
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            return Ok(employeeservice.Get(id));
        }

        [HttpGet ("GetEmployeeMaster")]

        public IActionResult GetEmployeeMaster()
        {
            return Ok(employeeservice.getemployeemaster());
        }


        [HttpPost]
        public IActionResult Post(Employee e)
        {
            Permission userpermission = GetPermission();
             
            if((bool)userpermission.CanAdd)
            {
                //return Ok("Posted");
                _hubContext.Clients.All.SendAsync("ReceiveOne");
                return Ok(employeeservice.Post(e));
            }
            else
            {
                return Ok(new { error = "No Accees to Add Employee" });
            }
        }

     
        [HttpPut]
        public IActionResult Put(int id, Employee e)
        {
            Permission userpermission = GetPermission();

            if ((bool)userpermission.CanUpdate)
            {
                _hubContext.Clients.All.SendAsync("ReceiveOne");
                Employee e1 = employeeservice.Get(id);
                return Ok(employeeservice.Put(e1, e));
            }
            else
            {
                return Ok(new { error = "No Accees to Update Employee" });
            }
        }


        [HttpDelete]
        public IActionResult Delete(int id)
        {
            Permission userpermission = GetPermission();
            
            if((bool)userpermission.CanDelete)
            {
                //return Ok(new { message = "Accees to Delete" });
                _hubContext.Clients.All.SendAsync("ReceiveOne");
                Employee e = employeeservice.Get(id);
                return Ok(employeeservice.Delete(e));
            }
            else
            {
                return Ok(new { error = "No Accees to Delete" }) ;
            }
        }

        private Permission GetPermission()
        {
            var currentusers = HttpContext.User;
            var userID = 0;
            if (currentusers.Claims.Count() > 0)
            {
                userID = Convert.ToInt32(currentusers.Claims.FirstOrDefault(x => x.Type == "sid").Value);
            }
            //Get module ID by module Name //1
            return this.userservice.GetModulePermissions(userID,1);
        }
    }
}
