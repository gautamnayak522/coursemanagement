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
    [Route("api/[controller]")]
    [ApiController]
    public class PermissionController : ControllerBase
    {
        public IPermission permissionservice { get; set; }
        public PermissionController(IPermission service)
        {
            permissionservice = service;
        }

        [Authorize]
        [HttpPut]
        public IActionResult Put(int id, Permission p)
        {
            Permission p1 = permissionservice.Get(id);
            return Ok(permissionservice.Put(p1, p));
        }
    }
}
