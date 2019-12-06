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

        public void AddOffer(OfferModel offers)
        {
            _offer.AddNewOffer(offers);

        }

        public IEnumerable<OfferModel> GetAllOffers()
        {
            return _offer.GetAllOffersMade();
        }

        public OfferModel GetOfferById(int id)
        {
            return _offer.GetSpecificOfferById(id);
        }
    }
}
