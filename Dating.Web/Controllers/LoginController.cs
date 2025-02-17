using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Dating.Common.TokenModule;
using Dating.Common.TokenModule.Model;
using Dating.Service.CustomerApp;
using Dating.Service.CustomerApp.Dto;

using Microsoft.AspNetCore.Mvc;

namespace Dating.Web.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class LoginController : ControllerBase
    {
        private readonly ICustomerService _customerService;
        private readonly IConfiguration _configuration;
        public LoginController(ICustomerService customerService, IConfiguration configuration)
        {
            _customerService = customerService;
            _configuration = configuration;
            // , IConfiguration configuration
            // _configuration = configuration;
        }
        [HttpPost]
        public async Task<IActionResult> CheckLogin(CustomerLoginDto dto)
        {
            if (string.IsNullOrEmpty(dto.CustomerNo) || string.IsNullOrEmpty(dto.Password))
            {
                return BadRequest("用户名或密码不能为空");
            }
            var customer = await _customerService.GetCustomerAsync(dto.CustomerNo);
            if (customer == null)
            {
                return BadRequest("用户不存在");
            }
            var res = await _customerService.CheckPassword(dto);
            if (res)
            {
                // var token = "131";
                var token = GetToken(customer.Id, customer.CustomerNo, customer.CustomerName);
                return Ok(token);
            }
            else
            {
                return BadRequest("密码错误");
            }

        }
        private string GetToken(int customerId, string customerNo, string customerName)
        {
            var token = _configuration.GetSection("Jwt").Get<JwtTokenModel>();
            token.Id = customerId;
            token.CustomerNo = customerNo;
            token.CustomerName = customerName;
            return TokenHelper.GetToken(token);
        }

    }

}