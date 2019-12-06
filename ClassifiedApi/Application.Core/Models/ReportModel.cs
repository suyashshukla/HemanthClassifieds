using System;

namespace Application.Core.Models
{
    public class ReportModel
    {
        public int Id { get; set; }
        public string Message { get; set; }
        public int AdId { get; set; }
        public int UserId { get; set; }
        public DateTime MadeOn { get; set; }
        
    }
}
