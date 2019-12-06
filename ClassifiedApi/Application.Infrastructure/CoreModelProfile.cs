using AppConnection;
using Application.Core.Models;
using AutoMapper;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace Classified
{
    public class CoreModelProfile:Profile
    {
        public CoreModelProfile()
        {

            /*CreateMap<Category, CategoryModel>()
                     .ForMember(dest => dest.CategoryName, opt => opt.MapFrom(src => src.name))
                     .ReverseMap();*/
            CreateMap<AdView, AdViewDbModel>()
                        .ForMember(dest => dest.ImageUrls, opt => opt.MapFrom(src => JsonConvert.DeserializeObject<List<ImageModel>>(src.ImageUrls)));
            CreateMap<AdInfoView, AdInfoModel>()
                        .ForMember(dest => dest.ImageUrls, opt => opt.MapFrom(src => JsonConvert.DeserializeObject<List<ImageModel>>(src.ImageUrls)))
                        .ForMember(dest => dest.FieldValues, opt => opt.MapFrom(src => JsonConvert.DeserializeObject<List<AdFieldValue>>(src.FieldValues)));
            CreateMap<Offer, OfferModel>().ReverseMap();
            CreateMap<Person, PersonModel>().ReverseMap();
            CreateMap<ReportedAd, ReportModel>().ReverseMap();
        }

    }
}