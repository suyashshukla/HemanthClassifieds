using AppConnection;
using Application.Core.Models;
using AutoMapper;
using Classified.Models;

namespace Classified
{
    public class ViewModelProfile : Profile
    {
        public ViewModelProfile()
        {
                
               
            CreateMap<AdViewDbModel, AdViewModel>().ReverseMap();
            CreateMap<AdInfoModel, AdInfoViewModel>().ReverseMap();


        }
    }
}