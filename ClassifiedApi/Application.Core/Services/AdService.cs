using Application.Core.Interfaces;
using Application.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Core.Services
{
    public class AdService : IAdService
    {
        private readonly IAdRepository _adRepositoryService;
        public AdService(IAdRepository adRepositoryService)
        {
            _adRepositoryService = adRepositoryService;
        }
        public IEnumerable<AdViewDbModel> GetAllAds()
        {
            return _adRepositoryService.GetAds().Where(s => s.Status ==1);
        }
        public void AddAd(AdModel adItem)
        {
            _adRepositoryService.AddNewAd(adItem);
        }

        public void DeleteAd(int id)
        {
            throw new NotImplementedException();
        }



        public void UpdateAd(int id, AdModel AdItem)
        {
            throw new NotImplementedException();
        }
    }
}
