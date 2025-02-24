using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using AutoMapper;

using Dating.Domain;
using Dating.Service.ProductApp.Dto;
using Dating.Service.ShoppingCartApp.Dto;

namespace Dating.Service
{
    public class DatingPlatformProfile : Profile
    {
        public DatingPlatformProfile()
        {
            CreateMap<Product, ProductDto>().ReverseMap();
            CreateMap<ProductSale, ProductDto>().ForMember(dest => dest.Id, opt => opt.Ignore()).ReverseMap();
            CreateMap<ProductPhoto, ProductDto>().ForMember(dest => dest.Id, opt => opt.Ignore()).ReverseMap();
            CreateMap<ProductSaleAreaDiff, ProductDto>().ForMember(dest => dest.Id, opt => opt.Ignore()).ReverseMap();
            CreateMap<ShoppingCart, ShoppingCartInputDto>().ReverseMap();
            CreateMap<ShoppingCart, ShoppingCartDto>().ReverseMap();

        }
    }
}