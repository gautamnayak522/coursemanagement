using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CourseManagement.Interfaces
{
    public interface ITask
    {
        public dynamic Gettodo();

        public dynamic Getdone();

        public dynamic SetDoneList(List<string> donetasks);

        public dynamic addnewTask(Models.Task t);


    }
}
