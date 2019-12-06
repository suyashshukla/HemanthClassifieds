using Application.Core.Models;

using System.Collections.Generic;


namespace Application.Core.Interfaces
{
    public interface IAdService
    {
        
        void AddAd(AdModel adItem);
        void DeleteAd(int id);
        void UpdateAd(int id, AdModel AdItem);
    }
}
