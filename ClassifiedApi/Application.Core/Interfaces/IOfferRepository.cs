using Application.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Core.Interfaces
{
    public interface IOfferRepository
    {

        OfferModel GetOfferByUserIdAndAdId(int userId, int adId);
       void AddNewOffer(OfferModel offer);
        IEnumerable<OfferModel> GetAllOffersMade();
        OfferModel GetSpecificOfferById(int id);
        void UpdateOffer();
        void DeleteOfferbyId(int id);

    }
}
