using AppConnection;
using Application.Core.Interfaces;
using Application.Core.Models;
using PetaPoco;
using System.Collections.Generic;

namespace Application.Infrastructure.Services
{
    public class ReportRepository : IReportRepository
    {
        private readonly AutoMapper.IMapper _mapper;
        private readonly IDatabase _db;


        public ReportRepository(AutoMapper.IMapper mapper, IDatabase db)
        {
            _mapper = mapper;
            _db = db;
        }
        public void AddNewReport(ReportModel report)
        {
            var newReport = _mapper.Map<ReportModel, ReportedAd>(report);
            _db.Insert(newReport);
        }

        public void DeleteReportbyId(int id)
        {
            throw new System.NotImplementedException();
        }

        public IEnumerable<ReportModel> GetAllReportsMade()
        {
            var reports = _db.Query<ReportedAd>("Select * from ReportAd");
            return _mapper.Map<IEnumerable<ReportedAd>, IEnumerable<ReportModel>>(reports);
        }

        public ReportModel GetSpecificReportById(int id)
        {
            var ReportId = _db.SingleOrDefault<ReportedAd>("select * from ReportAd where id=@0", id);
            return _mapper.Map<ReportedAd, ReportModel>(ReportId);
        }
        public ReportModel GetReportByUserIdAndAdId(int userId, int adId)
        {
            var report = _db.SingleOrDefault<ReportedAd>("select * from reportedad where adId=@0 and userId=@1", adId, userId);
            return _mapper.Map<ReportedAd, ReportModel>(report);
        }

        public void UpdateReport(int id, ReportModel report)
        {
            var _report = _mapper.Map<ReportModel, ReportedAd>(report);
            _db.Update(_report);
        }
    }
}
