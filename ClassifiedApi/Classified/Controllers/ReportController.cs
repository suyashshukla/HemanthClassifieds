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
    public class ReportController : ApiController
    {
        private readonly IReportService _reportService;

        public ReportController(IReportService reportService)
        {
            _reportService = reportService;

        }
        // GET: api/Report
        [HttpGet]
        public IEnumerable<string> GetAllReports()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/report/5
        [HttpGet]
        public string GetReport(int id)
        {
            //return CoreCategoryService.GetCategoryById(id);
            return "nothing";
        }

        [HttpGet]
        public ReportModel GetOffferByUserIdAndAdId([FromUri] int userId, [FromUri] int adId)
        {
            return _reportService.GetReportByUserIdAndAdId(userId, adId);
        }
        // POST: api/report
        [HttpPost]
        public void AddReport([FromBody]ReportModel report)
        {


            _reportService.AddReport(report);

        }

        // PUT: api/report/5
        [HttpPut]
        public void UpdateReport(int id, [FromBody]ReportModel report)
        {
            _reportService.UpdateReport(id, report);
        }

        [HttpDelete]
        // DELETE: api/report/5
        public void DeleteReport(int id)
        {
            //CoreCategoryService.DeleteCategory(id);

        }
    }
}
