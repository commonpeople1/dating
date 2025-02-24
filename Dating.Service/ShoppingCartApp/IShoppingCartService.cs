using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Dating.Domain;
using Dating.Service.Global;
using Dating.Service.ShoppingCartApp.Dto;

namespace Dating.Service.ShoppingCartApp
{
    public interface IShoppingCartService : ServiceIocTag
    {
        Task<ShoppingCart> SetShoppingCart(ShoppingCartInputDto input);
    }
}