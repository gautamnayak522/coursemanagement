using CourseManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CourseManagement.Interfaces
{
    public interface IProduct : IRepository<Product>
    {
        public dynamic GetDataWithPagination(int pageNo, int pageSize,string searchstring, string sortcolumnname, bool sortorder);
    }
}
