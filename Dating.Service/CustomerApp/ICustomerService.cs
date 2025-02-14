using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Dating.Service.CustomerApp.Dto;

namespace Dating.Service.CustomerApp
{
    public interface ICustomerService
    {
        Task<bool> CheckLogin(CustomerLoginDto customerLoginDto);
    }
}