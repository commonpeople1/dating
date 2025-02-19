using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Dating.Core.Repository;
using Dating.Domain;
using Dating.Service.CustomerApp.Dto;
using Dating.Common.Md5Module;
namespace Dating.Service.CustomerApp
{
    public class CustomerService : ICustomerService
    {
        private readonly IRepository<Customer> _customerRepo;
        private readonly IRepository<CustomerInvoice> _customerInvoiceRepo;
        private readonly IRepository<CustomerPwd> _customerPwdRepo;
        public CustomerService(IRepository<Customer> customerRepo,
        IRepository<CustomerInvoice> customerInvoiceRepo,
        IRepository<CustomerPwd> customerPwdRepo)
        {
            _customerRepo = customerRepo;
            _customerInvoiceRepo = customerInvoiceRepo;
            _customerPwdRepo = customerPwdRepo;
        }
        public async Task<bool> CheckPassword(CustomerLoginDto customerLoginDto)
        {
            var res = await _customerPwdRepo.GetAsync(x => x.CustomerNo == customerLoginDto.CustomerNo && x.CustomerPwd1 == customerLoginDto.Password.ToMd5());
            if (res != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public async Task<Customer> GetCustomerAsync(string customerNo)
        {
            return await _customerRepo.GetAsync(x => x.CustomerNo == customerNo);
        }
    }
}