using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Dating.Core.Global;
using Dating.Domain;
using Dating.Service.Global;
using Dating.Service.ProductApp.Dto;

namespace Dating.Service.ProductApp
{
    public interface IProductService : ServiceIocTag
    {
        Task<IEnumerable<ProductDto>> GetProductDto(PageWithSort pageWithSort);
    }
}