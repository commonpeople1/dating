using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Dating.Service.ShoppingCartApp;
using Dating.Service.ShoppingCartApp.Dto;

using Microsoft.AspNetCore.Mvc;

namespace Dating.Web.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ShoppingCartController : ControllerBase
    {
        private readonly IShoppingCartService _shoppingCartService;
        public ShoppingCartController(IShoppingCartService shoppingCartService)
        {
            _shoppingCartService = shoppingCartService;
        }
        [HttpPost]
        public async Task<IActionResult> SetShoppingCart(ShoppingCartInputDto input)
        {

            var result = await _shoppingCartService.SetShoppingCart(input);
            return Ok(result);
        }
    }
}