using Application.Core.Models;

using System.Collections.Generic;


namespace Application.Core.Interfaces
{
    public interface IAdService
    {
        IEnumerable<AdViewDbModel> GetAllAds();
        void AddAd(AdModel adItem);
        void DeleteAd(int id);
        void UpdateAd(int id, AdModel AdItem);
    }
}
