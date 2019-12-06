using System;

namespace Application.Core.Models
{
    public class OfferModel
    {
        public int Id { get; set; }
        public int AdId { get; set; }
        public int UserId { get; set; }
        public float Price { get; set; }
        public string Message { get; set; }
        public DateTime MadeOn { get; set; }
    }
}
