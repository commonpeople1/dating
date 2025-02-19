using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Dating.Core.Repository;
using Dating.Domain;
using Dating.Service.ProductApp.Dto;

namespace Dating.Service.ProductApp
{
    public class ProductService : IProductService
    {
        public ProductService(IRepository<Product> productRepo,
        IRepository<ProductSale> productSaleRepo,
        IRepository<ProductPhoto> productPhotoRepo,
        IRepository<ProductSaleAreaDiff> productSaleAreaDiffRepo)
        {
            _productRepo = productRepo;
            _productSaleRepo = productSaleRepo;
            _productPhotoRepo = productPhotoRepo;
            _productSaleAreaDiffRepo = productSaleAreaDiffRepo;
        }
        private readonly IRepository<Product> _productRepo;
        private readonly IRepository<ProductSale> _productSaleRepo;
        private readonly IRepository<ProductPhoto> _productPhotoRepo;
        private readonly IRepository<ProductSaleAreaDiff> _productSaleAreaDiffRepo;
        // public ProductDto GetProductDto(){

        // }
    }
}