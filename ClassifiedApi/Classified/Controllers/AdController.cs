using Application.Core.Interfaces;
using Application.Core.Models;
using Classified.Interfaces;
using Classified.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Classified.Controllers
{
    public class AdController : ApiController
    {
        private readonly IAdService _coreAdService;
        private readonly IAdViewModelService _viewAdService;
        public AdController(IAdService coreAdService, IAdViewModelService viewAdService)
        {
            _coreAdService = coreAdService;
            _viewAdService = viewAdService;
        }
        // GET: api/Ad
        [HttpGet]
        public IEnumerable<AdViewModel> GetAllAds()
        {
            return _viewAdService.GetAllAds();
        }

        // GET: api/ad/5
        [HttpGet]
        public AdInfoViewModel GetAd(int id)
        {
            return _viewAdService.GetAdById(id);
        }

        // POST: api/ad
        [HttpPost]
        public void AddAd([FromBody]AdModel ad)
        {

            _coreAdService.AddAd(ad);

        }

        // PUT: api/ad/5
        [HttpPut]
        public void UpdateAd(int id, [FromBody]AdInfoModel value)
        {
            //CoreCategoryService.EditCategory(value);
        }

        [HttpDelete]
        // DELETE: api/ad/5
        public void DeleteCategory(int id)
        {
            //CoreCategoryService.DeleteCategory(id);

        }
    }
}
