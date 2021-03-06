﻿using Application.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Application.Core.Interfaces
{
    public interface IAdRepository
    {
        IEnumerable<AdViewDbModel> GetAds();
        AdInfoModel GetAd(int id);
        void AddNewAd(AdModel ad);
        void EditAdbyId(AdModel ad);
        void DeleteAdybyId(int id);
    }
}
