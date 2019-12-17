using Application.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Core.Interfaces
{
    public interface IReportService
    {
        IEnumerable<ReportModel> GetAllReports();
        ReportModel GetReportById(int id);
        void AddReport(ReportModel report);
        ReportModel GetReportByUserIdAndAdId(int userId, int adId);
        void UpdateReport(int id, ReportModel report);
    }
}
