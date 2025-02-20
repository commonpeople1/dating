using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Dating.Domain;

namespace Dating.Service.ProductApp
{
    public partial class ProductService
    {
        public async Task<List<ProductSale>> GetProductSalesByProductNos(params string[] productNos)
        {
            return await _productSaleRepo.GetListAsync(t => productNos.Contains(t.ProductNo));
        }
    }
}