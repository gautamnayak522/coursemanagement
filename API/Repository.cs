using CourseManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CourseManagement
{

    public interface IRepository<TEntity> where TEntity : class
    {
        List<TEntity> Get();
        TEntity Get(int id);
        TEntity Post(TEntity te);
        TEntity Delete(TEntity te);
        TEntity Put(TEntity te, TEntity newentity);
    }

    public class Repository<T> : IRepository<T> where T : class
    {

        public CourseManagementContext DBContext { get; set; }
        public Repository(CourseManagementContext courseManagementContext)
        {
            DBContext = courseManagementContext;
        }

        public List<T> Get()
        {
            return DBContext.Set<T>().ToList();
        }

        public T Get(int id)
        {
            T te = DBContext.Set<T>().Find(id);
            return te;
        }

        public T Post(T te)
        {
            DBContext.Add(te);
            DBContext.SaveChanges();
            return te;
        }

        public T Delete(T te)
        {
            DBContext.Remove(te);
            DBContext.SaveChanges();
            return te;
        }

        public T Put(T te, T newentity)
        {
            var newdata = CheckUpdateObject(te, newentity);
            DBContext.Entry(te).CurrentValues.SetValues(newdata);
            DBContext.SaveChanges();
            return newentity;
        }


        public static object CheckUpdateObject(object originalObj, object updateObj)
        {
            foreach (var property in updateObj.GetType().GetProperties())
            {
                if (property.GetValue(updateObj, null) == null)
                {
                    property.SetValue(updateObj, originalObj.GetType().GetProperty(property.Name)
                    .GetValue(originalObj, null));
                }
            }
            return updateObj;
        }

    }
}
