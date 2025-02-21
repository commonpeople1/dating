using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Dating.Core.Global;
using Dating.Service.ProductApp;

using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Dating.Web.Controllers
{
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ApiController]
    [Route("api/[controller]")]
    public class ProductController : ControllerBase
    {
        private readonly IProductService _productService;
        public ProductController(IProductService productService)
        {
            _productService = productService;
        }
        [HttpPost]
        public async Task<IActionResult> GetProductDto(PageWithSort pageWithSort)
        {
            var products = await _productService.GetProductDto(pageWithSort);
            return Ok(products);
        }
    }
}