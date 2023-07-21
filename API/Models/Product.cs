using System;
using System.Collections.Generic;

#nullable disable

namespace CourseManagement.Models
{
    public partial class Product
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int? Price { get; set; }
        public DateTime? MafDate { get; set; }
        public string MafAt { get; set; }
        public string Sku { get; set; }
        public string CategoryName { get; set; }
        public string SubCategoryName { get; set; }
        public string Description { get; set; }
        public int? Quantity { get; set; }
        public string Supplier { get; set; }
    }
}
