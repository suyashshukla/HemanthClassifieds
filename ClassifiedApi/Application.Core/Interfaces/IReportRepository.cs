using Application.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Core.Interfaces
{
    public interface IReportRepository
    {


        void AddNewReport(ReportModel offer);
        IEnumerable<ReportModel> GetAllReportsMade();
        ReportModel GetSpecificReportById(int id);
        void UpdateReport();
        void DeleteReportbyId(int id);

    }
}
