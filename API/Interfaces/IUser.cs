using CourseManagement.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CourseManagement.Interfaces
{
    public interface IUser:IRepository<User>
    {
        public Permission GetModulePermissions(int userID,int moduleID);

        public List<Permission> GetPermissionsMaster(int userID);
        public dynamic GetUserAccessModules(int userID);
        public dynamic GetUsers();
        public int GetCurretBalance(int userID);

        //public dynamic setCurretBalance(int userID, int balance);
    }
}
