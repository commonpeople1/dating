using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Dating.Domain;
using Dating.Service.CustomerApp.Dto;

namespace Dating.Service.CustomerApp
{
    public interface ICustomerService : ServiceIocTag
    {
        Task<bool> CheckPassword(CustomerLoginDto customerLoginDto);
        Task<Customer> GetCustomerAsync(string customerNo);
    }
}