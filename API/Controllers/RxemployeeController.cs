using CourseManagement.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace CourseManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RxemployeeController : ControllerBase
    {



        public IRxemployee rxemployeeservice { get; set; }

        

        public RxemployeeController(IRxemployee service)
        {
            rxemployeeservice = service;
            
        }


        [HttpGet]
        public IActionResult Get()
        {
            return Ok(rxemployeeservice.GetAllEmployees());
        }

        [HttpGet("{empid}")]
        public IActionResult GetMyTeam(int empid)
        {
            return Ok(rxemployeeservice.GetMyTeam(empid));
        }

        [HttpGet("myMoneyString")]

        public IActionResult GetCurrency(string myMoneyString)
        {

            decimal value = Convert.ToDecimal(myMoneyString);
            var updatedvalue = value.ToString("N", System.Globalization.CultureInfo.GetCultureInfo("en-us"));

            return Ok(updatedvalue);
        }

        [HttpGet("mypercentegestring")]

        public IActionResult GetPercentege(string mypercentegestring)
        {
            double asd = Convert.ToDouble(mypercentegestring);
            CultureInfo ci = new CultureInfo("en-us");

            var result = (asd / 100).ToString("P02", ci);
            var result2 = asd.ToString("F2", ci);
            return Ok(result2);
        }


        [HttpGet("Division")]
        public IActionResult GetDivision(int num1, int num2)
        {
            try
            {
                var result = num1 / num2;

                return Ok(result);
            }
            catch (Exception ex)
            {
                
                
                return Ok(ex.Message);
            }

        }

        [HttpGet ("testapi")]
        public IActionResult GetTest()
        {

            var str1 = "abc";
            
            var str2 = "cba";

                
            //str1.ToCharArray().            

            if (str1.SequenceEqual(str2))
            {
                return Ok(true);
            }
            return Ok(false);





            //str1.SequenceEqual(str2)

            //char[] characters = str1.ToCharArray(); 

            //var str = str1.ToCharArray().Select(x=>x.ToString());

            //if(characters.SequenceEqual())

            //return Ok("done");
        }
    }
}
