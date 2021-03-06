﻿using Application.Core.Interfaces;
using Application.Core.Models;
using Classified.Interfaces;
using Classified.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Classified.Services
{

    public class AdViewModelService : IAdViewModelService
    {
        private readonly IAdRepository _adRepository;
        private readonly IAdService _adService;
        private readonly AutoMapper.IMapper _mapper;
        public AdViewModelService(IAdService adService, IAdRepository adRepository, AutoMapper.IMapper mapper)
        {
            _adService = adService;
            _adRepository = adRepository;
            _mapper = mapper;
        }


        public IEnumerable<AdViewModel> GetAllAds()
        {
            var ads = _adService.GetAllAds();
            return _mapper.Map<IEnumerable<AdViewDbModel>, IEnumerable<AdViewModel>>(ads);
        }
        public AdInfoViewModel GetAdById(int id)
        {
            var ad = _adRepository.GetAd(id);
            return _mapper.Map<AdInfoModel, AdInfoViewModel>(ad);
        }
    }
}