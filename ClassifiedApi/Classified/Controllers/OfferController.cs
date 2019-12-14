using Application.Core.Interfaces;
using Application.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Classified.Controllers
{
    [RoutePrefix("api/offer")]
    public class OfferController : ApiController
    {
        private readonly IOfferService _offerService;

        public OfferController(IOfferService offerService)
        {
            _offerService = offerService;

        }
        // GET: api/Offer
        [Route("")]
        [HttpGet]
        public IEnumerable<string> GetAllOffers()
        {
            return new string[] { "value1", "value2" }; ;
        }

        // GET: api/offer/5
        [Route("{id:int}")]
        [HttpGet]
        public string GetOffer(int id)
        {
            //return CoreCategoryService.GetCategoryById(id);
            return "nothing";
        }
        [Route("")]
        [HttpGet]
        public OfferModel GetOffferByUserIdAndAdId([FromUri] int userId, [FromUri] int adId)
        {
            return _offerService.GetOfferByUserIdAndAdId(userId, adId);
        }
        // POST: api/offer
        [Route("")]
        [HttpPost]
        public void AddOffer([FromBody]OfferModel offer)
        {

            
            _offerService.AddOffer(offer);

        }


        // PUT: api/offer/5
        [Route("{id:int}")]
        [HttpPut]
        public void UpdateOffer(int id, [FromBody]OfferModel value)
        {
            //CoreCategoryService.EditCategory(value);
        }

        [Route("{id:int}")]
        [HttpDelete]
        // DELETE: api/offer/5
        public void DeleteOffer(int id)
        {
            //CoreCategoryService.DeleteCategory(id);

        }
    }
}
