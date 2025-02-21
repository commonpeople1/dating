using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

using AutoMapper;

using Dating.Core.Global;
using Dating.Core.Repository;
using Dating.Domain;
using Dating.Service.ProductApp.Dto;

namespace Dating.Service.ProductApp
{
    public partial class ProductService : IProductService
    {
        public ProductService(IRepository<Product> productRepo,
        IRepository<ProductSale> productSaleRepo,
        IRepository<ProductPhoto> productPhotoRepo,
        IRepository<ProductSaleAreaDiff> productSaleAreaDiffRepo, IMapper mapper)
        {
            _productRepo = productRepo;
            _productSaleRepo = productSaleRepo;
            _productPhotoRepo = productPhotoRepo;
            _productSaleAreaDiffRepo = productSaleAreaDiffRepo;
            _mapper = mapper;
        }
        private readonly IRepository<Product> _productRepo;
        private readonly IRepository<ProductSale> _productSaleRepo;
        private readonly IRepository<ProductPhoto> _productPhotoRepo;
        private readonly IRepository<ProductSaleAreaDiff> _productSaleAreaDiffRepo;
        private readonly IMapper _mapper;
        public async Task<IEnumerable<ProductDto>> GetProductDto(PageWithSort pageWithSort)
        {
            var products = await _productRepo.GetListAsync(pageWithSort);
            var dtos = _mapper.Map<List<ProductDto>>(products);
            var productPhotos = await GetProductPhotosByProductNos(products.Select(t => t.ProductNo).ToArray());
            var productSales = await GetProductSalesByProductNos(products.Select(t => t.ProductNo).ToArray());
            dtos.ForEach(dto =>
            {
                var photo = productPhotos.FirstOrDefault(t => t.ProductNo == dto.ProductNo);
                var sale = productSales.FirstOrDefault(t => t.ProductNo == dto.ProductNo);
                dto = _mapper.Map<ProductPhoto, ProductDto>(photo, dto);
                dto = _mapper.Map<ProductSale, ProductDto>(sale, dto);

            });
            return dtos;

        }
        public async Task<IEnumerable<TProjection>> GetProjectionList<TProjection>(Expression<Func<Product, TProjection>> projectionExpression)
        {
            var projections = await _productRepo.GetProjectionAsync(projectionExpression);
            return projections;
        }
    }
}