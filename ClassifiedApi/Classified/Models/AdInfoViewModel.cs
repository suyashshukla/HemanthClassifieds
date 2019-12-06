using Application.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Classified.Models
{
    public class AdInfoViewModel
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int CategoryId { get; set; }
        public string Type { get; set; }
        public string Status { get; set; }
        public DateTime PostedOn { get; set; }
        public bool ContactFlag { get; set; }
        public float Price { get; set; }
        public List<ImageModel> ImageUrls { get; set; }
        public List<AdFieldValue> FieldValues { get; set; }
        public DateTime ExpiryDate { get; set; }
        public string CategoryIconUri { get; set; }
        public string CategoryName { get; set; }
        public string RemovedReason { get; set; }
        public int RemovedBy { get; set; }
        public DateTime RemovedOn { get; set; }
        public int OfferCount { get; set; }
        public int CommentCount { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }

    }
}