using CourseManagement.Interfaces;
using CourseManagement.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CourseManagement.Services
{
    public class CourseService : Repository<Course>, ICourse
    {
        public CourseManagementContext DBContext { get; set; }
        public CourseService(CourseManagementContext courseManagementContext) : base(courseManagementContext)
        {
            DBContext = courseManagementContext;
        }

        public dynamic GetCourseMaster()
        {
            var data = DBContext.Courses.Select(x => new
            {
                x.CourseId,
                x.CourseName,
                x.DeptId,
                x.Dept.DeptName,
                x.TimeDuration,
                x.Description,
                x.AuthorId,
                x.Author.AuthorName
            });

            return data;
        }
    }
}
