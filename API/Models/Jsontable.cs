using System;
using System.Collections.Generic;

#nullable disable

namespace CourseManagement.Models
{
    public partial class Jsontable
    {
        public int? Id { get; set; }
        public string Name { get; set; }
        public int? ParentId { get; set; }
        public string PositionName { get; set; }
        public string ImageUrl { get; set; }
    }
}
