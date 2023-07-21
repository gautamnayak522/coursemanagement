using CourseManagement.Interfaces;
using CourseManagement.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace CourseManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        public IUser userservice { get; set; }

        private IConfiguration _config;

        public LoginController(IConfiguration config, IUser service)
        {
            _config = config;
            userservice = service;
        }

        [AllowAnonymous]
        [HttpPost]
        public IActionResult Login([FromBody] loginDTO login)
        {
            IActionResult response = Unauthorized();
            var user = AuthenticateUser(login);

            if (user != null)
            {
                var tokenString = GenerateJSONWebToken(user);
                response = Ok(new { token = tokenString,userID = user.UserId,userName = user.UserName, Balance = user.Balance });
            }
            else
            {
                
                response = Ok(new { message = "Invalid Creditiantials" });
            }

            return response;
        }
        private string GenerateJSONWebToken(User userInfo)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var claimss = new[] {
                new Claim(JwtRegisteredClaimNames.Sub, userInfo.UserName),
                new Claim(JwtRegisteredClaimNames.Email, userInfo.EmailAddress),
                new Claim(JwtRegisteredClaimNames.Sid, userInfo.UserId.ToString()),
                //new Claim(ClaimTypes.Role, userInfo.UserRole),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };

            var token = new JwtSecurityToken(_config["Jwt:Issuer"],
              _config["Jwt:Issuer"], claims: claimss,
              expires: DateTime.Now.AddMinutes(120),
              signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        private User AuthenticateUser(loginDTO login)
        {
            User user = null;

            User availableuser = userservice.Get().Where(x => x.EmailAddress == login.email && x.Password == login.Password).FirstOrDefault();

            if (availableuser == null)
            {
                return user;
            }

            return availableuser;
        }
    }
}
