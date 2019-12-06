using Classified.Models;
using System.Collections.Generic;

namespace Classified.Interfaces
{
    public interface IAdViewModelService
    {
        IEnumerable<AdViewModel> GetAllAds();
        AdInfoViewModel GetAdById(int id);
    }
}