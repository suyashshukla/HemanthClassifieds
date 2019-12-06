using AppConnection;
using Application.Core.Interfaces;
using Application.Core.Models;
using PetaPoco;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Infrastructure.Services
{
    public class AdRepository : IAdRepository
    {
        private readonly AutoMapper.IMapper _mapper;
        private readonly IDatabase _db;


        public AdRepository(AutoMapper.IMapper mapper, IDatabase db)
        {
            _mapper = mapper;
            _db = db;
        }
        public void AddNewAd(AdInfoModel ad)
        {
            throw new NotImplementedException();
        }

        public void DeleteAdybyId(int id)
        {
            throw new NotImplementedException();
        }

        public void EditAdbyId(AdInfoModel ad)
        {
            throw new NotImplementedException();
        }

        public AdInfoModel GetAd(int id)
        {
            var ad = _db.SingleOrDefault<AdInfoView>("Select * from AdInfoView where Id = @0", id);
            return _mapper.Map<AdInfoView, AdInfoModel>(ad);

        }

        public IEnumerable<AdViewDbModel> GetAds()
        {
            var ads = _db.Query<AdView>("Select * from AdView");
            return _mapper.Map<IEnumerable<AdView>, IEnumerable<AdViewDbModel>>(ads);
        }

    }
}
