using AppConnection;
using Application.Core.Interfaces;
using Application.Core.Models;
using PetaPoco;
using System;
using System.Collections.Generic;


namespace Application.Infrastructure.Services
{
    public class OfferRepository : IOfferRepository
    {
        private readonly AutoMapper.IMapper _mapper;
        private readonly IDatabase _db;


        public OfferRepository(AutoMapper.IMapper mapper, IDatabase db)
        {
            _mapper = mapper;
            _db = db;
        }
        public void AddNewOffer(OfferModel offer)
        {
            var Offer = _mapper.Map<OfferModel, Offer>(offer);
            
            _db.Insert(Offer);
            var id = Offer.AdId;
            //var offer_count = db.Query<AdDetail>("select AdId, Offer_Count from AdDetails where AdDetails.AdId = Offer.AdId");
            var count = _db.SingleOrDefault<Ad>("Select * from Ad where Id = @0", id);
            count.OfferCount = count.OfferCount + 1;
            
            _db.Update(count);
 
        }


        public void DeleteOfferbyId(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<OfferModel> GetAllOffersMade()
        {
            
            var offers = _db.Query<Offer>("select * from OfferDetailView");
            return _mapper.Map<IEnumerable<Offer>,IEnumerable<OfferModel>>(offers);

        }

        public OfferModel GetOfferByUserIdAndAdId(int userId, int adId)
        {
           var offer = _db.SingleOrDefault<Offer>("select * from offer where adId=@0 and userId=@1", adId,userId);
            return _mapper.Map<Offer, OfferModel>(offer);
        }

        public OfferModel GetSpecificOfferById(int id)
        {
            
            var offerId = _db.SingleOrDefault<Offer>("select * from offer where id=@0", id);
            return _mapper.Map<Offer, OfferModel>(offerId);
        }

        public void UpdateOffer(int id,OfferModel offer)
        {
            var _offer = _mapper.Map<OfferModel, Offer>(offer);
            _db.Update(_offer);
        }
    }
}
