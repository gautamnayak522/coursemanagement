using CourseManagement.Interfaces;
using CourseManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CourseManagement.Services
{
    public class ProductService : Repository<Product>,IProduct
    {
        public CourseManagementContext DBContext;
        public ProductService(CourseManagementContext courseManagementContext):base(courseManagementContext)
        {
            DBContext = courseManagementContext;
        }

        public dynamic GetDataWithPagination(int pageNo, int pageSize,string searchstring, string sortcolumnname, bool sortorder)
        {
            if (searchstring == null)
            {
                searchstring = "";
            }
           
            var searcheddata = DBContext.Products
                .Where(p =>
                p.ProductName.Contains(searchstring) ||
                (p.Price.ToString()).Contains(searchstring) ||
                (p.Quantity.ToString()).Contains(searchstring) ||
                p.Sku.Contains(searchstring) ||
                p.Supplier.Contains(searchstring)
              );

            switch(sortcolumnname)
            {
                case "productName" :
                    {
                        if (sortorder)
                        {
                            searcheddata = searcheddata.OrderBy(p => p.ProductName);
                        }
                        else
                        {
                            searcheddata = searcheddata.OrderByDescending(p => p.ProductName);
                        }
                        break;
                    }
                case "Price":
                    {
                        if (sortorder)
                        {
                            searcheddata = searcheddata.OrderBy(p => p.Price);
                        }
                        else
                        {
                            searcheddata = searcheddata.OrderByDescending(p => p.Price);
                        }
                        break;
                    }
                case "mafDate":
                    {
                        if (sortorder)
                        {
                            searcheddata = searcheddata.OrderBy(p => p.MafDate);
                        }
                        else
                        {
                            searcheddata = searcheddata.OrderByDescending(p => p.MafDate);
                        }
                        break;
                    }
                case "mafAt":
                    {
                        if (sortorder)
                        {
                            searcheddata = searcheddata.OrderBy(p => p.MafAt);
                        }
                        else
                        {
                            searcheddata = searcheddata.OrderByDescending(p => p.MafAt);
                        }
                        break;
                    }
                case "sku":
                    {
                        if (sortorder)
                        {
                            searcheddata = searcheddata.OrderBy(p => p.Sku);
                        }
                        else
                        {
                            searcheddata = searcheddata.OrderByDescending(p => p.Sku);
                        }
                        break;
                    }
                case "quantity":
                    {
                        if (sortorder)
                        {
                            searcheddata = searcheddata.OrderBy(p => p.Quantity);
                        }
                        else
                        {
                            searcheddata = searcheddata.OrderByDescending(p => p.Quantity);
                        }
                        break;
                    }
                case "supplier":
                    {
                        if (sortorder)
                        {
                            searcheddata = searcheddata.OrderBy(p => p.Supplier);
                        }
                        else
                        {
                            searcheddata = searcheddata.OrderByDescending(p => p.Supplier);
                        }
                        break;
                    }
                default:
                    {
                        if (sortorder)
                        {
                            searcheddata = searcheddata.OrderBy(p => p.ProductId);
                        }
                        else
                        {
                            searcheddata = searcheddata.OrderByDescending(p => p.ProductId);
                        }

                        break;
                    }
            }


            var totalRecords = searcheddata.Count();

            var totalPages = ((double)totalRecords / (double)pageSize);

            int roundedTotalPages = Convert.ToInt32(Math.Ceiling(totalPages));

            var pagedData = searcheddata
                .Skip((pageNo - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            return new { pageNo= pageNo, pageSize = pageSize, totalRecords = totalRecords,totalPages = roundedTotalPages, Data = pagedData };

        }
    }
}
