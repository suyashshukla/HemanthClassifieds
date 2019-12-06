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
    public class OfferController : ApiController
    {
        private readonly IOfferService _offerService;
       
        public OfferController(IOfferService offerService)
        {
            _offerService = offerService;
           
        }
        // GET: api/Offer
        [HttpGet]
        public IEnumerable<string> GetAllOffers()
        {
             return new string[] { "value1", "value2" }; ;
        }

        // GET: api/offer/5
        [HttpGet]
        public string GetOffer(int id)
        {
            //return CoreCategoryService.GetCategoryById(id);
            return "nothing";
        }

        // POST: api/offer
        [HttpPost]
        public void AddOffer([FromBody]OfferModel offer)
        {

            
            _offerService.AddOffer(offer);

        }

        // PUT: api/offer/5
        [HttpPut]
        public void UpdateOffer(int id, [FromBody]OfferModel value)
        {
            //CoreCategoryService.EditCategory(value);
        }

        [HttpDelete]
        // DELETE: api/offer/5
        public void DeleteOffer(int id)
        {
            //CoreCategoryService.DeleteCategory(id);

        }
    }
}
