using CourseManagement.Interfaces;
using CourseManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using System.Text.RegularExpressions;

namespace CourseManagement.Services
{
    public class TaskService : ITask
    {
        public CourseManagementContext DBContext { get; set; }
        public TaskService(CourseManagementContext courseManagementContext)
        {
            DBContext = courseManagementContext;
        }

        public dynamic Gettodo()
        {
            return DBContext.Tasks.Where(t => !(bool)t.IsDone).OrderBy(t=>t.CreatedDate).Select(t => t.TaskTitle);
        }
        public dynamic Getdone()
        {
            return DBContext.Tasks.Where(t => (bool)t.IsDone).OrderBy(t=>t.DoneDate).Select(t => t.TaskTitle);
        }

        public dynamic SetDoneList(List<string> donetasks)
        {
            //var mydata = Convert.ToString(donetasks);

            //mydata.Replace("[", string.Empty);
            //mydata.Replace("]", string.Empty);

            string combinedString = string.Join(",", donetasks);

            //if (mydata.Length > 2)
            //{
            //    mydata = mydata.Substring(1, mydata.Length - 2);
            //}

            //DBContext.Tasks.Update()

            //(from p in DBContext.Tasks
            // where p.TaskTitle.Contains(mydata)
            // select p).ToList()
            //     .ForEach(x => x.IsDone = true);


            int counts = DBContext.Database.ExecuteSqlRaw("UPDATE Tasks set isDone=1, doneDate=GetDate() where taskTitle IN (SELECT VALUE FROM STRING_SPLIT({0},',')) AND isDone=0", combinedString);

            int counts2 = DBContext.Database.ExecuteSqlRaw("UPDATE Tasks set isDone=0, doneDate=null where taskTitle NOT IN (SELECT VALUE FROM STRING_SPLIT({0},',')) AND isDone=1", combinedString);

            DBContext.SaveChanges();

            return counts;
        }

        public dynamic addnewTask(Models.Task t)
        {
            DBContext.Add(t);
            DBContext.SaveChanges();
            return t;
        }

       
    }
}
