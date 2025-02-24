using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using AutoMapper;

using Dating.Core.Repository;
using Dating.Domain;
using Dating.Service.ShoppingCartApp.Dto;

namespace Dating.Service.ShoppingCartApp
{
    public class ShoppingCartService : IShoppingCartService
    {
        private readonly IRepository<ShoppingCart> _cartRepo;
        private readonly IMapper _mapper;
        public ShoppingCartService(IRepository<ShoppingCart> cartRepo, IMapper mapper)
        {
            _cartRepo = cartRepo;
            _mapper = mapper;
        }
        public async Task<ShoppingCart> SetShoppingCart(ShoppingCartInputDto input)
        {
            var shoppingCart = _mapper.Map<ShoppingCartInputDto, ShoppingCart>(input);
            shoppingCart.CartGuid = Guid.NewGuid().ToString();
            shoppingCart.CartSelected = true;
            var res = await _cartRepo.InsertAsync(shoppingCart);
            return res;
        }
    }
}