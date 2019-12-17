using Application.Core.Interfaces;
using Application.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Core.Services
{
    public class OfferService : IOfferService
    {
        private IOfferRepository _offer;

        public OfferService(IOfferRepository offer)
        {
            _offer = offer;
        }

        public void AddOffer(OfferModel offer)
        {
            _offer.AddNewOffer(offer);

        }
        public OfferModel GetOfferByUserIdAndAdId(int userId,int adId)
        {
           return _offer.GetOfferByUserIdAndAdId(userId, adId);
        }
        public IEnumerable<OfferModel> GetAllOffers()
        {
            return _offer.GetAllOffersMade();
        }

        public OfferModel GetOfferById(int id)
        {
            return _offer.GetSpecificOfferById(id);
        }
        public void UpdateOffer(int id,OfferModel offer)
        {
            _offer.UpdateOffer(id,offer);
        }
    }
}
