using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Dating.Domain;

namespace Dating.Service.ProductApp;

public partial class ProductService
{
    public async Task<List<ProductPhoto>> GetProductPhotosByProductNos(params string[] productNos)
    {
        return await _productPhotoRepo.GetListAsync(t => productNos.Contains(t.ProductNo));
    }
}
