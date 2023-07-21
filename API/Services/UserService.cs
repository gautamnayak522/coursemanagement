using CourseManagement.Interfaces;
using CourseManagement.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CourseManagement.Services
{
    public class UserService : Repository<User>, IUser
    {
        public CourseManagementContext DBContext { get; set; }
        public UserService(CourseManagementContext courseManagementContext) : base(courseManagementContext)
        {
            DBContext = courseManagementContext;
        }


        public Permission GetModulePermissions(int userID, int moduleID)
        {
            return DBContext.Permissions.FirstOrDefault(x => x.UserId == userID && x.ModuleId == moduleID);
        }

        public List<Permission> GetPermissionsMaster(int userID)
        {
            return DBContext.Permissions.Include(x => x.Module).Where(x => x.UserId == userID).ToList();

        }

        public dynamic GetUserAccessModules(int userID)
        {
            return DBContext.Permissions
                .Include(x => x.Module)
                    .ThenInclude(x => x.InverseParentModule)
                    .ThenInclude(x => x.Permissions)
                        .Where(x => x.CalView == true && x.UserId == userID && x.Module.ParentModuleId == null && x.Module.IsActive == true)
                        .Select(y => new
                        {
                            moduleID = y.Module.ModuleId,
                            moduleName = y.Module.ModuleName,
                            subModules = y.Module.InverseParentModule
                            .Select(i => new
                            {
                                moduleID = i.ModuleId,
                                moduleName = i.ModuleName,
                                accessible = i.Permissions.Where(i => i.CalView == true && i.UserId == userID).Count() > 0 ? true : false,
                                //permissions = i.Permissions.Where(i => i.CalView == true && i.UserId == userID).Select(i => new
                                //{
                                //    calView = i.CalView
                                //})
                            })
                        });
                }

        public dynamic GetUsers()
        {
            return DBContext.Users.Select(x => new
            {
                userID = x.UserId,
                userName = x.UserName
            });
        }


        public int GetCurretBalance(int userID)
        {
            return DBContext.Users.Where(u => u.UserId == userID).Select(x => x.Balance).FirstOrDefault();
        }

        //public dynamic setCurretBalance(int userID, int balance)
        //{
        //    User u1 = DBContext.Users.Find(userID);
        //    if(user)
        //    return "";
        //}
    }
}
