using Application.Core.Interfaces;
using Application.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Core.Services
{
    public class ReportService : IReportService
    {
        private IReportRepository _report;
        public ReportService(IReportRepository report)
        {
            _report = report;
        }
        public void AddReport(ReportModel report)
        {
            _report.AddNewReport(report);

        }

        public IEnumerable<ReportModel> GetAllReports()
        {
            return _report.GetAllReportsMade();
        }

        public ReportModel GetReportById(int id)
        {
            return _report.GetSpecificReportById(id);
        }
    }
}
