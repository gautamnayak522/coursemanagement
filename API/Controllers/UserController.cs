using CourseManagement.Interfaces;
using CourseManagement.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CourseManagement.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {

        public IUser userservice { get; set; }
        public UserController(IUser service)
        {
            userservice = service;
        }

        [HttpGet ("GetModulePermissions")]

        public IActionResult GetModulePermissions(int moduleID)
        {

            var currentusers = HttpContext.User;
            var userID = 0;
            if (currentusers.Claims.Count() > 0)
            {
                userID = Convert.ToInt32(currentusers.Claims.FirstOrDefault(x => x.Type == "sid").Value);
            }

            return Ok(userservice.GetModulePermissions(userID,moduleID));
        }
        
        [HttpGet ("GetUserAccessModules")]
        public IActionResult GetUserAccessModules(int userID)
        {
            return Ok(userservice.GetUserAccessModules(userID));
        }

        [HttpGet("GetUsers")]
        public IActionResult GetUsers()
        {
            return Ok(userservice.GetUsers());
        }

        [HttpGet ("GetPermissionsMaster")]
        public IActionResult GetPermissionsMaster(int userID)
        {
            return Ok(userservice.GetPermissionsMaster(userID));
        }

        
        [HttpGet ("GetCurretBalance")]
        public IActionResult GetCurretBalance(int userID)
        {
            var currentusers = HttpContext.User;
            var id = 0;
            if (currentusers.Claims.Count() > 0)
            {
                id = Convert.ToInt32(currentusers.Claims.FirstOrDefault(x => x.Type == "sid").Value);
            }
            if (id == userID)
            {
            return Ok(userservice.GetCurretBalance(userID));
            }
            return BadRequest();


        }

        [HttpPut ("setCurrentBalance")]
        public IActionResult setCurrentBalance(int userID, int balance)
        {

            var currentusers = HttpContext.User;
            var id = 0;
            if (currentusers.Claims.Count() > 0)
            if (currentusers.Claims.Count() > 0)
            {
                id = Convert.ToInt32(currentusers.Claims.FirstOrDefault(x => x.Type == "sid").Value);
            }
            if (id == userID)
            {
                User u2 = userservice.Get(userID);
                User u1 = userservice.Get(userID);
                u1.Balance = balance;
                return Ok(userservice.Put(u2, u1));
            }
            return BadRequest();

            
        }


    }
}
