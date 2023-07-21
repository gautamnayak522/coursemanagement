using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace CourseManagement.Models
{
    public partial class CourseManagementContext : DbContext
    {
        public CourseManagementContext()
        {
        }

        public CourseManagementContext(DbContextOptions<CourseManagementContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Course> Courses { get; set; }
        public virtual DbSet<CourseEnrollment> CourseEnrollments { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Jsontable> Jsontables { get; set; }
        public virtual DbSet<Module> Modules { get; set; }
        public virtual DbSet<Permission> Permissions { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Rxemployee> Rxemployees { get; set; }
        public virtual DbSet<Task> Tasks { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<RxempDTO> RxempDTOs { get; set; }

        public virtual DbSet<Author> Authors { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {

            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Course>(entity =>
            {
                entity.Property(e => e.CourseId).HasColumnName("courseID");

                entity.Property(e => e.CourseName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("courseName");

                entity.Property(e => e.Description)
                    .HasMaxLength(65000)
                    .IsUnicode(false)
                    .HasColumnName("Description");

                entity.Property(e => e.DeptId).HasColumnName("deptID");

                entity.Property(e => e.AuthorId).HasColumnName("authorId");

                entity.Property(e => e.TimeDuration).HasColumnName("timeDuration");

                entity.HasOne(d => d.Dept)
                    .WithMany(p => p.Courses)
                    .HasForeignKey(d => d.DeptId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK_course_deptID");

                entity.HasOne(d => d.Author)
                    .WithMany(p => p.Courses)
                    .HasForeignKey(d => d.AuthorId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK__Courses__authorI__76619304");
            });

            modelBuilder.Entity<CourseEnrollment>(entity =>
            {
                entity.HasKey(e => e.EnrollId)
                    .HasName("PK__CourseEn__6B68B67BCF8048D2");

                entity.ToTable("CourseEnrollment");

                entity.Property(e => e.EnrollId).HasColumnName("enrollID");

                entity.Property(e => e.CourseId).HasColumnName("courseID");

                entity.Property(e => e.EmpId).HasColumnName("empID");

                entity.Property(e => e.EnrollDate)
                    .HasColumnType("date")
                    .HasColumnName("enrollDate")
                    .HasDefaultValueSql("(getdate())");

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.CourseEnrollments)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_enroll_courseID");

                entity.HasOne(d => d.Emp)
                    .WithMany(p => p.CourseEnrollments)
                    .HasForeignKey(d => d.EmpId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_enroll_empID");
            });

            modelBuilder.Entity<Department>(entity =>
            {
                entity.HasKey(e => e.DeptId)
                    .HasName("PK__Departme__BE2D26D600FCC70C");

                entity.Property(e => e.DeptId).HasColumnName("deptID");

                entity.Property(e => e.DeptName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("deptName");
            });

            modelBuilder.Entity<Author>(entity =>
            {
                entity.HasKey(e => e.AuthorId).HasName("PK__Authors__8E2731B9A2759A1E");

                entity.Property(e => e.AuthorName)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("authorName");

            });

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.HasKey(e => e.EmpId)
                    .HasName("PK__Employee__AFB3EC6D0734E55C");

                entity.Property(e => e.EmpId).HasColumnName("empID");

                entity.Property(e => e.DeptId).HasColumnName("deptID");

                entity.Property(e => e.EmailAddress)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("emailAddress");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("firstName");

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("lastName");

                entity.Property(e => e.MobileNo)
                    .HasColumnType("numeric(10, 0)")
                    .HasColumnName("mobileNo");

                entity.HasOne(d => d.Dept)
                    .WithMany(p => p.Employees)
                    .HasForeignKey(d => d.DeptId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK_emp_deptid");
            });

            modelBuilder.Entity<Jsontable>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("JSONTable");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.ImageUrl)
                    .HasMaxLength(50)
                    .HasColumnName("imageUrl");

                entity.Property(e => e.Name)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.ParentId).HasColumnName("parentId");

                entity.Property(e => e.PositionName)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("positionName");
            });

            modelBuilder.Entity<Module>(entity =>
            {
                entity.Property(e => e.ModuleId).HasColumnName("moduleID");

                entity.Property(e => e.IsActive).HasColumnName("isActive");

                entity.Property(e => e.ModuleName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("moduleName");

                entity.Property(e => e.ParentModuleId).HasColumnName("parentModuleID");

                entity.HasOne(d => d.ParentModule)
                    .WithMany(p => p.InverseParentModule)
                    .HasForeignKey(d => d.ParentModuleId)
                    .HasConstraintName("FK__Modules__parentM__3A4CA8FD");
            });

            modelBuilder.Entity<Permission>(entity =>
            {
                entity.Property(e => e.PermissionId).HasColumnName("permissionID");

                entity.Property(e => e.CalView).HasColumnName("calView");

                entity.Property(e => e.CanAdd).HasColumnName("canAdd");

                entity.Property(e => e.CanDelete).HasColumnName("canDelete");

                entity.Property(e => e.CanUpdate).HasColumnName("canUpdate");

                entity.Property(e => e.ModuleId).HasColumnName("moduleID");

                entity.Property(e => e.UserId).HasColumnName("userID");

                entity.HasOne(d => d.Module)
                    .WithMany(p => p.Permissions)
                    .HasForeignKey(d => d.ModuleId)
                    .HasConstraintName("FK_moduleID_Permission_Modules");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Permissions)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_userID_Users");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.Property(e => e.CategoryName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Description)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.MafAt)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.MafDate)
                    .HasColumnType("date")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.ProductName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Sku)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("SKU");

                entity.Property(e => e.SubCategoryName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Supplier)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.Property(e => e.RoleId).HasColumnName("roleID");

                entity.Property(e => e.RollName)
                    .HasMaxLength(25)
                    .IsUnicode(false)
                    .HasColumnName("rollName");
            });

            modelBuilder.Entity<Rxemployee>(entity =>
            {
                entity.HasKey(e => e.EmpId)
                    .HasName("PK_employees_empID");

                entity.ToTable("rxemployees");

                entity.Property(e => e.EmpId)
                    .ValueGeneratedNever()
                    .HasColumnName("empID");

                entity.Property(e => e.EmployeeName)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.OfficialEmail)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.OperationUnit)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("Operation_Unit");

                entity.Property(e => e.ParentempId).HasColumnName("parentempID");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .IsUnicode(false)
                    .HasColumnName("password");

                entity.HasOne(d => d.Parentemp)
                    .WithMany(p => p.InverseParentemp)
                    .HasForeignKey(d => d.ParentempId)
                    .HasConstraintName("FK_parentempID_empID");
            });

            modelBuilder.Entity<Task>(entity =>
            {
                entity.Property(e => e.TaskId).HasColumnName("taskId");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("date")
                    .HasColumnName("createdDate")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DoneDate)
                    .HasColumnType("date")
                    .HasColumnName("doneDate");

                entity.Property(e => e.IsDone).HasColumnName("isDone");

                entity.Property(e => e.TaskTitle)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("taskTitle");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.UserId).HasColumnName("userID");

                entity.Property(e => e.EmailAddress)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("emailAddress");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("password");

                entity.Property(e => e.RoleId).HasColumnName("roleID");

                entity.Property(e => e.UserName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("userName");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("FK__Users__roleID__6E01572D");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
