using Application.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Core.Interfaces
{
    public interface IOfferService
    {
        OfferModel GetOfferByUserIdAndAdId(int userId, int adId);
        IEnumerable<OfferModel> GetAllOffers();
        OfferModel GetOfferById(int id);
        void AddOffer(OfferModel offer);
    }
}
