using Application.Core.Models;
using Classified.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Classified.Models
{
    public class AdViewModel
    {
        public int Id { get; set; }
        public string Type { get; set; }
        public string Status { get; set; }
        public DateTime PostedOn { get; set; }
        public bool ContactFlag { get; set; }
        public decimal Price { get; set; }
        public DateTime ExpiryDate { get; set; }
        public string CategoryIconUri { get; set; }
        public string CategoryName { get; set; }
        public string UserName { get; set; }
        public string UserIconUri { get; set; }
        public int OfferCount { get; set; }
        public int CommentCount { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Location { get; set; }
        public List<ImageModel> ImageUrls { get; set; }
    }
}