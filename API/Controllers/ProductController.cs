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
    [Authorize]
    public class ProductController : ControllerBase
    {
        public IProduct productservice { get; set; }
        public ProductController(IProduct service)
        {
            productservice = service;
        }
        [AllowAnonymous]
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(productservice.Get());
        }

        [AllowAnonymous]
        [HttpGet("GetDataWithPagination")]
        public IActionResult GetDataWithPagination(int pageNo = 1, int pageSize = 10, string searchstring = "", string sortcolumnname = "productId", bool sortorder = true)
        {
            return Ok(productservice.GetDataWithPagination(pageNo, pageSize, searchstring, sortcolumnname, sortorder));
        }

        [HttpGet("{id}")]
        public IActionResult GetProductById(int id)
        {
            return Ok(productservice.Get(id));
        }

        [HttpPut]
        public IActionResult Put(int id, Product p)
        {

            //_hubContext.Clients.All.SendAsync("ReceiveOne");
            Product p1 = productservice.Get(id);
            return Ok(productservice.Put(p1, p));

        }

        [HttpDelete]

        public IActionResult Delete(int id)
        {
            Product p1 = productservice.Get(id);
            return Ok(productservice.Delete(p1));

        }

    }
}
