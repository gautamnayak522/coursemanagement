USE [master]
GO
/****** Object:  Database [CourseManagement]    Script Date: 21-07-2023 13:09:49 ******/
CREATE DATABASE [CourseManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CourseManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\CourseManagement.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CourseManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\CourseManagement_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CourseManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CourseManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CourseManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CourseManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CourseManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CourseManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CourseManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [CourseManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CourseManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CourseManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CourseManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CourseManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CourseManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CourseManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CourseManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CourseManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CourseManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CourseManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CourseManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CourseManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CourseManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CourseManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CourseManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CourseManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CourseManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CourseManagement] SET  MULTI_USER 
GO
ALTER DATABASE [CourseManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CourseManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CourseManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CourseManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CourseManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CourseManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CourseManagement] SET QUERY_STORE = OFF
GO
USE [CourseManagement]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 21-07-2023 13:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[authorId] [int] IDENTITY(1,1) NOT NULL,
	[authorName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[authorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseEnrollment]    Script Date: 21-07-2023 13:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseEnrollment](
	[enrollID] [int] IDENTITY(1,1) NOT NULL,
	[empID] [int] NULL,
	[courseID] [int] NULL,
	[enrollDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[enrollID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 21-07-2023 13:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[courseID] [int] IDENTITY(1,1) NOT NULL,
	[courseName] [varchar](50) NULL,
	[deptID] [int] NULL,
	[timeDuration] [int] NULL,
	[Description] [varchar](max) NULL,
	[authorId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 21-07-2023 13:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[deptID] [int] IDENTITY(1,1) NOT NULL,
	[deptName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[deptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 21-07-2023 13:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[empID] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[emailAddress] [varchar](50) NULL,
	[mobileNo] [numeric](10, 0) NULL,
	[deptID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[empID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JSONTable]    Script Date: 21-07-2023 13:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JSONTable](
	[id] [int] NULL,
	[name] [varchar](20) NULL,
	[parentId] [int] NULL,
	[positionName] [varchar](20) NULL,
	[imageUrl] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modules]    Script Date: 21-07-2023 13:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modules](
	[moduleID] [int] IDENTITY(1,1) NOT NULL,
	[moduleName] [varchar](50) NULL,
	[isActive] [bit] NULL,
	[parentModuleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[moduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 21-07-2023 13:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[permissionID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[moduleID] [int] NULL,
	[calView] [bit] NULL,
	[canAdd] [bit] NULL,
	[canUpdate] [bit] NULL,
	[canDelete] [bit] NULL,
 CONSTRAINT [PK__Permissi__D821317CE4D245B9] PRIMARY KEY CLUSTERED 
(
	[permissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 21-07-2023 13:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[Price] [int] NULL,
	[MafDate] [date] NULL,
	[MafAt] [varchar](50) NULL,
	[SKU] [varchar](50) NULL,
	[CategoryName] [varchar](50) NULL,
	[SubCategoryName] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[Supplier] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 21-07-2023 13:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[rollName] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rxemployees]    Script Date: 21-07-2023 13:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rxemployees](
	[empID] [int] NOT NULL,
	[EmployeeName] [varchar](50) NULL,
	[OfficialEmail] [varchar](50) NULL,
	[parentempID] [int] NULL,
	[password] [varchar](max) NOT NULL,
	[Operation_Unit] [varchar](50) NULL,
 CONSTRAINT [PK_employees_empID] PRIMARY KEY CLUSTERED 
(
	[empID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 21-07-2023 13:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[taskId] [int] IDENTITY(1,1) NOT NULL,
	[taskTitle] [varchar](50) NULL,
	[isDone] [bit] NULL,
	[createdDate] [date] NULL,
	[doneDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[taskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 21-07-2023 13:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[emailAddress] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[roleID] [int] NULL,
	[Balance] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 
GO
INSERT [dbo].[Authors] ([authorId], [authorName]) VALUES (1, N'John papa')
GO
INSERT [dbo].[Authors] ([authorId], [authorName]) VALUES (2, N'Miško Hevery')
GO
INSERT [dbo].[Authors] ([authorId], [authorName]) VALUES (3, N'Shyam Seshadri')
GO
INSERT [dbo].[Authors] ([authorId], [authorName]) VALUES (4, N'Krishna Rungta')
GO
INSERT [dbo].[Authors] ([authorId], [authorName]) VALUES (5, N'Matt Frisbie')
GO
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseEnrollment] ON 
GO
INSERT [dbo].[CourseEnrollment] ([enrollID], [empID], [courseID], [enrollDate]) VALUES (1, 1, 5, CAST(N'2022-10-12' AS Date))
GO
INSERT [dbo].[CourseEnrollment] ([enrollID], [empID], [courseID], [enrollDate]) VALUES (2, 1, 6, CAST(N'2022-10-12' AS Date))
GO
INSERT [dbo].[CourseEnrollment] ([enrollID], [empID], [courseID], [enrollDate]) VALUES (3, 3, 3, CAST(N'2022-10-12' AS Date))
GO
SET IDENTITY_INSERT [dbo].[CourseEnrollment] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 
GO
INSERT [dbo].[Courses] ([courseID], [courseName], [deptID], [timeDuration], [Description], [authorId]) VALUES (1, N'Entity Framework', 1, 60, N'This course will help you understand the goals and benefits of using Entity Framework 6 for data access and guide you through creating your first code-based model to store and retrieve data using EF’s APIs.', 1)
GO
INSERT [dbo].[Courses] ([courseID], [courseName], [deptID], [timeDuration], [Description], [authorId]) VALUES (2, N'Angular', 1, 60, N'In this course, we will explore the core design of AngularJS 1.x (latest version of AngularJS 1), its components and code organization techniques. We will enhance the functionality of our web app by utilizing dependency injection to reuse existing services as well as write our own. We will create reusable HTML components that take advantage of AngularJS data binding as well as extend HTML syntax with a very powerful feature of AngularJS called directives. We’ll set up routing so our SPA can have multiple views. We will also learn how to unit test our functionality. At the end of this course, you will build a fully functional, well organized and tested web application using AngularJS and deploy it to the cloud.', 2)
GO
INSERT [dbo].[Courses] ([courseID], [courseName], [deptID], [timeDuration], [Description], [authorId]) VALUES (3, N'SQL', 1, 80, N'SQL is Microsoft''s implementation of SQL (Structured Query Language) used to query and manage data in the SQL Server relational database. This skill will teach you how to use T-SQL to query data from SQL Server.', 3)
GO
INSERT [dbo].[Courses] ([courseID], [courseName], [deptID], [timeDuration], [Description], [authorId]) VALUES (4, N'MVC', 1, 120, N'The ASP.NET MVC Course for Beginners is a free course that will teach you how to build web applications using the ASP.NET MVC framework. In this course, you will learn how to create a custom ModelBinder, which is responsible for converting data from a web request into an object that can be used by the controller. You will also learn how to create and handle Forms in ASP.NET MVC, including how to validate user input.

Through a combination of lectures and hands-on exercises, you will gain a solid understanding of ASP.NET MVC and be able to apply the concepts to build your own web applications. The course includes real-world examples that will help you learn how to customize the way data is bound to objects, giving you more control over the behavior of your application. Upon completing this course, you will have a strong foundation in ASP.NET MVC and be able to build your own web applications using this powerful framework. Join us today and take the first step towards becoming an ASP.NET MVC developer!', 4)
GO
INSERT [dbo].[Courses] ([courseID], [courseName], [deptID], [timeDuration], [Description], [authorId]) VALUES (5, N'mySQL', NULL, 60, N'Our MySQL Learning Paths included within the MySQL Learning Subscription provides required and suggested courses to help you achieve your training goals and prepare for an industry-recognized Oracle certification.', 5)
GO
INSERT [dbo].[Courses] ([courseID], [courseName], [deptID], [timeDuration], [Description], [authorId]) VALUES (6, N'Laravel', NULL, 180, N'The goal is to discuss practical examples of structuring larger Laravel applications, various approaches, and patterns. We will analyze existing popular open-source projects and their structure.', 5)
GO
INSERT [dbo].[Courses] ([courseID], [courseName], [deptID], [timeDuration], [Description], [authorId]) VALUES (7, N'Manual Testing', 3, 60, N'In this manual testing course, you will learn how to test a software application manually.', 1)
GO
INSERT [dbo].[Courses] ([courseID], [courseName], [deptID], [timeDuration], [Description], [authorId]) VALUES (9, N'Automation Testing', 3, 60, N'Top courses in Automation Testing and Selenium WebDriver · Selenium WebDriver with Java for beginners · Selenium WebDriver: Automation Testing with Python.', 1)
GO
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 
GO
INSERT [dbo].[Departments] ([deptID], [deptName]) VALUES (1, N'.Net')
GO
INSERT [dbo].[Departments] ([deptID], [deptName]) VALUES (3, N'QA Testing')
GO
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([empID], [firstName], [lastName], [emailAddress], [mobileNo], [deptID]) VALUES (1, N'Abhishek15646546', N'Agrawal', N'abhi@email.com', CAST(9090909080 AS Numeric(10, 0)), 3)
GO
INSERT [dbo].[Employees] ([empID], [firstName], [lastName], [emailAddress], [mobileNo], [deptID]) VALUES (2, N'Shreyal', N'Shah', N'shrey@gmail.com', CAST(8080808080 AS Numeric(10, 0)), 3)
GO
INSERT [dbo].[Employees] ([empID], [firstName], [lastName], [emailAddress], [mobileNo], [deptID]) VALUES (3, N'Gautam', N'Nayak', N'g@g.com', CAST(9099814890 AS Numeric(10, 0)), 1)
GO
INSERT [dbo].[Employees] ([empID], [firstName], [lastName], [emailAddress], [mobileNo], [deptID]) VALUES (4, N'newuser', N'new', N'new@gmail.com', CAST(123456789 AS Numeric(10, 0)), 1)
GO
INSERT [dbo].[Employees] ([empID], [firstName], [lastName], [emailAddress], [mobileNo], [deptID]) VALUES (6, N'Jeet', N'Vegad', N'jeet@gmail.com', CAST(8080808080 AS Numeric(10, 0)), NULL)
GO
INSERT [dbo].[Employees] ([empID], [firstName], [lastName], [emailAddress], [mobileNo], [deptID]) VALUES (12, N'test1', N'testingagain', N't1@gmail.com', CAST(8080808080 AS Numeric(10, 0)), 3)
GO
INSERT [dbo].[Employees] ([empID], [firstName], [lastName], [emailAddress], [mobileNo], [deptID]) VALUES (13, N'test1', N'testingagain', N't1@gmail.com', CAST(8080808080 AS Numeric(10, 0)), 3)
GO
INSERT [dbo].[Employees] ([empID], [firstName], [lastName], [emailAddress], [mobileNo], [deptID]) VALUES (22, N'data', N'data', N'data@data.com', CAST(132123123 AS Numeric(10, 0)), 1)
GO
INSERT [dbo].[Employees] ([empID], [firstName], [lastName], [emailAddress], [mobileNo], [deptID]) VALUES (23, N'test', N'test', N'test@t', CAST(1234 AS Numeric(10, 0)), 1)
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6066, N'Ian Devling', 0, N'Chief Executive Offi', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6067, N'Davolio Nancy', 6066, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6068, N'Leverling Janet', 6066, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6069, N'Leverling Janet', 6066, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6070, N'Leverling Janet', 6066, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6071, N'Leverling Janet', 6067, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6072, N'Fuller Andrew', 6067, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6073, N'Peacock Margaret', 6067, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6074, N'Buchanan Steven', 6067, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6075, N'Suyama Michael', 6067, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6076, N'King Robert', 6067, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6077, N'West Adam', 6067, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6078, N'Charlotte Cooper', 6067, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6079, N'Yoshi Nagase', 6067, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6080, N'Peter Wilson', 6068, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6081, N'Carlos Diaz', 6068, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6082, N'Sven Petersen', 6068, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6083, N'Peter Wilson', 6069, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6084, N'Carlos Diaz', 6069, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6085, N'Sven Petersen', 6069, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6086, N'Peter Wilson', 6070, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6087, N'Carlos Diaz', 6070, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6088, N'Sven Petersen', 6070, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6089, N'Leverling Janet', 6071, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6090, N'Fuller Andrew', 6071, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6091, N'Peacock Margaret', 6071, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6092, N'Buchanan Steven', 6071, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6093, N'Suyama Michael', 6071, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6094, N'King Robert', 6071, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6095, N'West Adam', 6071, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6096, N'Charlotte Cooper', 6071, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6097, N'Yoshi Nagase', 6071, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6098, N'Leverling Janet', 6072, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6099, N'Fuller Andrew', 6072, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6100, N'Peacock Margaret', 6072, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6101, N'Buchanan Steven', 6072, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6102, N'Suyama Michael', 6072, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6103, N'King Robert', 6072, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6104, N'West Adam', 6072, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6105, N'Charlotte Cooper', 6072, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6106, N'Yoshi Nagase', 6072, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6107, N'Leverling Janet', 6073, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6108, N'Fuller Andrew', 6073, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6109, N'Peacock Margaret', 6073, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6110, N'Buchanan Steven', 6073, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6111, N'Suyama Michael', 6073, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6112, N'King Robert', 6073, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6113, N'West Adam', 6073, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6114, N'Charlotte Cooper', 6073, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6115, N'Yoshi Nagase', 6073, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6116, N'Leverling Janet', 6074, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6117, N'Fuller Andrew', 6074, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6118, N'Peacock Margaret', 6074, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6119, N'Buchanan Steven', 6074, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6120, N'Suyama Michael', 6074, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6121, N'King Robert', 6074, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6122, N'West Adam', 6074, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6123, N'Charlotte Cooper', 6074, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6124, N'Yoshi Nagase', 6074, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6125, N'Callahan Laura', 6076, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6126, N'Dodsworth Anne', 6076, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6127, N'Shelley Burke', 6078, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6128, N'Valle Saavedra', 6079, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6129, N'Regina Murphy', 6079, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6130, N'Mayumi Ohno', 6079, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6131, N'SizePalette', 6079, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6132, N'Leverling Janet', 6080, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6133, N'Fuller Andrew', 6080, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6134, N'Peacock Margaret', 6080, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6135, N'Buchanan Steven', 6080, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6136, N'Suyama Michael', 6080, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6137, N'King Robert', 6080, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6138, N'West Adam', 6080, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6139, N'Charlotte Cooper', 6080, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6140, N'Yoshi Nagase', 6080, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6141, N'Leverling Janet', 6081, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6142, N'Fuller Andrew', 6081, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6143, N'Peacock Margaret', 6081, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6144, N'Buchanan Steven', 6081, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6145, N'Suyama Michael', 6081, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6146, N'King Robert', 6081, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6147, N'West Adam', 6081, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6148, N'Charlotte Cooper', 6081, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6149, N'Yoshi Nagase', 6081, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6150, N'Current User', 6082, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6151, N'Beate Vileid', 6082, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6152, N'Lars Peterson', 6083, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6153, N'Leverling Janet', 6084, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6154, N'Fuller Andrew', 6084, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6155, N'Peacock Margaret', 6084, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6156, N'Buchanan Steven', 6084, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6157, N'Suyama Michael', 6084, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6158, N'King Robert', 6084, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6159, N'West Adam', 6084, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6160, N'Charlotte Cooper', 6084, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6161, N'Yoshi Nagase', 6084, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6162, N'Current User', 6085, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6163, N'Beate Vileid', 6085, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6164, N'Lars Peterson', 6086, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6165, N'Petra Winkler', 6087, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6166, N'Martin Bein', 6087, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6167, N'Current User', 6088, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6168, N'Beate Vileid', 6088, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6169, N'Peter Wilson', 6089, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6170, N'Carlos Diaz', 6089, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6171, N'Sven Petersen', 6089, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6172, N'Callahan Laura', 6094, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6173, N'Dodsworth Anne', 6094, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6174, N'Leverling Janet', 6095, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6175, N'Fuller Andrew', 6095, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6176, N'Peacock Margaret', 6095, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6177, N'Buchanan Steven', 6095, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6178, N'Suyama Michael', 6095, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6179, N'King Robert', 6095, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6180, N'West Adam', 6095, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6181, N'Charlotte Cooper', 6095, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6182, N'Yoshi Nagase', 6095, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6183, N'Leverling Janet', 6096, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6184, N'Fuller Andrew', 6096, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6185, N'Peacock Margaret', 6096, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6186, N'Buchanan Steven', 6096, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6187, N'Suyama Michael', 6096, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6188, N'King Robert', 6096, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6189, N'West Adam', 6096, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6190, N'Charlotte Cooper', 6096, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6191, N'Yoshi Nagase', 6096, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6192, N'Valle Saavedra', 6097, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6193, N'Regina Murphy', 6097, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6194, N'Mayumi Ohno', 6097, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6195, N'SizePalette', 6097, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6196, N'Peter Wilson', 6098, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6197, N'Carlos Diaz', 6098, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6198, N'Sven Petersen', 6098, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6199, N'Callahan Laura', 6103, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6200, N'Dodsworth Anne', 6103, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6201, N'Leverling Janet', 6105, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6202, N'Fuller Andrew', 6105, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6203, N'Peacock Margaret', 6105, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6204, N'Buchanan Steven', 6105, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6205, N'Suyama Michael', 6105, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6206, N'King Robert', 6105, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6207, N'West Adam', 6105, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6208, N'Charlotte Cooper', 6105, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6209, N'Yoshi Nagase', 6105, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6210, N'Valle Saavedra', 6106, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6211, N'Regina Murphy', 6106, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6212, N'Mayumi Ohno', 6106, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6213, N'SizePalette', 6106, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6214, N'Peter Wilson', 6107, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6215, N'Carlos Diaz', 6107, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6216, N'Sven Petersen', 6107, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6217, N'Callahan Laura', 6112, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6218, N'Dodsworth Anne', 6112, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6219, N'Shelley Burke', 6114, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6220, N'Valle Saavedra', 6115, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6221, N'Regina Murphy', 6115, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6222, N'Mayumi Ohno', 6115, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6223, N'SizePalette', 6115, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6224, N'Leverling Janet', 6116, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6225, N'Fuller Andrew', 6116, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6226, N'Peacock Margaret', 6116, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6227, N'Buchanan Steven', 6116, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6228, N'Suyama Michael', 6116, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6229, N'King Robert', 6116, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6230, N'West Adam', 6116, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6231, N'Charlotte Cooper', 6116, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6232, N'Yoshi Nagase', 6116, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6233, N'Leverling Janet', 6117, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6234, N'Fuller Andrew', 6117, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6235, N'Peacock Margaret', 6117, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6236, N'Buchanan Steven', 6117, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6237, N'Suyama Michael', 6117, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6238, N'King Robert', 6117, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6239, N'West Adam', 6117, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6240, N'Charlotte Cooper', 6117, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6241, N'Yoshi Nagase', 6117, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6242, N'Leverling Janet', 6118, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6243, N'Fuller Andrew', 6118, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6244, N'Peacock Margaret', 6118, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6245, N'Buchanan Steven', 6118, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6246, N'Suyama Michael', 6118, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6247, N'King Robert', 6118, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6248, N'West Adam', 6118, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6249, N'Charlotte Cooper', 6118, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6250, N'Yoshi Nagase', 6118, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6251, N'Callahan Laura', 6121, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6252, N'Dodsworth Anne', 6121, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6253, N'Shelley Burke', 6123, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6254, N'Valle Saavedra', 6124, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6255, N'Regina Murphy', 6124, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6256, N'Mayumi Ohno', 6124, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6257, N'SizePalette', 6124, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6258, N'Leverling Janet', 6125, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6259, N'Fuller Andrew', 6125, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6260, N'Peacock Margaret', 6125, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6261, N'Buchanan Steven', 6125, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6262, N'Suyama Michael', 6125, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6263, N'King Robert', 6125, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6264, N'West Adam', 6125, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6265, N'Charlotte Cooper', 6125, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6266, N'Yoshi Nagase', 6125, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6267, N'Leverling Janet', 6127, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6268, N'Fuller Andrew', 6127, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6269, N'Peacock Margaret', 6127, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6270, N'Buchanan Steven', 6127, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6271, N'Suyama Michael', 6127, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6272, N'King Robert', 6127, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6273, N'West Adam', 6127, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6274, N'Charlotte Cooper', 6127, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6275, N'Yoshi Nagase', 6127, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6276, N'Leverling Janet', 6132, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6277, N'Fuller Andrew', 6132, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6278, N'Peacock Margaret', 6132, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6279, N'Buchanan Steven', 6132, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6280, N'Suyama Michael', 6132, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6281, N'King Robert', 6132, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6282, N'West Adam', 6132, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6283, N'Charlotte Cooper', 6132, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6284, N'Yoshi Nagase', 6132, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6285, N'Leverling Janet', 6133, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6286, N'Fuller Andrew', 6133, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6287, N'Peacock Margaret', 6133, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6288, N'Buchanan Steven', 6133, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6289, N'Suyama Michael', 6133, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6290, N'King Robert', 6133, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6291, N'West Adam', 6133, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6292, N'Charlotte Cooper', 6133, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6293, N'Yoshi Nagase', 6133, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6294, N'Leverling Janet', 6134, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6295, N'Fuller Andrew', 6134, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6296, N'Peacock Margaret', 6134, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6297, N'Buchanan Steven', 6134, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6298, N'Suyama Michael', 6134, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6299, N'King Robert', 6134, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6300, N'West Adam', 6134, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6301, N'Charlotte Cooper', 6134, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6302, N'Yoshi Nagase', 6134, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6303, N'Callahan Laura', 6137, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6304, N'Dodsworth Anne', 6137, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6305, N'Shelley Burke', 6139, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6306, N'Valle Saavedra', 6140, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6307, N'Regina Murphy', 6140, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6308, N'Mayumi Ohno', 6140, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6309, N'SizePalette', 6140, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6310, N'Leverling Janet', 6141, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6311, N'Fuller Andrew', 6141, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6312, N'Peacock Margaret', 6141, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6313, N'Buchanan Steven', 6141, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6314, N'Suyama Michael', 6141, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6315, N'King Robert', 6141, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6316, N'West Adam', 6141, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6317, N'Charlotte Cooper', 6141, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6318, N'Yoshi Nagase', 6141, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6319, N'Leverling Janet', 6142, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6320, N'Fuller Andrew', 6142, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6321, N'Peacock Margaret', 6142, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6322, N'Buchanan Steven', 6142, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6323, N'Suyama Michael', 6142, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6324, N'King Robert', 6142, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6325, N'West Adam', 6142, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6326, N'Charlotte Cooper', 6142, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6327, N'Yoshi Nagase', 6142, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6328, N'Leverling Janet', 6143, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6329, N'Fuller Andrew', 6143, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6330, N'Peacock Margaret', 6143, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6331, N'Buchanan Steven', 6143, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6332, N'Suyama Michael', 6143, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6333, N'King Robert', 6143, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6334, N'West Adam', 6143, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6335, N'Charlotte Cooper', 6143, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6336, N'Yoshi Nagase', 6143, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6337, N'Callahan Laura', 6146, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6338, N'Dodsworth Anne', 6146, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6339, N'Shelley Burke', 6148, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6340, N'Valle Saavedra', 6149, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6341, N'Regina Murphy', 6149, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6342, N'Mayumi Ohno', 6149, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6343, N'SizePalette', 6149, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6344, N'Leverling Janet', 6153, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6345, N'Fuller Andrew', 6153, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6346, N'Peacock Margaret', 6153, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6347, N'Buchanan Steven', 6153, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6348, N'Suyama Michael', 6153, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6349, N'King Robert', 6153, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6350, N'West Adam', 6153, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6351, N'Charlotte Cooper', 6153, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6352, N'Yoshi Nagase', 6153, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6353, N'Leverling Janet', 6154, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6354, N'Fuller Andrew', 6154, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6355, N'Peacock Margaret', 6154, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6356, N'Buchanan Steven', 6154, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6357, N'Suyama Michael', 6154, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6358, N'King Robert', 6154, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6359, N'West Adam', 6154, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6360, N'Charlotte Cooper', 6154, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6361, N'Yoshi Nagase', 6154, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6362, N'Leverling Janet', 6155, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6363, N'Fuller Andrew', 6155, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6364, N'Peacock Margaret', 6155, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6365, N'Buchanan Steven', 6155, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6366, N'Suyama Michael', 6155, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6367, N'King Robert', 6155, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6368, N'West Adam', 6155, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6369, N'Charlotte Cooper', 6155, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6370, N'Yoshi Nagase', 6155, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6371, N'Callahan Laura', 6158, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6372, N'Dodsworth Anne', 6158, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6373, N'Shelley Burke', 6160, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6374, N'Valle Saavedra', 6161, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6375, N'Regina Murphy', 6161, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6376, N'Mayumi Ohno', 6161, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6377, N'SizePalette', 6161, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6378, N'Leverling Janet', 6166, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6379, N'Fuller Andrew', 6166, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6380, N'Peacock Margaret', 6166, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6381, N'Buchanan Steven', 6166, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6382, N'Suyama Michael', 6166, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6383, N'King Robert', 6166, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6384, N'West Adam', 6166, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6385, N'Charlotte Cooper', 6166, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6386, N'Yoshi Nagase', 6166, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6387, N'Lars Peterson', 6169, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6388, N'Leverling Janet', 6170, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6389, N'Fuller Andrew', 6170, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6390, N'Peacock Margaret', 6170, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6391, N'Buchanan Steven', 6170, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6392, N'Suyama Michael', 6170, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6393, N'King Robert', 6170, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6394, N'West Adam', 6170, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6395, N'Charlotte Cooper', 6170, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6396, N'Yoshi Nagase', 6170, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6397, N'Current User', 6171, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6398, N'Beate Vileid', 6171, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6399, N'Leverling Janet', 6174, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6400, N'Fuller Andrew', 6174, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6401, N'Peacock Margaret', 6174, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6402, N'Buchanan Steven', 6174, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6403, N'Suyama Michael', 6174, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6404, N'King Robert', 6174, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6405, N'West Adam', 6174, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6406, N'Charlotte Cooper', 6174, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6407, N'Yoshi Nagase', 6174, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6408, N'Leverling Janet', 6175, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6409, N'Fuller Andrew', 6175, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6410, N'Peacock Margaret', 6175, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6411, N'Buchanan Steven', 6175, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6412, N'Suyama Michael', 6175, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6413, N'King Robert', 6175, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6414, N'West Adam', 6175, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6415, N'Charlotte Cooper', 6175, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6416, N'Yoshi Nagase', 6175, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6417, N'Leverling Janet', 6176, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6418, N'Fuller Andrew', 6176, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6419, N'Peacock Margaret', 6176, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6420, N'Buchanan Steven', 6176, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6421, N'Suyama Michael', 6176, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6422, N'King Robert', 6176, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6423, N'West Adam', 6176, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6424, N'Charlotte Cooper', 6176, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6425, N'Yoshi Nagase', 6176, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6426, N'Callahan Laura', 6179, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6427, N'Dodsworth Anne', 6179, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6428, N'Shelley Burke', 6181, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6429, N'Valle Saavedra', 6182, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6430, N'Regina Murphy', 6182, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6431, N'Mayumi Ohno', 6182, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6432, N'SizePalette', 6182, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6433, N'Leverling Janet', 6183, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6434, N'Fuller Andrew', 6183, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6435, N'Peacock Margaret', 6183, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6436, N'Buchanan Steven', 6183, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6437, N'Suyama Michael', 6183, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6438, N'King Robert', 6183, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6439, N'West Adam', 6183, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6440, N'Charlotte Cooper', 6183, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6441, N'Yoshi Nagase', 6183, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6442, N'Leverling Janet', 6184, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6443, N'Fuller Andrew', 6184, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6444, N'Peacock Margaret', 6184, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6445, N'Buchanan Steven', 6184, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6446, N'Suyama Michael', 6184, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6447, N'King Robert', 6184, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6448, N'West Adam', 6184, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6449, N'Charlotte Cooper', 6184, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6450, N'Yoshi Nagase', 6184, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6451, N'Leverling Janet', 6185, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6452, N'Fuller Andrew', 6185, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6453, N'Peacock Margaret', 6185, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6454, N'Buchanan Steven', 6185, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6455, N'Suyama Michael', 6185, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6456, N'King Robert', 6185, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6457, N'West Adam', 6185, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6458, N'Charlotte Cooper', 6185, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6459, N'Yoshi Nagase', 6185, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6460, N'Callahan Laura', 6188, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6461, N'Dodsworth Anne', 6188, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6462, N'Shelley Burke', 6190, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6463, N'Valle Saavedra', 6191, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6464, N'Regina Murphy', 6191, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6465, N'Mayumi Ohno', 6191, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6466, N'SizePalette', 6191, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6467, N'Lars Peterson', 6196, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6468, N'Petra Winkler', 6197, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6469, N'Martin Bein', 6197, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6470, N'Current User', 6198, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6471, N'Beate Vileid', 6198, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6472, N'Leverling Janet', 6201, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6473, N'Fuller Andrew', 6201, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6474, N'Peacock Margaret', 6201, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6475, N'Buchanan Steven', 6201, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6476, N'Suyama Michael', 6201, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6477, N'King Robert', 6201, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6478, N'West Adam', 6201, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6479, N'Charlotte Cooper', 6201, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6480, N'Yoshi Nagase', 6201, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6481, N'Leverling Janet', 6202, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6482, N'Fuller Andrew', 6202, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6483, N'Peacock Margaret', 6202, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6484, N'Buchanan Steven', 6202, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6485, N'Suyama Michael', 6202, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6486, N'King Robert', 6202, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6487, N'West Adam', 6202, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6488, N'Charlotte Cooper', 6202, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6489, N'Yoshi Nagase', 6202, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6490, N'Leverling Janet', 6203, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6491, N'Fuller Andrew', 6203, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6492, N'Peacock Margaret', 6203, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6493, N'Buchanan Steven', 6203, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6494, N'Suyama Michael', 6203, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6495, N'King Robert', 6203, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6496, N'West Adam', 6203, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6497, N'Charlotte Cooper', 6203, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6498, N'Yoshi Nagase', 6203, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6499, N'Callahan Laura', 6206, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6500, N'Dodsworth Anne', 6206, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6501, N'Shelley Burke', 6208, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6502, N'Valle Saavedra', 6209, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6503, N'Regina Murphy', 6209, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6504, N'Mayumi Ohno', 6209, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6505, N'SizePalette', 6209, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6506, N'Lars Peterson', 6214, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6507, N'Petra Winkler', 6215, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6508, N'Martin Bein', 6215, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6509, N'Current User', 6216, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6510, N'Beate Vileid', 6216, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6511, N'Peter Wilson', 6224, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6512, N'Carlos Diaz', 6224, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6513, N'Sven Petersen', 6224, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6514, N'Callahan Laura', 6229, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6515, N'Dodsworth Anne', 6229, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6516, N'Shelley Burke', 6231, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6517, N'Valle Saavedra', 6232, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6518, N'Regina Murphy', 6232, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6519, N'Mayumi Ohno', 6232, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6520, N'SizePalette', 6232, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6521, N'Peter Wilson', 6233, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6522, N'Carlos Diaz', 6233, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6523, N'Sven Petersen', 6233, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6524, N'Callahan Laura', 6238, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6525, N'Dodsworth Anne', 6238, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6526, N'Shelley Burke', 6240, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6527, N'Valle Saavedra', 6241, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6528, N'Regina Murphy', 6241, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6529, N'Mayumi Ohno', 6241, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6530, N'SizePalette', 6241, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6531, N'Peter Wilson', 6242, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6532, N'Carlos Diaz', 6242, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6533, N'Sven Petersen', 6242, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6534, N'Callahan Laura', 6247, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6535, N'Dodsworth Anne', 6247, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6536, N'Shelley Burke', 6249, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6537, N'Valle Saavedra', 6250, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6538, N'Regina Murphy', 6250, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6539, N'Mayumi Ohno', 6250, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6540, N'SizePalette', 6250, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6541, N'Leverling Janet', 6251, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6542, N'Fuller Andrew', 6251, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6543, N'Peacock Margaret', 6251, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6544, N'Buchanan Steven', 6251, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6545, N'Suyama Michael', 6251, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6546, N'King Robert', 6251, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6547, N'West Adam', 6251, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6548, N'Charlotte Cooper', 6251, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6549, N'Yoshi Nagase', 6251, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6550, N'Leverling Janet', 6253, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6551, N'Fuller Andrew', 6253, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6552, N'Peacock Margaret', 6253, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6553, N'Buchanan Steven', 6253, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6554, N'Suyama Michael', 6253, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6555, N'King Robert', 6253, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6556, N'West Adam', 6253, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6557, N'Charlotte Cooper', 6253, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6558, N'Yoshi Nagase', 6253, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6559, N'Peter Wilson', 6258, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6560, N'Carlos Diaz', 6258, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6561, N'Sven Petersen', 6258, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6562, N'Callahan Laura', 6263, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6563, N'Dodsworth Anne', 6263, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6564, N'Shelley Burke', 6265, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6565, N'Valle Saavedra', 6266, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6566, N'Regina Murphy', 6266, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6567, N'Mayumi Ohno', 6266, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6568, N'SizePalette', 6266, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6569, N'Peter Wilson', 6267, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6570, N'Carlos Diaz', 6267, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6571, N'Sven Petersen', 6267, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6572, N'Callahan Laura', 6272, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6573, N'Dodsworth Anne', 6272, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6574, N'Shelley Burke', 6274, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6575, N'Valle Saavedra', 6275, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6576, N'Regina Murphy', 6275, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6577, N'Mayumi Ohno', 6275, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6578, N'SizePalette', 6275, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6579, N'Peter Wilson', 6276, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6580, N'Carlos Diaz', 6276, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6581, N'Sven Petersen', 6276, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6582, N'Leverling Janet', 6277, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6583, N'Fuller Andrew', 6277, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6584, N'Peacock Margaret', 6277, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6585, N'Buchanan Steven', 6277, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6586, N'Suyama Michael', 6277, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6587, N'King Robert', 6277, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6588, N'West Adam', 6277, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6589, N'Charlotte Cooper', 6277, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6590, N'Yoshi Nagase', 6277, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6591, N'Callahan Laura', 6281, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6592, N'Dodsworth Anne', 6281, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6593, N'Shelley Burke', 6283, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6594, N'Valle Saavedra', 6284, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6595, N'Regina Murphy', 6284, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6596, N'Mayumi Ohno', 6284, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6597, N'SizePalette', 6284, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6598, N'Peter Wilson', 6285, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6599, N'Carlos Diaz', 6285, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6600, N'Sven Petersen', 6285, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6601, N'Callahan Laura', 6290, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6602, N'Dodsworth Anne', 6290, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6603, N'Shelley Burke', 6292, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6604, N'Valle Saavedra', 6293, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6605, N'Regina Murphy', 6293, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6606, N'Mayumi Ohno', 6293, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6607, N'SizePalette', 6293, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6608, N'Peter Wilson', 6294, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6609, N'Carlos Diaz', 6294, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6610, N'Sven Petersen', 6294, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6611, N'Callahan Laura', 6299, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6612, N'Dodsworth Anne', 6299, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6613, N'Shelley Burke', 6301, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6614, N'Valle Saavedra', 6302, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6615, N'Regina Murphy', 6302, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6616, N'Mayumi Ohno', 6302, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6617, N'SizePalette', 6302, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6618, N'Leverling Janet', 6303, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6619, N'Fuller Andrew', 6303, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6620, N'Peacock Margaret', 6303, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6621, N'Buchanan Steven', 6303, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6622, N'Suyama Michael', 6303, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6623, N'King Robert', 6303, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6624, N'West Adam', 6303, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6625, N'Charlotte Cooper', 6303, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6626, N'Yoshi Nagase', 6303, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6627, N'Leverling Janet', 6305, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6628, N'Fuller Andrew', 6305, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6629, N'Peacock Margaret', 6305, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6630, N'Buchanan Steven', 6305, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6631, N'Suyama Michael', 6305, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6632, N'King Robert', 6305, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6633, N'West Adam', 6305, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6634, N'Charlotte Cooper', 6305, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6635, N'Yoshi Nagase', 6305, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6636, N'Peter Wilson', 6310, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6637, N'Carlos Diaz', 6310, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6638, N'Sven Petersen', 6310, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6639, N'Callahan Laura', 6315, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6640, N'Dodsworth Anne', 6315, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6641, N'Shelley Burke', 6317, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6642, N'Valle Saavedra', 6318, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6643, N'Regina Murphy', 6318, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6644, N'Mayumi Ohno', 6318, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6645, N'SizePalette', 6318, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6646, N'Peter Wilson', 6319, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6647, N'Carlos Diaz', 6319, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6648, N'Sven Petersen', 6319, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6649, N'Callahan Laura', 6324, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6650, N'Dodsworth Anne', 6324, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6651, N'Shelley Burke', 6326, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6652, N'Valle Saavedra', 6327, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6653, N'Regina Murphy', 6327, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6654, N'Mayumi Ohno', 6327, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6655, N'SizePalette', 6327, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6656, N'Peter Wilson', 6328, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6657, N'Carlos Diaz', 6328, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6658, N'Sven Petersen', 6328, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6659, N'Callahan Laura', 6333, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6660, N'Dodsworth Anne', 6333, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6661, N'Shelley Burke', 6335, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6662, N'Valle Saavedra', 6336, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6663, N'Regina Murphy', 6336, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6664, N'Mayumi Ohno', 6336, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6665, N'SizePalette', 6336, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6666, N'Leverling Janet', 6337, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6667, N'Fuller Andrew', 6337, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6668, N'Peacock Margaret', 6337, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6669, N'Buchanan Steven', 6337, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6670, N'Suyama Michael', 6337, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6671, N'King Robert', 6337, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6672, N'West Adam', 6337, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6673, N'Charlotte Cooper', 6337, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6674, N'Yoshi Nagase', 6337, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6675, N'Leverling Janet', 6339, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6676, N'Fuller Andrew', 6339, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6677, N'Peacock Margaret', 6339, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6678, N'Buchanan Steven', 6339, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6679, N'Suyama Michael', 6339, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6680, N'King Robert', 6339, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6681, N'West Adam', 6339, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6682, N'Charlotte Cooper', 6339, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6683, N'Yoshi Nagase', 6339, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6684, N'Peter Wilson', 6344, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6685, N'Carlos Diaz', 6344, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6686, N'Sven Petersen', 6344, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6687, N'Callahan Laura', 6349, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6688, N'Dodsworth Anne', 6349, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6689, N'Shelley Burke', 6351, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6690, N'Valle Saavedra', 6352, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6691, N'Regina Murphy', 6352, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6692, N'Mayumi Ohno', 6352, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6693, N'SizePalette', 6352, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6694, N'Peter Wilson', 6353, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6695, N'Carlos Diaz', 6353, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6696, N'Sven Petersen', 6353, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6697, N'Callahan Laura', 6358, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6698, N'Dodsworth Anne', 6358, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6699, N'Shelley Burke', 6360, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6700, N'Valle Saavedra', 6361, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6701, N'Regina Murphy', 6361, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6702, N'Mayumi Ohno', 6361, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6703, N'SizePalette', 6361, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6704, N'Peter Wilson', 6362, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6705, N'Carlos Diaz', 6362, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6706, N'Sven Petersen', 6362, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6707, N'Callahan Laura', 6367, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6708, N'Dodsworth Anne', 6367, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6709, N'Shelley Burke', 6369, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6710, N'Valle Saavedra', 6370, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6711, N'Regina Murphy', 6370, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6712, N'Mayumi Ohno', 6370, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6713, N'SizePalette', 6370, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6714, N'Leverling Janet', 6371, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6715, N'Fuller Andrew', 6371, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6716, N'Peacock Margaret', 6371, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6717, N'Buchanan Steven', 6371, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6718, N'Suyama Michael', 6371, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6719, N'King Robert', 6371, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6720, N'West Adam', 6371, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6721, N'Charlotte Cooper', 6371, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6722, N'Yoshi Nagase', 6371, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6723, N'Leverling Janet', 6373, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6724, N'Fuller Andrew', 6373, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6725, N'Peacock Margaret', 6373, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6726, N'Buchanan Steven', 6373, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6727, N'Suyama Michael', 6373, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6728, N'King Robert', 6373, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6729, N'West Adam', 6373, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6730, N'Charlotte Cooper', 6373, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6731, N'Yoshi Nagase', 6373, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6732, N'Leverling Janet', 6378, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6733, N'Fuller Andrew', 6378, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6734, N'Peacock Margaret', 6378, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6735, N'Buchanan Steven', 6378, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6736, N'Suyama Michael', 6378, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6737, N'King Robert', 6378, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6738, N'West Adam', 6378, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6739, N'Charlotte Cooper', 6378, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6740, N'Yoshi Nagase', 6378, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6741, N'Leverling Janet', 6379, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6742, N'Fuller Andrew', 6379, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6743, N'Peacock Margaret', 6379, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6744, N'Buchanan Steven', 6379, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6745, N'Suyama Michael', 6379, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6746, N'King Robert', 6379, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6747, N'West Adam', 6379, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6748, N'Charlotte Cooper', 6379, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6749, N'Yoshi Nagase', 6379, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6750, N'Leverling Janet', 6380, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6751, N'Fuller Andrew', 6380, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6752, N'Peacock Margaret', 6380, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6753, N'Buchanan Steven', 6380, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6754, N'Suyama Michael', 6380, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6755, N'King Robert', 6380, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6756, N'West Adam', 6380, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6757, N'Charlotte Cooper', 6380, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6758, N'Yoshi Nagase', 6380, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6759, N'Callahan Laura', 6383, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6760, N'Dodsworth Anne', 6383, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6761, N'Shelley Burke', 6385, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6762, N'Valle Saavedra', 6386, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6763, N'Regina Murphy', 6386, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6764, N'Mayumi Ohno', 6386, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6765, N'SizePalette', 6386, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6766, N'Leverling Janet', 6388, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6767, N'Fuller Andrew', 6388, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6768, N'Peacock Margaret', 6388, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6769, N'Buchanan Steven', 6388, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6770, N'Suyama Michael', 6388, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6771, N'King Robert', 6388, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6772, N'West Adam', 6388, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6773, N'Charlotte Cooper', 6388, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6774, N'Yoshi Nagase', 6388, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6775, N'Leverling Janet', 6389, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6776, N'Fuller Andrew', 6389, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6777, N'Peacock Margaret', 6389, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6778, N'Buchanan Steven', 6389, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6779, N'Suyama Michael', 6389, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6780, N'King Robert', 6389, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6781, N'West Adam', 6389, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6782, N'Charlotte Cooper', 6389, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6783, N'Yoshi Nagase', 6389, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6784, N'Leverling Janet', 6390, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6785, N'Fuller Andrew', 6390, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6786, N'Peacock Margaret', 6390, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6787, N'Buchanan Steven', 6390, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6788, N'Suyama Michael', 6390, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6789, N'King Robert', 6390, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6790, N'West Adam', 6390, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6791, N'Charlotte Cooper', 6390, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6792, N'Yoshi Nagase', 6390, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6793, N'Callahan Laura', 6393, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6794, N'Dodsworth Anne', 6393, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6795, N'Shelley Burke', 6395, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6796, N'Valle Saavedra', 6396, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6797, N'Regina Murphy', 6396, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6798, N'Mayumi Ohno', 6396, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6799, N'SizePalette', 6396, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6800, N'Peter Wilson', 6399, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6801, N'Carlos Diaz', 6399, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6802, N'Sven Petersen', 6399, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6803, N'Callahan Laura', 6404, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6804, N'Dodsworth Anne', 6404, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6805, N'Shelley Burke', 6406, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6806, N'Valle Saavedra', 6407, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6807, N'Regina Murphy', 6407, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6808, N'Mayumi Ohno', 6407, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6809, N'SizePalette', 6407, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6810, N'Peter Wilson', 6408, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6811, N'Carlos Diaz', 6408, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6812, N'Sven Petersen', 6408, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6813, N'Callahan Laura', 6413, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6814, N'Dodsworth Anne', 6413, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6815, N'Shelley Burke', 6415, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6816, N'Valle Saavedra', 6416, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6817, N'Regina Murphy', 6416, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6818, N'Mayumi Ohno', 6416, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6819, N'SizePalette', 6416, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6820, N'Peter Wilson', 6417, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6821, N'Carlos Diaz', 6417, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6822, N'Sven Petersen', 6417, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6823, N'Callahan Laura', 6422, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6824, N'Dodsworth Anne', 6422, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6825, N'Shelley Burke', 6424, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6826, N'Valle Saavedra', 6425, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6827, N'Regina Murphy', 6425, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6828, N'Mayumi Ohno', 6425, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6829, N'SizePalette', 6425, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6830, N'Leverling Janet', 6426, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6831, N'Fuller Andrew', 6426, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6832, N'Peacock Margaret', 6426, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6833, N'Buchanan Steven', 6426, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6834, N'Suyama Michael', 6426, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6835, N'King Robert', 6426, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6836, N'West Adam', 6426, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6837, N'Charlotte Cooper', 6426, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6838, N'Yoshi Nagase', 6426, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6839, N'Leverling Janet', 6428, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6840, N'Fuller Andrew', 6428, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6841, N'Peacock Margaret', 6428, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6842, N'Buchanan Steven', 6428, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6843, N'Suyama Michael', 6428, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6844, N'King Robert', 6428, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6845, N'West Adam', 6428, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6846, N'Charlotte Cooper', 6428, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6847, N'Yoshi Nagase', 6428, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6848, N'Peter Wilson', 6433, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6849, N'Carlos Diaz', 6433, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6850, N'Sven Petersen', 6433, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6851, N'Callahan Laura', 6438, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6852, N'Dodsworth Anne', 6438, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6853, N'Shelley Burke', 6440, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6854, N'Valle Saavedra', 6441, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6855, N'Regina Murphy', 6441, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6856, N'Mayumi Ohno', 6441, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6857, N'SizePalette', 6441, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6858, N'Peter Wilson', 6442, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6859, N'Carlos Diaz', 6442, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6860, N'Sven Petersen', 6442, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6861, N'Callahan Laura', 6447, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6862, N'Dodsworth Anne', 6447, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6863, N'Shelley Burke', 6449, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6864, N'Valle Saavedra', 6450, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6865, N'Regina Murphy', 6450, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6866, N'Mayumi Ohno', 6450, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6867, N'SizePalette', 6450, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6868, N'Peter Wilson', 6451, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6869, N'Carlos Diaz', 6451, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6870, N'Sven Petersen', 6451, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6871, N'Callahan Laura', 6456, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6872, N'Dodsworth Anne', 6456, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6873, N'Shelley Burke', 6458, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6874, N'Valle Saavedra', 6459, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6875, N'Regina Murphy', 6459, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6876, N'Mayumi Ohno', 6459, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6877, N'SizePalette', 6459, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6878, N'Leverling Janet', 6460, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6879, N'Fuller Andrew', 6460, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6880, N'Peacock Margaret', 6460, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6881, N'Buchanan Steven', 6460, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6882, N'Suyama Michael', 6460, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6883, N'King Robert', 6460, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6884, N'West Adam', 6460, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6885, N'Charlotte Cooper', 6460, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6886, N'Yoshi Nagase', 6460, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6887, N'Leverling Janet', 6462, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6888, N'Fuller Andrew', 6462, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6889, N'Peacock Margaret', 6462, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6890, N'Buchanan Steven', 6462, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6891, N'Suyama Michael', 6462, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6892, N'King Robert', 6462, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6893, N'West Adam', 6462, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6894, N'Charlotte Cooper', 6462, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6895, N'Yoshi Nagase', 6462, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6896, N'Peter Wilson', 6472, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6897, N'Carlos Diaz', 6472, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6898, N'Sven Petersen', 6472, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6899, N'Callahan Laura', 6477, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6900, N'Dodsworth Anne', 6477, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6901, N'Shelley Burke', 6479, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6902, N'Valle Saavedra', 6480, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6903, N'Regina Murphy', 6480, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6904, N'Mayumi Ohno', 6480, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6905, N'SizePalette', 6480, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6906, N'Peter Wilson', 6481, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6907, N'Carlos Diaz', 6481, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6908, N'Sven Petersen', 6481, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6909, N'Callahan Laura', 6486, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6910, N'Dodsworth Anne', 6486, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6911, N'Shelley Burke', 6488, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6912, N'Valle Saavedra', 6489, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6913, N'Regina Murphy', 6489, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6914, N'Mayumi Ohno', 6489, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6915, N'SizePalette', 6489, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6916, N'Peter Wilson', 6490, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6917, N'Carlos Diaz', 6490, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6918, N'Sven Petersen', 6490, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6919, N'Callahan Laura', 6495, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6920, N'Dodsworth Anne', 6495, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6921, N'Shelley Burke', 6497, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6922, N'Valle Saavedra', 6498, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6923, N'Regina Murphy', 6498, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6924, N'Mayumi Ohno', 6498, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6925, N'SizePalette', 6498, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6926, N'Leverling Janet', 6499, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6927, N'Fuller Andrew', 6499, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6928, N'Peacock Margaret', 6499, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6929, N'Buchanan Steven', 6499, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6930, N'Suyama Michael', 6499, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6931, N'King Robert', 6499, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6932, N'West Adam', 6499, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6933, N'Charlotte Cooper', 6499, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6934, N'Yoshi Nagase', 6499, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6935, N'Leverling Janet', 6501, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6936, N'Fuller Andrew', 6501, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6937, N'Peacock Margaret', 6501, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6938, N'Buchanan Steven', 6501, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6939, N'Suyama Michael', 6501, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6940, N'King Robert', 6501, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6941, N'West Adam', 6501, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6942, N'Charlotte Cooper', 6501, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6943, N'Yoshi Nagase', 6501, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6944, N'Lars Peterson', 6511, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6945, N'Petra Winkler', 6512, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6946, N'Martin Bein', 6512, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6947, N'Current User', 6513, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6948, N'Beate Vileid', 6513, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6949, N'Lars Peterson', 6521, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6950, N'Petra Winkler', 6522, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6951, N'Martin Bein', 6522, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6952, N'Current User', 6523, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6953, N'Beate Vileid', 6523, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6954, N'Lars Peterson', 6531, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6955, N'Petra Winkler', 6532, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6956, N'Martin Bein', 6532, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6957, N'Current User', 6533, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6958, N'Beate Vileid', 6533, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6959, N'Peter Wilson', 6541, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6960, N'Carlos Diaz', 6541, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6961, N'Sven Petersen', 6541, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6962, N'Callahan Laura', 6546, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6963, N'Dodsworth Anne', 6546, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6964, N'Shelley Burke', 6548, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6965, N'Valle Saavedra', 6549, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6966, N'Regina Murphy', 6549, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6967, N'Mayumi Ohno', 6549, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6968, N'SizePalette', 6549, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6969, N'Peter Wilson', 6550, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6970, N'Carlos Diaz', 6550, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6971, N'Sven Petersen', 6550, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6972, N'Callahan Laura', 6555, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6973, N'Dodsworth Anne', 6555, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6974, N'Shelley Burke', 6557, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6975, N'Valle Saavedra', 6558, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6976, N'Regina Murphy', 6558, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6977, N'Mayumi Ohno', 6558, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6978, N'SizePalette', 6558, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6979, N'Lars Peterson', 6559, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6980, N'Petra Winkler', 6560, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6981, N'Martin Bein', 6560, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6982, N'Current User', 6561, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6983, N'Beate Vileid', 6561, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6984, N'Lars Peterson', 6569, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6985, N'Petra Winkler', 6570, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6986, N'Martin Bein', 6570, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6987, N'Current User', 6571, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6988, N'Beate Vileid', 6571, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6989, N'Lars Peterson', 6579, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6990, N'Petra Winkler', 6580, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6991, N'Martin Bein', 6580, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6992, N'Current User', 6581, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6993, N'Beate Vileid', 6581, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6994, N'Leverling Janet', 6582, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6995, N'Fuller Andrew', 6582, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6996, N'Peacock Margaret', 6582, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6997, N'Buchanan Steven', 6582, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6998, N'Suyama Michael', 6582, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (6999, N'King Robert', 6582, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7000, N'West Adam', 6582, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7001, N'Charlotte Cooper', 6582, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7002, N'Yoshi Nagase', 6582, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7003, N'Leverling Janet', 6583, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7004, N'Fuller Andrew', 6583, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7005, N'Peacock Margaret', 6583, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7006, N'Buchanan Steven', 6583, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7007, N'Suyama Michael', 6583, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7008, N'King Robert', 6583, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7009, N'West Adam', 6583, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7010, N'Charlotte Cooper', 6583, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7011, N'Yoshi Nagase', 6583, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7012, N'Leverling Janet', 6584, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7013, N'Fuller Andrew', 6584, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7014, N'Peacock Margaret', 6584, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7015, N'Buchanan Steven', 6584, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7016, N'Suyama Michael', 6584, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7017, N'King Robert', 6584, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7018, N'West Adam', 6584, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7019, N'Charlotte Cooper', 6584, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7020, N'Yoshi Nagase', 6584, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7021, N'Callahan Laura', 6587, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7022, N'Dodsworth Anne', 6587, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7023, N'Shelley Burke', 6589, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7024, N'Valle Saavedra', 6590, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7025, N'Regina Murphy', 6590, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7026, N'Mayumi Ohno', 6590, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7027, N'SizePalette', 6590, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7028, N'Lars Peterson', 6598, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7029, N'Petra Winkler', 6599, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7030, N'Martin Bein', 6599, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7031, N'Current User', 6600, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7032, N'Beate Vileid', 6600, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7033, N'Lars Peterson', 6608, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7034, N'Petra Winkler', 6609, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7035, N'Martin Bein', 6609, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7036, N'Current User', 6610, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7037, N'Beate Vileid', 6610, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7038, N'Peter Wilson', 6618, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7039, N'Carlos Diaz', 6618, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7040, N'Sven Petersen', 6618, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7041, N'Callahan Laura', 6623, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7042, N'Dodsworth Anne', 6623, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7043, N'Shelley Burke', 6625, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7044, N'Valle Saavedra', 6626, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7045, N'Regina Murphy', 6626, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7046, N'Mayumi Ohno', 6626, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7047, N'SizePalette', 6626, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7048, N'Peter Wilson', 6627, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7049, N'Carlos Diaz', 6627, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7050, N'Sven Petersen', 6627, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7051, N'Callahan Laura', 6632, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7052, N'Dodsworth Anne', 6632, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7053, N'Shelley Burke', 6634, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7054, N'Valle Saavedra', 6635, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7055, N'Regina Murphy', 6635, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7056, N'Mayumi Ohno', 6635, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7057, N'SizePalette', 6635, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7058, N'Lars Peterson', 6636, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7059, N'Petra Winkler', 6637, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7060, N'Martin Bein', 6637, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7061, N'Current User', 6638, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7062, N'Beate Vileid', 6638, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7063, N'Lars Peterson', 6646, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7064, N'Petra Winkler', 6647, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7065, N'Martin Bein', 6647, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7066, N'Current User', 6648, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7067, N'Beate Vileid', 6648, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7068, N'Lars Peterson', 6656, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7069, N'Petra Winkler', 6657, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7070, N'Martin Bein', 6657, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7071, N'Current User', 6658, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7072, N'Beate Vileid', 6658, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7073, N'Peter Wilson', 6666, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7074, N'Carlos Diaz', 6666, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7075, N'Sven Petersen', 6666, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7076, N'Callahan Laura', 6671, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7077, N'Dodsworth Anne', 6671, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7078, N'Shelley Burke', 6673, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7079, N'Valle Saavedra', 6674, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7080, N'Regina Murphy', 6674, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7081, N'Mayumi Ohno', 6674, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7082, N'SizePalette', 6674, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7083, N'Peter Wilson', 6675, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7084, N'Carlos Diaz', 6675, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7085, N'Sven Petersen', 6675, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7086, N'Callahan Laura', 6680, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7087, N'Dodsworth Anne', 6680, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7088, N'Shelley Burke', 6682, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7089, N'Valle Saavedra', 6683, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7090, N'Regina Murphy', 6683, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7091, N'Mayumi Ohno', 6683, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7092, N'SizePalette', 6683, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7093, N'Lars Peterson', 6684, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7094, N'Petra Winkler', 6685, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7095, N'Martin Bein', 6685, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7096, N'Current User', 6686, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7097, N'Beate Vileid', 6686, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7098, N'Lars Peterson', 6694, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7099, N'Petra Winkler', 6695, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7100, N'Martin Bein', 6695, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7101, N'Current User', 6696, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7102, N'Beate Vileid', 6696, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7103, N'Lars Peterson', 6704, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7104, N'Petra Winkler', 6705, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7105, N'Martin Bein', 6705, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7106, N'Current User', 6706, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7107, N'Beate Vileid', 6706, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7108, N'Peter Wilson', 6714, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7109, N'Carlos Diaz', 6714, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7110, N'Sven Petersen', 6714, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7111, N'Callahan Laura', 6719, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7112, N'Dodsworth Anne', 6719, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7113, N'Shelley Burke', 6721, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7114, N'Valle Saavedra', 6722, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7115, N'Regina Murphy', 6722, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7116, N'Mayumi Ohno', 6722, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7117, N'SizePalette', 6722, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7118, N'Peter Wilson', 6723, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7119, N'Carlos Diaz', 6723, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7120, N'Sven Petersen', 6723, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7121, N'Callahan Laura', 6728, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7122, N'Dodsworth Anne', 6728, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7123, N'Shelley Burke', 6730, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7124, N'Valle Saavedra', 6731, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7125, N'Regina Murphy', 6731, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7126, N'Mayumi Ohno', 6731, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7127, N'SizePalette', 6731, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7128, N'Peter Wilson', 6732, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7129, N'Carlos Diaz', 6732, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7130, N'Sven Petersen', 6732, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7131, N'Callahan Laura', 6737, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7132, N'Dodsworth Anne', 6737, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7133, N'Shelley Burke', 6739, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7134, N'Valle Saavedra', 6740, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7135, N'Regina Murphy', 6740, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7136, N'Mayumi Ohno', 6740, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7137, N'SizePalette', 6740, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7138, N'Peter Wilson', 6741, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7139, N'Carlos Diaz', 6741, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7140, N'Sven Petersen', 6741, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7141, N'Callahan Laura', 6746, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7142, N'Dodsworth Anne', 6746, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7143, N'Shelley Burke', 6748, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7144, N'Valle Saavedra', 6749, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7145, N'Regina Murphy', 6749, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7146, N'Mayumi Ohno', 6749, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7147, N'SizePalette', 6749, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7148, N'Peter Wilson', 6750, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7149, N'Carlos Diaz', 6750, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7150, N'Sven Petersen', 6750, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7151, N'Callahan Laura', 6755, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7152, N'Dodsworth Anne', 6755, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7153, N'Shelley Burke', 6757, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7154, N'Valle Saavedra', 6758, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7155, N'Regina Murphy', 6758, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7156, N'Mayumi Ohno', 6758, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7157, N'SizePalette', 6758, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7158, N'Leverling Janet', 6759, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7159, N'Fuller Andrew', 6759, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7160, N'Peacock Margaret', 6759, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7161, N'Buchanan Steven', 6759, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7162, N'Suyama Michael', 6759, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7163, N'King Robert', 6759, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7164, N'West Adam', 6759, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7165, N'Charlotte Cooper', 6759, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7166, N'Yoshi Nagase', 6759, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7167, N'Leverling Janet', 6761, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7168, N'Fuller Andrew', 6761, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7169, N'Peacock Margaret', 6761, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7170, N'Buchanan Steven', 6761, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7171, N'Suyama Michael', 6761, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7172, N'King Robert', 6761, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7173, N'West Adam', 6761, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7174, N'Charlotte Cooper', 6761, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7175, N'Yoshi Nagase', 6761, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7176, N'Peter Wilson', 6766, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7177, N'Carlos Diaz', 6766, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7178, N'Sven Petersen', 6766, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7179, N'Callahan Laura', 6771, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7180, N'Dodsworth Anne', 6771, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7181, N'Shelley Burke', 6773, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7182, N'Valle Saavedra', 6774, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7183, N'Regina Murphy', 6774, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7184, N'Mayumi Ohno', 6774, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7185, N'SizePalette', 6774, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7186, N'Peter Wilson', 6775, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7187, N'Carlos Diaz', 6775, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7188, N'Sven Petersen', 6775, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7189, N'Callahan Laura', 6780, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7190, N'Dodsworth Anne', 6780, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7191, N'Shelley Burke', 6782, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7192, N'Valle Saavedra', 6783, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7193, N'Regina Murphy', 6783, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7194, N'Mayumi Ohno', 6783, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7195, N'SizePalette', 6783, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7196, N'Peter Wilson', 6784, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7197, N'Carlos Diaz', 6784, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7198, N'Sven Petersen', 6784, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7199, N'Callahan Laura', 6789, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7200, N'Dodsworth Anne', 6789, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7201, N'Shelley Burke', 6791, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7202, N'Valle Saavedra', 6792, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7203, N'Regina Murphy', 6792, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7204, N'Mayumi Ohno', 6792, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7205, N'SizePalette', 6792, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7206, N'Leverling Janet', 6793, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7207, N'Fuller Andrew', 6793, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7208, N'Peacock Margaret', 6793, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7209, N'Buchanan Steven', 6793, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7210, N'Suyama Michael', 6793, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7211, N'King Robert', 6793, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7212, N'West Adam', 6793, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7213, N'Charlotte Cooper', 6793, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7214, N'Yoshi Nagase', 6793, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7215, N'Leverling Janet', 6795, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7216, N'Fuller Andrew', 6795, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7217, N'Peacock Margaret', 6795, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7218, N'Buchanan Steven', 6795, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7219, N'Suyama Michael', 6795, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7220, N'King Robert', 6795, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7221, N'West Adam', 6795, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7222, N'Charlotte Cooper', 6795, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7223, N'Yoshi Nagase', 6795, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7224, N'Lars Peterson', 6800, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7225, N'Petra Winkler', 6801, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7226, N'Martin Bein', 6801, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7227, N'Current User', 6802, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7228, N'Beate Vileid', 6802, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7229, N'Lars Peterson', 6810, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7230, N'Petra Winkler', 6811, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7231, N'Martin Bein', 6811, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7232, N'Current User', 6812, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7233, N'Beate Vileid', 6812, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7234, N'Lars Peterson', 6820, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7235, N'Petra Winkler', 6821, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7236, N'Martin Bein', 6821, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7237, N'Current User', 6822, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7238, N'Beate Vileid', 6822, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7239, N'Peter Wilson', 6830, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7240, N'Carlos Diaz', 6830, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7241, N'Sven Petersen', 6830, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7242, N'Callahan Laura', 6835, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7243, N'Dodsworth Anne', 6835, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7244, N'Shelley Burke', 6837, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7245, N'Valle Saavedra', 6838, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7246, N'Regina Murphy', 6838, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7247, N'Mayumi Ohno', 6838, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7248, N'SizePalette', 6838, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7249, N'Peter Wilson', 6839, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7250, N'Carlos Diaz', 6839, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7251, N'Sven Petersen', 6839, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7252, N'Callahan Laura', 6844, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7253, N'Dodsworth Anne', 6844, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7254, N'Shelley Burke', 6846, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7255, N'Valle Saavedra', 6847, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7256, N'Regina Murphy', 6847, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7257, N'Mayumi Ohno', 6847, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7258, N'SizePalette', 6847, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7259, N'Lars Peterson', 6848, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7260, N'Petra Winkler', 6849, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7261, N'Martin Bein', 6849, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7262, N'Current User', 6850, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7263, N'Beate Vileid', 6850, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7264, N'Lars Peterson', 6858, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7265, N'Petra Winkler', 6859, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7266, N'Martin Bein', 6859, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7267, N'Current User', 6860, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7268, N'Beate Vileid', 6860, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7269, N'Lars Peterson', 6868, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7270, N'Petra Winkler', 6869, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7271, N'Martin Bein', 6869, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7272, N'Current User', 6870, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7273, N'Beate Vileid', 6870, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7274, N'Peter Wilson', 6878, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7275, N'Carlos Diaz', 6878, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7276, N'Sven Petersen', 6878, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7277, N'Callahan Laura', 6883, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7278, N'Dodsworth Anne', 6883, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7279, N'Shelley Burke', 6885, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7280, N'Valle Saavedra', 6886, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7281, N'Regina Murphy', 6886, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7282, N'Mayumi Ohno', 6886, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7283, N'SizePalette', 6886, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7284, N'Peter Wilson', 6887, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7285, N'Carlos Diaz', 6887, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7286, N'Sven Petersen', 6887, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7287, N'Callahan Laura', 6892, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7288, N'Dodsworth Anne', 6892, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7289, N'Shelley Burke', 6894, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7290, N'Valle Saavedra', 6895, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7291, N'Regina Murphy', 6895, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7292, N'Mayumi Ohno', 6895, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7293, N'SizePalette', 6895, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7294, N'Lars Peterson', 6896, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7295, N'Petra Winkler', 6897, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7296, N'Martin Bein', 6897, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7297, N'Current User', 6898, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7298, N'Beate Vileid', 6898, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7299, N'Lars Peterson', 6906, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7300, N'Petra Winkler', 6907, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7301, N'Martin Bein', 6907, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7302, N'Current User', 6908, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7303, N'Beate Vileid', 6908, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7304, N'Lars Peterson', 6916, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7305, N'Petra Winkler', 6917, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7306, N'Martin Bein', 6917, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7307, N'Current User', 6918, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7308, N'Beate Vileid', 6918, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7309, N'Peter Wilson', 6926, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7310, N'Carlos Diaz', 6926, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7311, N'Sven Petersen', 6926, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7312, N'Callahan Laura', 6931, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7313, N'Dodsworth Anne', 6931, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7314, N'Shelley Burke', 6933, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7315, N'Valle Saavedra', 6934, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7316, N'Regina Murphy', 6934, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7317, N'Mayumi Ohno', 6934, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7318, N'SizePalette', 6934, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7319, N'Peter Wilson', 6935, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7320, N'Carlos Diaz', 6935, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7321, N'Sven Petersen', 6935, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7322, N'Callahan Laura', 6940, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7323, N'Dodsworth Anne', 6940, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7324, N'Shelley Burke', 6942, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7325, N'Valle Saavedra', 6943, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7326, N'Regina Murphy', 6943, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7327, N'Mayumi Ohno', 6943, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7328, N'SizePalette', 6943, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7329, N'Lars Peterson', 6959, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7330, N'Petra Winkler', 6960, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7331, N'Martin Bein', 6960, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7332, N'Current User', 6961, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7333, N'Beate Vileid', 6961, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7334, N'Lars Peterson', 6969, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7335, N'Petra Winkler', 6970, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7336, N'Martin Bein', 6970, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7337, N'Current User', 6971, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7338, N'Beate Vileid', 6971, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7339, N'Peter Wilson', 6994, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7340, N'Carlos Diaz', 6994, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7341, N'Sven Petersen', 6994, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7342, N'Callahan Laura', 6999, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7343, N'Dodsworth Anne', 6999, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7344, N'Shelley Burke', 7001, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7345, N'Valle Saavedra', 7002, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7346, N'Regina Murphy', 7002, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7347, N'Mayumi Ohno', 7002, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7348, N'SizePalette', 7002, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7349, N'Peter Wilson', 7003, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7350, N'Carlos Diaz', 7003, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7351, N'Sven Petersen', 7003, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7352, N'Callahan Laura', 7008, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7353, N'Dodsworth Anne', 7008, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7354, N'Shelley Burke', 7010, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7355, N'Valle Saavedra', 7011, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7356, N'Regina Murphy', 7011, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7357, N'Mayumi Ohno', 7011, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7358, N'SizePalette', 7011, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7359, N'Peter Wilson', 7012, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7360, N'Carlos Diaz', 7012, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7361, N'Sven Petersen', 7012, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7362, N'Callahan Laura', 7017, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7363, N'Dodsworth Anne', 7017, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7364, N'Shelley Burke', 7019, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7365, N'Valle Saavedra', 7020, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7366, N'Regina Murphy', 7020, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7367, N'Mayumi Ohno', 7020, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7368, N'SizePalette', 7020, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7369, N'Leverling Janet', 7021, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7370, N'Fuller Andrew', 7021, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7371, N'Peacock Margaret', 7021, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7372, N'Buchanan Steven', 7021, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7373, N'Suyama Michael', 7021, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7374, N'King Robert', 7021, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7375, N'West Adam', 7021, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7376, N'Charlotte Cooper', 7021, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7377, N'Yoshi Nagase', 7021, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7378, N'Leverling Janet', 7023, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7379, N'Fuller Andrew', 7023, N'Linear Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7380, N'Peacock Margaret', 7023, N'CEO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7381, N'Buchanan Steven', 7023, N'Head of direction', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7382, N'Suyama Michael', 7023, N'Senior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7383, N'King Robert', 7023, N'Senior Sales Manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7384, N'West Adam', 7023, N'CTO', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7385, N'Charlotte Cooper', 7023, N'Senior Trader', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7386, N'Yoshi Nagase', 7023, N'Head of laboratory', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7387, N'Lars Peterson', 7038, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7388, N'Petra Winkler', 7039, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7389, N'Martin Bein', 7039, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7390, N'Current User', 7040, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7391, N'Beate Vileid', 7040, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7392, N'Lars Peterson', 7048, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7393, N'Petra Winkler', 7049, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7394, N'Martin Bein', 7049, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7395, N'Current User', 7050, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7396, N'Beate Vileid', 7050, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7397, N'Lars Peterson', 7073, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7398, N'Petra Winkler', 7074, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7399, N'Martin Bein', 7074, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7400, N'Current User', 7075, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7401, N'Beate Vileid', 7075, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7402, N'Lars Peterson', 7083, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7403, N'Petra Winkler', 7084, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7404, N'Martin Bein', 7084, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7405, N'Current User', 7085, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7406, N'Beate Vileid', 7085, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7407, N'Lars Peterson', 7108, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7408, N'Petra Winkler', 7109, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7409, N'Martin Bein', 7109, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7410, N'Current User', 7110, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7411, N'Beate Vileid', 7110, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7412, N'Lars Peterson', 7118, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7413, N'Petra Winkler', 7119, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7414, N'Martin Bein', 7119, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7415, N'Current User', 7120, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7416, N'Beate Vileid', 7120, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7417, N'Lars Peterson', 7128, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7418, N'Petra Winkler', 7129, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7419, N'Martin Bein', 7129, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7420, N'Current User', 7130, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7421, N'Beate Vileid', 7130, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7422, N'Lars Peterson', 7138, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7423, N'Petra Winkler', 7139, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7424, N'Martin Bein', 7139, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7425, N'Current User', 7140, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7426, N'Beate Vileid', 7140, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7427, N'Lars Peterson', 7148, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7428, N'Petra Winkler', 7149, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7429, N'Martin Bein', 7149, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7430, N'Current User', 7150, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7431, N'Beate Vileid', 7150, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7432, N'Peter Wilson', 7158, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7433, N'Carlos Diaz', 7158, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7434, N'Sven Petersen', 7158, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7435, N'Callahan Laura', 7163, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7436, N'Dodsworth Anne', 7163, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7437, N'Shelley Burke', 7165, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7438, N'Valle Saavedra', 7166, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7439, N'Regina Murphy', 7166, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7440, N'Mayumi Ohno', 7166, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7441, N'SizePalette', 7166, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7442, N'Peter Wilson', 7167, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7443, N'Carlos Diaz', 7167, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7444, N'Sven Petersen', 7167, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7445, N'Callahan Laura', 7172, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7446, N'Dodsworth Anne', 7172, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7447, N'Shelley Burke', 7174, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7448, N'Valle Saavedra', 7175, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7449, N'Regina Murphy', 7175, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7450, N'Mayumi Ohno', 7175, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7451, N'SizePalette', 7175, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7452, N'Lars Peterson', 7176, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7453, N'Petra Winkler', 7177, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7454, N'Martin Bein', 7177, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7455, N'Current User', 7178, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7456, N'Beate Vileid', 7178, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7457, N'Lars Peterson', 7186, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7458, N'Petra Winkler', 7187, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7459, N'Martin Bein', 7187, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7460, N'Current User', 7188, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7461, N'Beate Vileid', 7188, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7462, N'Lars Peterson', 7196, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7463, N'Petra Winkler', 7197, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7464, N'Martin Bein', 7197, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7465, N'Current User', 7198, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7466, N'Beate Vileid', 7198, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7467, N'Peter Wilson', 7206, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7468, N'Carlos Diaz', 7206, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7469, N'Sven Petersen', 7206, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7470, N'Callahan Laura', 7211, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7471, N'Dodsworth Anne', 7211, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7472, N'Shelley Burke', 7213, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7473, N'Valle Saavedra', 7214, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7474, N'Regina Murphy', 7214, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7475, N'Mayumi Ohno', 7214, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7476, N'SizePalette', 7214, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7477, N'Peter Wilson', 7215, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7478, N'Carlos Diaz', 7215, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7479, N'Sven Petersen', 7215, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7480, N'Callahan Laura', 7220, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7481, N'Dodsworth Anne', 7220, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7482, N'Shelley Burke', 7222, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7483, N'Valle Saavedra', 7223, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7484, N'Regina Murphy', 7223, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7485, N'Mayumi Ohno', 7223, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7486, N'SizePalette', 7223, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7487, N'Lars Peterson', 7239, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7488, N'Petra Winkler', 7240, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7489, N'Martin Bein', 7240, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7490, N'Current User', 7241, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7491, N'Beate Vileid', 7241, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7492, N'Lars Peterson', 7249, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7493, N'Petra Winkler', 7250, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7494, N'Martin Bein', 7250, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7495, N'Current User', 7251, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7496, N'Beate Vileid', 7251, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7497, N'Lars Peterson', 7274, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7498, N'Petra Winkler', 7275, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7499, N'Martin Bein', 7275, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7500, N'Current User', 7276, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7501, N'Beate Vileid', 7276, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7502, N'Lars Peterson', 7284, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7503, N'Petra Winkler', 7285, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7504, N'Martin Bein', 7285, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7505, N'Current User', 7286, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7506, N'Beate Vileid', 7286, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7507, N'Lars Peterson', 7309, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7508, N'Petra Winkler', 7310, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7509, N'Martin Bein', 7310, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7510, N'Current User', 7311, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7511, N'Beate Vileid', 7311, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7512, N'Lars Peterson', 7319, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7513, N'Petra Winkler', 7320, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7514, N'Martin Bein', 7320, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7515, N'Current User', 7321, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7516, N'Beate Vileid', 7321, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7517, N'Lars Peterson', 7339, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7518, N'Petra Winkler', 7340, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7519, N'Martin Bein', 7340, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7520, N'Current User', 7341, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7521, N'Beate Vileid', 7341, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7522, N'Lars Peterson', 7349, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7523, N'Petra Winkler', 7350, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7524, N'Martin Bein', 7350, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7525, N'Current User', 7351, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7526, N'Beate Vileid', 7351, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7527, N'Lars Peterson', 7359, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7528, N'Petra Winkler', 7360, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7529, N'Martin Bein', 7360, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7530, N'Current User', 7361, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7531, N'Beate Vileid', 7361, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7532, N'Peter Wilson', 7369, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7533, N'Carlos Diaz', 7369, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7534, N'Sven Petersen', 7369, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7535, N'Callahan Laura', 7374, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7536, N'Dodsworth Anne', 7374, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7537, N'Shelley Burke', 7376, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7538, N'Valle Saavedra', 7377, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7539, N'Regina Murphy', 7377, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7540, N'Mayumi Ohno', 7377, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7541, N'SizePalette', 7377, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7542, N'Peter Wilson', 7378, N'Head of channels', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7543, N'Carlos Diaz', 7378, N'Senior Android Devel', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7544, N'Sven Petersen', 7378, N'Senior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7545, N'Callahan Laura', 7383, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7546, N'Dodsworth Anne', 7383, N'Junior sales manager', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7547, N'Shelley Burke', 7385, N'Intern', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7548, N'Valle Saavedra', 7386, N'Junior Inovator', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7549, N'Regina Murphy', 7386, N'Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7550, N'Mayumi Ohno', 7386, N'Senior developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7551, N'SizePalette', 7386, N'System analyst', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7552, N'Lars Peterson', 7432, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7553, N'Petra Winkler', 7433, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7554, N'Martin Bein', 7433, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7555, N'Current User', 7434, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7556, N'Beate Vileid', 7434, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7557, N'Lars Peterson', 7442, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7558, N'Petra Winkler', 7443, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7559, N'Martin Bein', 7443, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7560, N'Current User', 7444, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7561, N'Beate Vileid', 7444, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7562, N'Lars Peterson', 7467, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7563, N'Petra Winkler', 7468, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7564, N'Martin Bein', 7468, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7565, N'Current User', 7469, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7566, N'Beate Vileid', 7469, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7567, N'Lars Peterson', 7477, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7568, N'Petra Winkler', 7478, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7569, N'Martin Bein', 7478, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7570, N'Current User', 7479, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7571, N'Beate Vileid', 7479, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7572, N'Lars Peterson', 7532, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7573, N'Petra Winkler', 7533, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7574, N'Martin Bein', 7533, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7575, N'Current User', 7534, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7576, N'Beate Vileid', 7534, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7577, N'Lars Peterson', 7542, N'Anakyst Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7578, N'Petra Winkler', 7543, N'Android Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7579, N'Martin Bein', 7543, N'Ios Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7580, N'Current User', 7544, N'Web Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
INSERT [dbo].[JSONTable] ([id], [name], [parentId], [positionName], [imageUrl]) VALUES (7581, N'Beate Vileid', 7544, N'Junior Developer', N'https://raw.githubusercontent.com/bumbeishvili/Ass')
GO
SET IDENTITY_INSERT [dbo].[Modules] ON 
GO
INSERT [dbo].[Modules] ([moduleID], [moduleName], [isActive], [parentModuleID]) VALUES (1, N'Employee', 1, NULL)
GO
INSERT [dbo].[Modules] ([moduleID], [moduleName], [isActive], [parentModuleID]) VALUES (2, N'Department', 1, NULL)
GO
INSERT [dbo].[Modules] ([moduleID], [moduleName], [isActive], [parentModuleID]) VALUES (3, N'Users', 1, NULL)
GO
INSERT [dbo].[Modules] ([moduleID], [moduleName], [isActive], [parentModuleID]) VALUES (4, N'Pagination-Demo', 1, NULL)
GO
INSERT [dbo].[Modules] ([moduleID], [moduleName], [isActive], [parentModuleID]) VALUES (5, N'dynamic-todo-list', 1, NULL)
GO
INSERT [dbo].[Modules] ([moduleID], [moduleName], [isActive], [parentModuleID]) VALUES (6, N'Services', 1, NULL)
GO
INSERT [dbo].[Modules] ([moduleID], [moduleName], [isActive], [parentModuleID]) VALUES (7, N'Join a meeting', 1, 6)
GO
INSERT [dbo].[Modules] ([moduleID], [moduleName], [isActive], [parentModuleID]) VALUES (8, N'Create a meeting', 1, 6)
GO
INSERT [dbo].[Modules] ([moduleID], [moduleName], [isActive], [parentModuleID]) VALUES (9, N'View Report', 1, 6)
GO
INSERT [dbo].[Modules] ([moduleID], [moduleName], [isActive], [parentModuleID]) VALUES (10, N'Manage community', 1, 6)
GO
INSERT [dbo].[Modules] ([moduleID], [moduleName], [isActive], [parentModuleID]) VALUES (11, N'Org-chart', 1, NULL)
GO
INSERT [dbo].[Modules] ([moduleID], [moduleName], [isActive], [parentModuleID]) VALUES (12, N'image-gallery', 1, NULL)
GO
INSERT [dbo].[Modules] ([moduleID], [moduleName], [isActive], [parentModuleID]) VALUES (13, N'dynamic-forms', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Modules] OFF
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (1, 1, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (2, 2, 1, 1, 1, 1, 1)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (3, 3, 1, 1, 1, 1, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (4, 1, 2, 1, 1, 1, 1)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (5, 2, 2, 1, 1, 1, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (6, 3, 2, 1, 1, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (7, 1, 3, 1, 1, 1, 1)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (8, 2, 3, 0, 0, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (9, 3, 3, 0, 0, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (10, 1, 4, 1, 1, 1, 1)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (11, 2, 4, 1, 1, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (12, 3, 4, 0, 0, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (13, 1, 5, 1, 1, 1, 1)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (14, 2, 5, 1, 1, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (15, 3, 5, 0, 0, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (16, 1, 6, 1, 1, 1, 1)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (17, 2, 6, 1, 1, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (18, 3, 6, 0, 0, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (19, 1, 7, 1, 1, 1, 1)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (20, 2, 7, 1, 1, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (21, 3, 7, 1, 0, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (22, 1, 8, 1, 1, 1, 1)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (23, 2, 8, 1, 1, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (24, 3, 8, 1, 0, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (25, 1, 9, 1, 1, 1, 1)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (26, 2, 9, 0, 0, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (27, 3, 9, 1, 0, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (28, 1, 10, 1, 1, 1, 1)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (29, 2, 10, 1, 1, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (30, 3, 10, 0, 0, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (31, 1, 11, 1, 1, 1, 1)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (32, 2, 11, 1, 1, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (33, 3, 11, 1, 0, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (172101, 1, 12, 1, 1, 1, 1)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (172102, 2, 12, 1, 0, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (172103, 3, 12, 0, 0, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (172104, 1, 13, 1, 1, 1, 1)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (172105, 2, 13, 0, 0, 0, 0)
GO
INSERT [dbo].[Permissions] ([permissionID], [userID], [moduleID], [calView], [canAdd], [canUpdate], [canDelete]) VALUES (172106, 3, 13, 0, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (1, N'Product1', 200, CAST(N'2022-11-08' AS Date), N'Ahmedabad', N'ABC-001', N'Test', N'Test', N'This is Product Description', 5, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (2, N'Product2', 400, CAST(N'2022-11-09' AS Date), N'Ahmedabad', N'ABC-002', N'Test', N'Test', N'This is Product Description', 10, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (3, N'Product3', 600, CAST(N'2022-11-10' AS Date), N'Ahmedabad', N'ABC-003', N'Test', N'Test', N'This is Product Description', 15, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (4, N'Product4', 800, CAST(N'2022-11-11' AS Date), N'Ahmedabad', N'ABC-004', N'Test', N'Test', N'This is Product Description', 20, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (5, N'Product5', 1000, CAST(N'2022-11-12' AS Date), N'Ahmedabad', N'ABC-005', N'Test', N'Test', N'This is Product Description', 2500, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (6, N'Product6', 1200, CAST(N'2022-11-13' AS Date), N'Ahmedabad', N'ABC-006', N'Test', N'Test', N'This is Product Description', 30, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (7, N'Product7', 1400, CAST(N'2022-11-14' AS Date), N'Ahmedabad', N'ABC-007', N'Test', N'Test', N'This is Product Description', 35, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (8, N'Product8', 1600, CAST(N'2022-11-15' AS Date), N'Ahmedabad', N'ABC-008', N'Test', N'Test', N'This is Product Description', 40, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (9, N'Product9', 1800, CAST(N'2022-11-16' AS Date), N'Ahmedabad', N'ABC-009', N'Test', N'Test', N'This is Product Description', 45, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (10, N'Product10', 2000, CAST(N'2022-11-17' AS Date), N'Ahmedabad', N'ABC-0010', N'Test', N'Test', N'This is Product Description', 50, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (11, N'Product11', 2200, CAST(N'2022-11-18' AS Date), N'Ahmedabad', N'ABC-0011', N'Test', N'Test', N'This is Product Description', 55, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (12, N'Product12', 2400, CAST(N'2022-11-19' AS Date), N'Ahmedabad', N'ABC-0012', N'Test', N'Test', N'This is Product Description', 60, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (13, N'Product13', 2600, CAST(N'2022-11-20' AS Date), N'Ahmedabad', N'ABC-0013', N'Test', N'Test', N'This is Product Description', 65, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (14, N'Product14', 2800, CAST(N'2022-11-21' AS Date), N'Ahmedabad', N'ABC-0014', N'Test', N'Test', N'This is Product Description', 70, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (15, N'Product15', 3000, CAST(N'2022-11-22' AS Date), N'Ahmedabad', N'ABC-0015', N'Test', N'Test', N'This is Product Description', 75, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (16, N'Product16', 3200, CAST(N'2022-11-23' AS Date), N'Ahmedabad', N'ABC-0016', N'Test', N'Test', N'This is Product Description', 80, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (17, N'Product17', 3400, CAST(N'2022-11-24' AS Date), N'Ahmedabad', N'ABC-0017', N'Test', N'Test', N'This is Product Description', 85, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (18, N'Product18', 3600, CAST(N'2022-11-25' AS Date), N'Ahmedabad', N'ABC-0018', N'Test', N'Test', N'This is Product Description', 90, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (19, N'Product19', 3800, CAST(N'2022-11-26' AS Date), N'Ahmedabad', N'ABC-0019', N'Test', N'Test', N'This is Product Description', 95, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (20, N'Product20', 4000, CAST(N'2022-11-27' AS Date), N'Ahmedabad', N'ABC-0020', N'Test', N'Test', N'This is Product Description', 100, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (21, N'Product21', 4200, CAST(N'2022-11-28' AS Date), N'Ahmedabad', N'ABC-0021', N'Test', N'Test', N'This is Product Description', 105, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (22, N'Product22', 4400, CAST(N'2022-11-29' AS Date), N'Ahmedabad', N'ABC-0022', N'Test', N'Test', N'This is Product Description', 110, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (23, N'Product23', 4600, CAST(N'2022-11-30' AS Date), N'Ahmedabad', N'ABC-0023', N'Test', N'Test', N'This is Product Description', 115, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (24, N'Product24', 4800, CAST(N'2022-12-01' AS Date), N'Ahmedabad', N'ABC-0024', N'Test', N'Test', N'This is Product Description', 120, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (25, N'Product25', 5000, CAST(N'2022-12-02' AS Date), N'Ahmedabad', N'ABC-0025', N'Test', N'Test', N'This is Product Description', 125, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (26, N'Product26', 5200, CAST(N'2022-12-03' AS Date), N'Ahmedabad', N'ABC-0026', N'Test', N'Test', N'This is Product Description', 130, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (27, N'Product27', 5400, CAST(N'2022-12-04' AS Date), N'Ahmedabad', N'ABC-0027', N'Test', N'Test', N'This is Product Description', 135, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (28, N'Product28', 5600, CAST(N'2022-12-05' AS Date), N'Ahmedabad', N'ABC-0028', N'Test', N'Test', N'This is Product Description', 140, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (29, N'Product29', 5800, CAST(N'2022-12-06' AS Date), N'Ahmedabad', N'ABC-0029', N'Test', N'Test', N'This is Product Description', 145, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (30, N'Product30', 6000, CAST(N'2022-12-07' AS Date), N'Ahmedabad', N'ABC-0030', N'Test', N'Test', N'This is Product Description', 150, N'Radix')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (31, N'Product31', 6200, CAST(N'2022-12-08' AS Date), N'Rajkot', N'ABC-0031', N'Test', N'Test', N'This is Product Description', 155, N'Radix2')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (32, N'Product32', 6400, CAST(N'2022-12-09' AS Date), N'Rajkot', N'ABC-0032', N'Test', N'Test', N'This is Product Description', 160, N'Radix2')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (33, N'Product33', 6600, CAST(N'2022-12-10' AS Date), N'Rajkot', N'ABC-0033', N'Test', N'Test', N'This is Product Description', 165, N'Radix2')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (34, N'Product34', 6800, CAST(N'2022-12-11' AS Date), N'Rajkot', N'ABC-0034', N'Test', N'Test', N'This is Product Description', 170, N'Radix2')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (35, N'Product35', 7000, CAST(N'2022-12-12' AS Date), N'Rajkot', N'ABC-0035', N'Test', N'Test', N'This is Product Description', 175, N'Radix2')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (36, N'Product36', 7200, CAST(N'2022-12-13' AS Date), N'Rajkot', N'ABC-0036', N'Test', N'Test', N'This is Product Description', 180, N'Radix2')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (37, N'Product37', 7400, CAST(N'2022-12-14' AS Date), N'Rajkot', N'ABC-0037', N'Test', N'Test', N'This is Product Description', 185, N'Radix2')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (38, N'Product38', 7600, CAST(N'2022-12-15' AS Date), N'Rajkot', N'ABC-0038', N'Test', N'Test', N'This is Product Description', 190, N'Radix2')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (39, N'Product39', 7800, CAST(N'2022-12-16' AS Date), N'Rajkot', N'ABC-0039', N'Test', N'Test', N'This is Product Description', 195, N'Radix2')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (40, N'Product40', 8000, CAST(N'2022-12-17' AS Date), N'Rajkot', N'ABC-0040', N'Test', N'Test', N'This is Product Description', 200, N'Radix2')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (42, N'Product42', 8400, CAST(N'2022-12-19' AS Date), N'Rajkot', N'ABC-0042', N'Test', N'Test', N'This is Product Description', 210, N'Radix2')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (43, N'Product43', 8600, CAST(N'2022-12-20' AS Date), N'Rajkot', N'ABC-0043', N'Test', N'Test', N'This is Product Description', 215, N'Radix2')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (44, N'Product44', 8800, CAST(N'2022-12-21' AS Date), N'Rajkot', N'ABC-0044', N'Test', N'Test', N'This is Product Description', 220, N'Radix2')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (45, N'Product45', 9000, CAST(N'2022-12-22' AS Date), N'Rajkot', N'ABC-0045', N'Test', N'Test', N'This is Product Description', 225, N'Radix2')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (46, N'Product46', 9200, CAST(N'2022-12-23' AS Date), N'Rajkot', N'ABC-0046', N'Test', N'Test', N'This is Product Description', 230, N'Radix2')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (47, N'Product47', 9400, CAST(N'2022-12-24' AS Date), N'Rajkot', N'ABC-0047', N'Test', N'Test', N'This is Product Description', 235, N'Radix2')
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [Price], [MafDate], [MafAt], [SKU], [CategoryName], [SubCategoryName], [Description], [Quantity], [Supplier]) VALUES (48, N'Product48', 9600, CAST(N'2022-12-25' AS Date), N'Rajkot', N'ABC-0048', N'Test', N'Test', N'This is Product Description', 240, N'Radix2')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([roleID], [rollName]) VALUES (1, N'Basic')
GO
INSERT [dbo].[Roles] ([roleID], [rollName]) VALUES (2, N'Admin')
GO
INSERT [dbo].[Roles] ([roleID], [rollName]) VALUES (3, N'SuperAdmin')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1, N'Dharmesh Acharya', N'da@radixweb.com', NULL, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (468, N'Yogesh Chandubhai Dudhat', N'yogeshc.dudhat@radixweb.com', 27464, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (474, N'Pragnesh Arvindbhai Suthar', N'pragnesh.suthar@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (489, N'Devangi Kanubhai  Prajapati', N'devangi.prajapati@radixweb.com', 593, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (501, N'Faisaluddin Shamsuddin Saiyed', N'Faisaluddin.Saiyed@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (514, N'Rushil Jagdishbhai Prajapati', N'rushil.prajapati@radixweb.com', 501, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (547, N'Dineshsingh Kishansingh Pal', N'dineshsingh.pal@radixweb.com', 1049, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (551, N'Dhwanil Ajaykumar Upadhyay', N'dhwanil.upadhyay@radixweb.com', 957, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (555, N'Ruchi Jagdishbhai Patel', N'ruchi.patel@radixweb.com', 957, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (559, N'Jinal Manubhai Patel', N'jinal.patel@radixweb.com', 957, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (577, N'Amit Sanatkumar Bhavsar', N'amit.bhavsar@radixweb.com', 845, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (578, N'Raj Jyotindra Mehta', N'raj.mehta@radixweb.com', 16008, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (593, N'Prachi Sanjaybhai  Palkhiwala', N'prachi.palkhiwala@radixweb.com', 1220, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (612, N'Bharat Mahendrabhai Chudasama', N'Bharat.Chudasama@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (638, N'Abhaya Simha Venugopal', N'Abhaya.Venugopal@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (654, N'Purva Manojkumar Sanghvi', N'purva.sanghvi@radixweb.com', 849, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (659, N'Mounil Tushar Shah', N'mounil.shah@radixweb.com', 1220, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (660, N'Himani Sharadkumar Doshi', N'himani.doshi@radixweb.com', 1049, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (667, N'Chintan Ramanlal Joshi', N'Chintan.Ramanlal@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (671, N'Chirag Keshubhai Patel', N'bhavin.rathod@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (715, N'Dipmala Nikul Chavda', N'dipmala.chudasama@radixweb.com', 770, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (718, N'Mohammed Husaini  Mansawala', N'mohammed.mansawala@radixweb.com', 1090, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (720, N'Dipak Govindlal Parekh', N'Dipak.Parekh@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (741, N'Jaimin Vinodkumar Galiya', N'jaimin.galiya@radixweb.com', 1220, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (770, N'Jigisha Dilip Variya', N'Jigisha.Variya@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (772, N'Maitri Ajaykumar Parikh', N'Maitri.Ajaykumar@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (779, N'Nipam Raseshbhai Chokshi', N'nipam.chokshi@radixweb.com', 955, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (788, N'Divyesh Girdhar Ladva', N'divyesh.ladva@radixweb.com', 555, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (845, N'Maulik Praveenbhai Shah', N'Maulik.Shah@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (849, N'Bhaumik Ishwarlal Khatri', N'bhaumik.khatri@radixweb.com', 957, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (852, N'Pratik Mahendrabhai Vora', N'pratik.vora@radixweb.com', 638, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (877, N'Uday Nanubhai Parmar', N'uday.parmar@radixweb.com', 671, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (883, N'Atri Kamleshbhai Kansara', N'Atri.Kansara@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (891, N'Jitendra Jailal Prasad', N'jitendra.prasad@radixweb.com', 720, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (896, N'Vidisha Rameshbhai Narodia', N'Vidisha.Rameshbhai@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (927, N'Tarjani Milind Pandya', N'tarjani.pandya@radixweb.com', 555, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (933, N'Zeel Kalpesh Desai', N'zeel.desai@radixweb.com', 671, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (955, N'Ankit Harshadbhai Gandhi', N'vinit.kariatukaran@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (957, N'Anand Markandray Trivedi', N'anand.trivedi@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (983, N'Salomi Jaykarbhai Christi', N'Salomi.Christi@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1019, N'Ekta Raj Mehta', N'ekta.makawana@radixweb.com', 1202, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1049, N'Saiyam Kanaiyalal Patel', N'Saiyam.Patel@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1077, N'Dharmendra Gambhirsinh Solanki', N'Dharmendra.Solanki@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1078, N'Manisha Nrupesh Shah', N'manisha.shah@radixweb.com', 1096, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1082, N'Rahul Mahendrabhai Thacker', N'rahul.thacker@radixweb.com', 1096, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1090, N'Prashant Ashwanikumar Parihar', N'Prashant.Parihar@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1095, N'Vishal Kamleshbhai Siddhpara', N'vishal.siddhpara@radixweb.com', 720, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1096, N'Naresh Keshavbhai Devra', N'naresh@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1108, N'Vijaysingh Sundarsingh Gujar', N'vijaysingh.gujar@radixweb.com', 1146, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1120, N'Rachit Harish Vora', N'rachit.vora@radixweb.com', 957, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1127, N'Ajay Rameshchandra Ojha', N'Ajay.Ojha@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1143, N'Hiral Dineshkumar Darji', N'hiral.darji@radixweb.com', 779, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1146, N'Hardik Bharatbhai Patel', N'Hardik.Patel@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1202, N'Jiten Sharadkumar Bhavsar', N'Jiten.Bhavsar@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1220, N'Vinit Valson Kariatukaran', N'vinit.kariatukaran@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1221, N'Jaivik Rajubhai Brahmbhatt', N'jaivik.brahmbhatt@radixweb.com', 654, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1226, N'Ravindra Jayantilal Thakkar', N'ravindra.thakkar@radixweb.com', 849, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1251, N'Anil Mathurbhai Godhani', N'Anil.Godhani@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1283, N'Pinakin Harishbhai Garvad', N'pinakin.garvad@radixweb.com', 1202, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1287, N'Priya Haribhai  Jatakiya', N'priya.jatakiya@radixweb.com', 770, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1289, N'Lakhamaram Virkaji Prajapati', N'lakhamaram.prajapati@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1326, N'Siddhi Jitendrabhai Desai', N'siddhi.desai@radixweb.com', 1096, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (1344, N'Vivek Arvindbhai Chavda', N'vivek.chavda@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (9099, N'TESTEMP', N'T@T.COM', 38475, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (14690, N'Dipika Mohan Rawat', N'dipika.rawat@radixweb.com', 37771, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (14803, N'Nikunj Babubhai Makwana', N'nikunj.makwana@radixweb.com', 612, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (14813, N'Niketa Jagdishbhai Parekh', N'niketa.parekh@radixweb.com', 957, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (14820, N'Himanshu Jayanti Lal Joshi', N'himanshu.joshi@radixweb.com', 37771, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (15920, N'Shlesha Ajaybhai Jawanjal', N'shlesha.bharne@radixweb.com', 849, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (16008, N'Himanshu Kishorbhai Bhardiya', N'himanshu.bhardiya@radixweb.com', 1096, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (16028, N'Hiteshkumar Arvindbhai Thakor', N'hitesh.thakor@radixweb.com', 1127, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (16050, N'Rushi Bharatbhai Mehta', N'rushi.mehta@radixweb.com', 845, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (16126, N'Bhadreshkumar Vijay Panchal', N'bhadresh.panchal@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (16304, N'Pradip Rajeshbhai Ahuja', N'pradip.ahuja@radixweb.com', 1077, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (17972, N'Gajendrakumar Rameshbhai Patel', N'gajendra.patel@radixweb.com', 501, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (18019, N'Hina Architkumar Patel', N'hina.patel@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (19023, N'Dhwani Ashishbhai Nandi', N'dhwani.nandi@radixweb.com', 849, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (21700, N'Ravina Rajnikant Panchal', N'ravina.panchal@radixweb.com', 593, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (22033, N'Navik Jayantibhai Tarsariya', N'navik.tarsariya@radixweb.com', 14813, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (24163, N'Devansh Anil Nigam', N'devansh.nigam@radixweb.com', 883, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (24165, N'Kartavya Rajeshkumar Desai', N'kartavya.desai@radixweb.com', 501, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (25302, N'Binal Mahendrakumar Solanki', N'binal.solanki@radixweb.com', 1251, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (25480, N'Pooja Rajubhai Gohel', N'pooja.gohel@radixweb.com', 660, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (25482, N'Jay Harishkumar  Panjwani', N'jay.panjwani@radixweb.com', 779, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (25592, N'Dhaval Bharatkumar Dave', N'dhavalb.dave@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (26778, N'Manish Yogeshbhai Bhadiyadra', N'manish.bhadiyadra@radixweb.com', 983, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (26827, N'Vrujesh Maheshkumar Modi', N'vrujesh.modi@radixweb.com', 489, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (27087, N'Mayur Rasikbhai  Vanza', N'mayurr.vanza@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (27275, N'Harshit  Chauhan', N'harshit.chauhan@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (27277, N'Parth  Sadatiya', N'parth.sadatiya@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (27464, N'Rahul   Shrimali', N'rahul.shrimali@radixweb.com', 1220, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28156, N'Hardik  Rasikbhai Suthar', N'hardik.suthar@radixweb.com', 957, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28203, N'Nirali  Desai', N'nirali.desai@radixweb.com', 38645, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28238, N'Shivpratap   Chauhan', N'shivpratap.chauhan@radixweb.com', 1090, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28289, N'Gaurav Mahendrabhai Katudiya', N'gaurav.katudiya@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28399, N'Sonal  Dahyabhai Mali', N'sonal.mali@radixweb.com', 1090, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28420, N'Pratik Kamlesh  Jain', N'pratikk.jain@radixweb.com', 1251, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28424, N'Chetan Prakash  Abhaykant Jha', N'chetanprakash.jha@radixweb.com', 24163, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28471, N'Akanksha  Ajay Sharma', N'akanksha.sharma@radixweb.com', 957, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28473, N'Kunal Pratap  Brijesh Singh', N'kunalpratap.singh@radixweb.com', 28289, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28475, N'Mufiz  Gulammustufa Qureshi', N'mufiz.qureshi@radixweb.com', 720, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28485, N'Deepansh  Kuldeep Agrawal', N'deepansh.agrawal@radixweb.com', 1090, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28491, N'Saurabh  Balram Chaurasiya', N'saurabh.chaurasiya@radixweb.com', 1344, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28503, N'Rutvika  Radheshyam Yadav', N'rutvika.yadav@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28505, N'Afzal  Harunbhai Mansuri', N'afzal.mansuri@radixweb.com', 1251, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28511, N'Akashkumar  Nalinkumar Rupareliya', N'akash.rupareliya@radixweb.com', 849, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28513, N'Dipti  Paragbhai Solanki', N'dipti.solanki@radixweb.com', 772, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28515, N'Manish  Jagdishbhai Parmar', N'manish.parmar@radixweb.com', 1095, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28517, N'Shivani  Hemantkumar Chaudhari', N'shivani.chaudhari@radixweb.com', 1251, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28521, N'Yogesh  Bhupatbhai Bhojani', N'Yogesh.bhojani@radixweb.com', 14813, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28523, N'Jaymin  Maheshbhai Trivedi', N'jaymin.trivedi@radixweb.com', 22033, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28527, N'Heer  Abhay Vaishnav', N'heer.vaishnav@radixweb.com', 555, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28544, N'Darshil  Kaushalkumar Kansara', N'darshil.kansara@radixweb.com', 1127, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28546, N'Divya  Dineshbhai Parmar', N'divya.parmar@radixweb.com', 24163, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28550, N'Taher  Saifee Dahodwala', N'taher.dahodwala@radixweb.com', 1077, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28554, N'Rajkumar Harshadkumar Sathawara', N'rajkumar.sathvara@radixweb.com', 612, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28556, N'Mitul  Vinubhai Avaiya', N'mitul.avaiya@radixweb.com', 578, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28558, N'Dixit  Satishbhai Patel', N'dixit.patel@radixweb.com', 1287, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28560, N'Tushar  Pooran Singh Mathuria', N'tushar.maturia@radixweb.com', 1019, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28562, N'Dhananjay  Indravadan  Choksi', N'dhananjay.choksi@radixweb.com', 24165, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28564, N'Ayushi  Rajeev  Joshi', N'ayushi.joshi@radixweb.com', 16126, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28566, N'Devi  Khimabhai Odedara', N'devi.odedra@radixweb.com', 16126, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28570, N'Ayushi  Pravin Chavda', N'ayushi.chavda@radixweb.com', 16008, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28574, N'Sandip  Vinaykumar Chauhan', N'sandipv.chauhan@radixweb.com', 37353, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28576, N'Bhagyashriba  Ghanshyamsinh Jadeja', N'bhagyashriba.jadeja@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28578, N'Sagar  Mukeshbhai Donga', N'sagar.donga@radixweb.com', 720, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28580, N'Bhaveshkumar  Rameshchandra Prajapati', N'bhavesh.prajapati@radixweb.com', 1077, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28582, N'Krishna  Nainesh Makwana', N'krishna.makwana@radixweb.com', 28702, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28586, N'Shubham  Sanjaybhai Parmar', N'shubham.parmar@radixweb.com', 1078, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28588, N'Ayushi  Manoj Tiwari', N'ayushi.tiwari@radixweb.com', 29685, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28595, N'Urvesh  Ghanshyambhai Barot', N'urvesh.barot@radixweb.com', 24165, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28678, N'Rita  Dahyabhai Chavda', N'rita.chavada@radixweb.com', 28702, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28702, N'Varsha  Rahul Oberoi', N'varsha.oberoi@radixweb.com', 1127, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28713, N'Divya  Mukeshbhai Melvani', N'divyam.melvani@radixweb.com', 1049, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28966, N'Chirag  Rasikbhai Patel', N'chiragrb.patel@radixweb.com', 772, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (28974, N'Ekta  Bharat Patel', N'ektab.patel@radixweb.com', 27087, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29057, N'Vinay Nandlal  Kapoor', N'vinay.kapoor@radixweb.com', 1082, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29218, N'Sonalika  Dipak Patel', N'sonalika.patel@radixweb.com', 29886, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29336, N'Dipti  Mafatlal  Parmar', N'dipti.parmar@radixweb.com', 501, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29432, N'Apurva  Satishbhai Jayswal', N'Apurva.Jayswal@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29516, N'Biren  Rajeshkumar Patel', N'biren.patel@radixweb.com', 37771, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29616, N'Vrajesh  Rajendrakumar Barot', N'vrajesh.barot@radixweb.com', 29685, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29667, N'Rinkal  Gopalbhai Patel', N'rinkal.patel@radixweb.com', 29685, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29685, N'Vaishali Harishbhai  Chauhan', N'vaishali.chauhan@radixweb.com', 845, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29766, N'Hina  Sureshbhai Thakkar', N'hina.thakkar@radixweb.com', 29685, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29825, N'Deepak  Chuttan Lal Sharma', N'deepak.sharma@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29872, N'Jahanvi  Vikrambhai		 Patel', N'jahanvi.patel@radixweb.com', 1289, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29886, N'Suman  Shyamal Das', N'suman.das@radixweb.com', 845, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29893, N'Dharmik  Rajendrakumar Patadiya', N'dharmik.patadiya@radixweb.com', 29685, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29896, N'Yash Nilesh Mehta', N'yash.mehta@radixweb.com', 24163, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29921, N'Ankita  Mukeshbhai Gajjar', N'ankita.gajjar@radixweb.com', 29685, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29925, N'Aman  Sanjay Mecvan', N'aman.mecvan@radixweb.com', 29685, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29933, N'Heena   Jethva', N'heena.jethva@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29943, N'Khushali  Tejawat', N'khushali.tejawat@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29956, N'Vatsal  Dharmeshkumar Parmar', N'vatsal.parmar@radixweb.com', 1344, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29966, N'Shekhar  Anilkumar Chawla', N'shekhar.chawla@radixweb.com', 28702, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29969, N'Sachin  Satyanarayan Sharma', N'sachin.sharma@radixweb.com', 514, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29971, N'Rohan  Bhupendrabhai Panchal', N'rohan.panchal@radixweb.com', 1283, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29973, N'Pranav  Vivek Kolharkar', N'pranav.kolharkar@radixweb.com', 27275, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29977, N'Parth  Hasmukhbhai Parekh', N'parth.parekh@radixweb.com', 772, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29982, N'Mitul  Kalpesh Kumar Soni', N'mitul.soni@radixweb.com', 24165, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29986, N'Chirag  Manojkumar Fabiyani', N'chirag.fabiyani@radixweb.com', 1344, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29988, N'Bhargav  Govabhai Prajapati', N'bhargav.prajapati@radixweb.com', 16304, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29992, N'Palak  Hareshbhai Patel', N'palakh.patel@radixweb.com', 1251, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (29996, N'Niraj  Prakashbhai sapra', N'niraj.sapra@radixweb.com', 14813, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30004, N'Milit  Dixitbhai Panchasara', N'milit.panchasara@radixweb.com', 24163, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30006, N'Jevik  Pravinbhai Raiyani', N'jevik.raiyani@radixweb.com', 30229, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30008, N'Fiyona  Bharatbhai Mistry', N'fiyona.mistry@radixweb.com', 1226, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30010, N'Jayeshbhai  Bharatbhai Chauhan', N'jayesh.chauhan@radixweb.com', 1287, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30018, N'Disha  Pratik Shah', N'dishap.shah@radixweb.com', 24163, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30020, N'Charmi  Atulbhai Tanna', N'charmi.tanna@radixweb.com', 30101, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30041, N'Rahul  VINAYAK Nimje', N'Rahul.nimje@radixweb.com', 14690, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30043, N'Ronak  Satishbhai Bhavsar', N'ronak.bhavsar@radixweb.com', 14690, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30053, N'Prajal  Hasmukhbhai Patel', N'prajal.patel@radixweb.com', 555, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30101, N'Mehul  Ishwarbhai Patel', N'mehuli.patel@radixweb.com', 720, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30189, N'Paresh  karsanbhai Gohil', N'paresh.gohil@radixweb.com', 36580, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30191, N'Harshit  Bhaveshbhai Sampat', N'harshit.sampat@radixweb.com', 16028, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30193, N'Zeel  Digan Mehta', N'zeel.mehta@radixweb.com', 16126, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30195, N'Vaisakh  Sankaranarayanan  Nair', N'vaisakh.nair@radixweb.com', 555, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30197, N'Jinal  Kirankumar Shah', N'jinal.shah@radixweb.com', 98188, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30199, N'Jay  Shailesh Prajapati', N'jay.prajapati@radixweb.com', 16304, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30201, N'Bhargav  Dipak Modi', N'bhargav.modi@radixweb.com', 28702, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30205, N'Parth  Jayeshbhai Shah', N'parthj.shah@radixweb.com', 28544, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30207, N'Vivek  Sanjaybhai Pandya', N'vivek.pandya@radixweb.com', 845, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30209, N'Viral  Kishorbhai Gujarati', N'viral.gujarati@radixweb.com', 559, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30211, N'Kartik  Bhalchandra Raval', N'kartik.raval@radixweb.com', 14820, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30219, N'Aniket  Dipakbhai Shinde', N'aniket.shinde@radixweb.com', 514, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30221, N'Trisha  Rajeshbhai Kanani', N'trisha.kanani@radixweb.com', 845, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30229, N'Kisan  Ashokbhai Patel', N'kisan.patel@radixweb.com', 957, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30285, N'Darshit  Bharatbhai Makasana', N'darshit.makasana@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30306, N'Nirav  Bakulbhai Darji', N'nirav.darji@radixweb.com', 845, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30401, N'Avani  Anilbhai Takoliya', N'avani.takoliya@radixweb.com', 37493, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30407, N'Ezad  Ikbalbhai Abada', N'ezad.abada@radixweb.com', 612, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30409, N'Jaykishan  Dineshkumar Patel', N'jaykishan.patel@radixweb.com', 1090, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30524, N'Chirag  Harshadbhai Chauhan', N'chirag.chauhan@radixweb.com', 720, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30533, N'Urvil  Kaushikkumar Patel', N'urvil.patel@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30618, N'Kiran  PremjiBhai Chamudia', N'kiran.chamudia@radixweb.com', 14813, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30649, N'Love  Pinakinkumar Gajjar', N'love.gajjar@radixweb.com', 547, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30709, N'Trusha   Radadiya', N'trusha.radadiya@radixweb.com', 957, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30736, N'Nikhil  Rameshchandra  Maliwal', N'nikhil.maliwal@radixweb.com', 845, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30887, N'Nirmit  Kalpesh Patel', N'nirmit.patel@radixweb.com', 845, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (30978, N'Asifkhan  Nisarkhan Pathan', N'asif.pathan@radixweb.com', 741, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (31035, N'Rutvik  Yogesh Sharma', N'rutvik.sharma@radixweb.com', 845, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (31052, N'Rahul  Umed Singh Shekhawat', N'rahul.shekhawat@radixweb.com', 718, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (31108, N'Alex  Oliver Christian', N'alex.christian@radixweb.com', 883, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (31116, N'Kaushal  Hareshbhai Babariya', N'kaushal.babariya@radixweb.com', 845, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (31134, N'Jagendrasinh  Ramansinh Barad', N'jagendrasinh.barad@radixweb.com', 845, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36035, N'Ekta  Kiritbhai Dabhi', N'ekta.dabhi@radixweb.com', 14803, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36039, N'Vatsal  Laljibhai Ribadiya', N'vatsal.ribadiya@radixweb.com', 1143, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36046, N'Bhavin  Pankaj Rathod', N'bhavin.rathod@radixweb.com', 671, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36067, N'Deep  Kamlesh Parmar', N'deep.parmar@radixweb.com', 772, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36072, N'Niraj  Kamleshbhai Surati', N'niraj.surati@radixweb.com', 30285, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36074, N'Prit  Rakeshbhai Rojivadiya', N'prit.rojivadiya@radixweb.com', 16126, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36076, N'Sagar  Jayesh Bhatt', N'sagar.bhatt@radixweb.com', 1344, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36079, N'Vraj  Rajeshkumar Marvania', N'vraj.marvania@radixweb.com', 16126, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36081, N'Dhruvit  Rajeshbhai  Diyora', N'dhruvit.diyora@radixweb.com', 1226, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36083, N'Bhargav  Parshotambhai Gangadharani', N'bhargav.gangadharani@radixweb.com', 1344, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36088, N'Karan  Jethanand Tekwani', N'karan.tekwani@radixweb.com', 28544, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36092, N'Ketan  Baldevbhai Jambukiya', N'ketan.jambukiya@radixweb.com', 877, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36094, N'Preethi  P.L', N'preeti.pl@radixweb.com', 660, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36096, N'Hiren  Jiteshbhai Sanghani', N'hiren.sanghani@radixweb.com', 659, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36114, N'Hemanshu  Hemant Parmar', N'hemanshu.parmar@radixweb.com', 593, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36117, N'Romish  Gulabbhai Patoriya', N'romish.patoriya@radixweb.com', 741, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36119, N'Vivek  Chetankumar Mavani', N'vivek.mavani@radixweb.com', 659, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36121, N'Trupal  Navinbhai Singel', N'trupal.singel@radixweb.com', 37771, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36129, N'Prakruti  Rakeshbhai  Joshi', N'prakruti.joshi@radixweb.com', 659, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36131, N'Chitrank Sudhirbhai   Umarania', N'chitrank.umarania@radixweb.com', 19023, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36133, N'Sahil  Kaushikkumar Kadia', N'sahil.kadia@radixweb.com', 1220, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36135, N'Devanshu  Rasik Chhaya', N'devanshu.chhaya@radixweb.com', 788, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36137, N'Mehul  Batukbhai Jambukiya', N'mehul.jambukiya@radixweb.com', 1095, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36147, N'Piyushsingh  Omkarsingh  Thakur', N'piyush.thakur@radixweb.com', 1120, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36157, N'Niraj  Chandubhai Vasani', N'niraj.vasani@radixweb.com', 659, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36159, N'Preet  Vimal Gandhi', N'preet.gandhi@radixweb.com', 16304, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36178, N'Shubh  Ravindrakumar Patel', N'shubh.patel@radixweb.com', 788, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36449, N'Ravi  Lakhamaji Prajapati', N'ravi.prajapati@radixweb.com', 593, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36455, N'Raviraj  AjeetSinh Padhiyar', N'raviraj.padhiyar@radixweb.com', 24163, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36459, N'Kuldipsinh  Laxmansinh  Zala', N'kuldipsinh.zala@radixweb.com', 741, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36463, N'Parag   Vora', N'parag.vora@radixweb.com', 29336, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36493, N'Uttam  Dineshkumar Patel', N'uttam.patel@radixweb.com', 849, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (36580, N'Dev  Chetan  Patel', N'dev.patel@radixweb.com', 16126, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37141, N'Disha  Kamleshbhai  Sudra', N'disha.sudra@radixweb.com', 667, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37306, N'Harshvardhan  Vinodbhai Prajapati', N'harshvardhan.p@radixweb.com', 667, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37320, N'Hemangini Prakash  Tailor', N'hemangini.tailor@radixweb.com', 720, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37322, N'Sagar   Shah', N'sagar.shah@radixweb.com', 16304, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37341, N'Mayank  Ramesh Parmar', N'mayankr.parmar@radixweb.com', 27464, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37351, N'Ritu  Dharampal Saini', N'ritu.saini@radixweb.com', 514, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37353, N'Nandkishore   Patel', N'nandkishore.patel@radixweb.com', 883, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37355, N'Shivani   Khodiyar', N'shivani.khodiyar@radixweb.com', 501, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37443, N'Anirudh  Sanjay  Chawla', N'anirudh.chawla@radixweb.com', 38279, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37445, N'Anjali  Navin  Soni', N'anjalin.soni@radixweb.com', 501, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37470, N'Varun  Shailesh Nasit', N'varun.nasit@radixweb.com', 555, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37493, N'Sneha  Brijesh Patel', N'snehab.patel@radixweb.com', 1090, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37548, N'Dhaval   Chodvadiya', N'dhaval.chodvadiya@radixweb.com', 593, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37587, N'Anjali   Suthar', N'anjali.suthar@radixweb.com', 845, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37722, N'Shyam   Javiya', N'shyam.javiya@radixweb.com', 1078, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37728, N'Deep   Gandhi', N'deep.gandhi@radixweb.com', 1344, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37756, N'Diya   Pandya', N'diya.pandya@radixweb.com', 555, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37771, N'Unnati   Jani', N'Unnati.Jani@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37807, N'Kinnari Hiren Pandya', N'kinnari.pandya@radixweb.com', 593, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37831, N'Harsh  Champakkumar  Shah', N'harshc.shah@radixweb.com', 1120, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37833, N'Jignesh  Pravinbhai  Prajapati', N'jignesh.prajapati@radixweb.com', 16126, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37838, N'Om  Dnyaneswar Bagade', N'om.bagade@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (37848, N'Mehul  Mahadevbhai  Panchal', N'mehulm.panchal@radixweb.com', 1082, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38166, N'Mansi  Vijaykumar Suthar', N'mansi.suthar@radixweb.com', 638, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38225, N'Priyankkumar  Bhikhabhai Patel', N'priyank.patel@radixweb.com', 1146, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38227, N'Keyur  Shailesh  Kathiriya', N'keyur.kathiriya@radixweb.com', 1146, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38229, N'Harenkumar  Hargovind Makwana', N'haren.makwana@radixweb.com', 955, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38275, N'Nikita  Naresh Pitroda', N'nikita.pitroda@radixweb.com', 555, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38277, N'Disha   Panchal', N'disha.panchal@radixweb.com', 849, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38279, N'Akash   Kareliya', N'akash.kareliya@radixweb.com', 659, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38287, N'Miteshkumar   Sathvara', N'mitesh.sathvara@radixweb.com', 16126, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38301, N'Abhishek  Rajeshbhai. Agrawal', N'abhishek.agrawal@radixweb.com', 27087, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38305, N'Ajanankhan  Mahamad Salimkhan Pathan', N'ajanan.pathan@radixweb.com', 27087, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38311, N'Anisha   Bhatia', N'anisha.bhatia@radixweb.com', 24163, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38313, N'Arpit   Agrawal', N'arpit.agrawal@radixweb.com', 36129, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38315, N'Asma Naaz   Gazi', N'asma.gazi@radixweb.com', 98188, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38317, N'Charmi   Jadawala', N'charmi.jadawala@radixweb.com', 28517, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38319, N'Deepak   Shukla', N'deepak.shukla@radixweb.com', 29943, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38323, N'Dhruv  Bharat  Darji', N'dhruv.darji@radixweb.com', 38961, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38327, N'Harshil  Rakesh Patel', N'harshil.patel@radixweb.com', 1344, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38333, N'Kevin  Rajeshbhai Tank', N'kevin.tank@radixweb.com', 1344, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38338, N'Khushboo  Anil Chandarana', N'khushboo.chandarana@radixweb.com', 559, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38344, N'Ajay  Hargovind  Israni', N'ajay.israni@radixweb.com', 555, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38348, N'Mihir  Ghanshyambhai Panara', N'mihir.panara@radixweb.com', 891, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38350, N'Madni  Yasin Pothiyawala', N'madni.pothiyawala@radixweb.com', 1095, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38352, N'Mohammadakram  Mohammadali Saiyed', N'mohammadakram.saiyed@radixweb.com', 98077, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38354, N'Mohit  Kamleshbhai Vaghela', N'mohit.vaghela@radixweb.com', 896, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38356, N'Mustufa  Moizbhai Ambawala', N'mustufa.ambawala@radixweb.com', 16126, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38358, N'Nensi  Sanjaykumar Darji', N'nensi.darji@radixweb.com', 514, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38360, N'Nidhi   Gokani', N'nidhi.gokani@radixweb.com', 21700, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38366, N'Padmanava   Karmakar', N'padmanava.karmakar@radixweb.com', 36114, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38370, N'Rahee  Sandip Gandhi', N'rahee.gandhi@radixweb.com', 29057, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38372, N'Rajvi   Siddhpura', N'rajvi.siddhpura@radixweb.com', 927, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38374, N'Rushi  Mahendrabhai Gandhi', N'rushi.gandhi@radixweb.com', 38668, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38376, N'Sagar  Jayesh Kapadia', N'sagar.kapadia@radixweb.com', 14690, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38378, N'Shailaja  Bhagvatprassad Trivedi', N'shailaja.trivedi@radixweb.com', 29432, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38384, N'Suchit  Sandip Sheth', N'suchit.sheth@radixweb.com', 16126, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38388, N'Urmal Nanjibhai  Hadiyal', N'urmal.hadiyal@radixweb.com', 30618, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38394, N'Ankit  Bharatbhai Chauhan', N'ankit.chauhan@radixweb.com', 1049, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38396, N'Ankit  Jaysukhbhai Rudani', N'ankit.rudani@radixweb.com', 24163, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38398, N'Chaitanya  Dimplebhai Bathia', N'chaitanya.bathia@radixweb.com', 28517, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38404, N'Ronak  Bharatkumar  Chauhan', N'ronakb.chauhan@radixweb.com', 1251, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38412, N'Vidhi   Chauhan', N'vidhi.chauhan@radixweb.com', 14820, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38414, N'Himani   Lalkiya', N'himani.lalkiya@radixweb.com', 31108, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38416, N'Himanshu  Dipakbhai Jogani', N'himanshu.jogani@radixweb.com', 38668, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38418, N'Inkal  Rakeshbhai Panchal', N'inkal.panchal@radixweb.com', 28966, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38421, N'Jeet  Hiteshbhai Raythatha', N'jeet.raythatha@radixweb.com', 28550, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38423, N'Jeet  Rameshbhai Vegad', N'jeet.vegad@radixweb.com', 28505, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38429, N'Kuldeep  Bharatkumar Jani', N'kuldeep.jani@radixweb.com', 1019, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38431, N'Mansi  Manishbhai Shah', N'mansim.shah@radixweb.com', 38961, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38439, N'Mihir  Kamlesh Shah', N'mihirk.shah@radixweb.com', 28156, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38445, N'Rohan   Chavda', N'rohan.chavda@radixweb.com', 1344, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38451, N'Tarmi  Girishbhai  Gajera', N'tarmi.gajera@radixweb.com', 38959, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38453, N'Vishwam  Rajeshkumar Suchak', N'vishwam.suchak@radixweb.com', 27275, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38455, N'Yash  Shaileshbhai Manani', N'yash.manani@radixweb.com', 37320, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38457, N'Jaimin  Vinodbhai Patel', N'jaiminv.patel@radixweb.com', 98564, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38459, N'Akash  Ajaykumar  Gupta', N'akash.gupta@radixweb.com', 741, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38461, N'Dhara  Chelabhai  Prajapati', N'dhara.prajapati@radixweb.com', 1344, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38465, N'Pakshal   Shah', N'pakshal.shah@radixweb.com', 578, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38469, N'Arazu  Dineshbhai  Kaneriya', N'arazu.kaneriya@radixweb.com', 30533, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38475, N'Gautam  Jaypal Nayak', N'gautam.nayak@radixweb.com', 30101, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38479, N'Ritu  Hitenbhai Kandoliya', N'ritu.kandoliya@radixweb.com', 98564, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38481, N'Rutvik  Kailashbhai Khakhrodiya', N'rutvik.khakhrodiya@radixweb.com', 788, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38485, N'Nikhil  Mohanbhai Khorwal', N'nikhil.khorwal@radixweb.com', 38279, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38487, N'Darshit  Bhikhubhai Busa', N'darshit.busa@radixweb.com', 30409, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38489, N'Jatin   Wadhwani', N'jatin.wadhwani@radixweb.com', 17972, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38491, N'Mansi   Trivedi', N'mansi.trivedi@radixweb.com', 845, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38506, N'Parth  Govindbhai  Patel', N'parthg.patel@radixweb.com', 38229, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38645, N'Disha  Jay  Shah', N'dishaj.shah@radixweb.com', 1220, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38668, N'Hitesh  Prakash Kanjani', N'Hitesh.Prakash@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38703, N'Ranjana  Balaram Patidar', N'ranjana.patidar@radixweb.com', 741, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38713, N'Anuj  Bhaveshbhai  Raval', N'anuj.raval@radixweb.com', 16126, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38777, N'Roshni  Bhupendrabhai  Thakkar', N'roshni.thakkar@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38780, N'Hardik  Virjibhai  Bhalgama', N'hardik.bhalgama@radixweb.com', 1146, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38808, N'Kishan  Harsukhlal  Bhensadadiya', N'kishan.bhensadadiya@radixweb.com', 1146, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38810, N'Soyeb  Salimbhai  Shekh', N'soyeb.shaikh@radixweb.com', 37833, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38844, N'Darshika  Saurabh Gilder', N'darshika.gilder@radixweb.com', 1289, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38846, N'Jayesh  Fulchandbhai   Kumavat', N'jayesh.kumavat@radixweb.com', 555, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38895, N'Hardi  Yogeshbhai Dave', N'hardi.dave@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38955, N'Harshil Haresh Maniya', N'harshil.maniya@radixweb.com', 1344, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38959, N'Vaibhavi Parth Trivedi', N'vaibhavi.trivedi@radixweb.com', 555, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38961, N'Rahul  Koteswararao Buddha', N'rahul.buddha@radixweb.com', 25592, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (38991, N'Arjun  Mangilal Patidar', N'arjun.patidar@radixweb.com', 38645, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (39021, N'Heli  Naranbhai Keshariya', N'heli.keshariya@radixweb.com', 1078, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (39023, N'Darshan  Hansrajbhai Kathiriya', N'darshan.kathiriya@radixweb.com', 1019, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (39025, N'Vaidika Jignesh Vadhvaniya', N'vaidika.vadhvaniya@radixweb.com', 38645, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (39034, N'Akshay  Rajnikant  Chauhan', N'akshay.chauhan@radixweb.com', 38961, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (39036, N'Diksha  Ravindra  Patel', N'diksha.patel@radixweb.com', 772, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (39128, N'Gaurav  Ishwarlal  Chavda', N'gaurav.chavda@radixweb.com', 612, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (39164, N'Dhaval Dalpatbhai Patel', N'dhavald.patel@radixweb.com', 39025, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (39177, N'Vishw  Shrikesh  Modh', N'vishw.modh@radixweb.com', 30533, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (39191, N'Jaymeen SanjayBhai Kachhiya', N'jaymeen.kachhiya@radixweb.com', 38961, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (39200, N'Lalit  Bharatbhai  Prajapati', N'lalit.prajapati@radixweb.com', 29943, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (39202, N'Pushkarprabhat  Dinkarprabhat  Saxena', N'Pushkarprabhat.Dinkarprabhat@radixweb.com', 1, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (39215, N'Vivek Singh Kushwaha', N'vivek.kushwaha@radixweb.com', 39202, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (97971, N'Riddhi  Parth  Mehta', N'riddhi.mehta@radixweb.com', 849, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (97995, N'Jay SanjayBhai Patel', N'jays.patel@radixweb.com', 38961, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98077, N'Indu  Adarsh Nair', N'indu.nair@radixweb.com', 38645, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98148, N'Faruq Sadruddin Kureshi', N'faruq.kureshi@radixweb.com', 37833, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98156, N'Ajay   Jangid', N'ajay.jangid@radixweb.com', 39202, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98161, N'Vidha Prahalad Kumar Jangid', N'vidha.jangid@radixweb.com', 39202, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98163, N'Ankit Kumar Jangid', N'ankit.kumar@radixweb.com', 39202, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98188, N'Surbhi  Rajendrakumar  Acharya', N'surbhi.acharya@radixweb.com', 1251, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98220, N'Jarul Naman  Munshi', N'jarul.munshi@radixweb.com', 16126, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98222, N'Pragya   Bisen', N'pragya.bisen@radixweb.com', 38645, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98224, N'Harshit   Vidhyarthi', N'harshit.vidhyarthi@radixweb.com', 38645, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98261, N'Darshan Bhupatbhai Kanojiya', N'darshan.kanojiya@radixweb.com', 16126, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98308, N'Shivani   Saini', N'shivani.saini@radixweb.com', 39202, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98492, N'Satish   Jangid', N'satish.jangid@radixweb.com', 39202, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98564, N'Falgun   Mistry', N'falgun.mistry@radixweb.com', 555, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98570, N'Iona Felix  Sequeira', N'iona.sequeira@radixweb.com', 29886, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98598, N'Mukesh  Fulchandbhai Mali', N'mukesh.mali@radixweb.com', 27087, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98651, N'Tanu  Sunil Gupta', N'tanu.gupta@radixweb.com', 39202, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98747, N'Himanshu  Gopal Kumar', N'himanshu.kumar@radixweb.com', 38713, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98756, N'Vidit   Khandelwal', N'vidit.khandelwal@radixweb.com', 39202, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98758, N'Ayushi  Rakeshbhai  Shah', N'ayushi.shah@radixweb.com', 29886, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98760, N'Abhishek   Surendernath Upadhyay', N'abhishek.upadhyay@radixweb.com', 39202, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98762, N'Vipul   Anand', N'vipul.anand@radixweb.com', 39202, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98764, N'Khush   Mohammad', N'khush.mohammad@radixweb.com', 39202, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98775, N'Nageen   Lal', N'nageen.lal@radixweb.com', 29943, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98783, N'Prabal   Surana', N'prabal.surana@radixweb.com', 39202, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98785, N'Jaydeep Kumar Sahu', N'jaydeep.sahu@radixweb.com', 39202, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98803, N'Parth  Khodidas  Panchal', N'parthk.panchal@radixweb.com', 38961, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98821, N'Ashish   Dhudasia', N'ashish.dhudasia@radixweb.com', 1289, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (98836, N'Sutanu  Atanu Sain', N'sutanu.sain@radixweb.com', 39202, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (99002, N'Shivam Kumar Singh', N'shivam.singh@radixweb.com', 39202, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (102241, N'Deepak Kumar Suthar', N'deepak.suthar@radixweb.com', 1289, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (102243, N'Ketan  Bhikhabhai Valand', N'ketan.valand@radixweb.com', 877, N'123', N'Radix')
GO
INSERT [dbo].[rxemployees] ([empID], [EmployeeName], [OfficialEmail], [parentempID], [password], [Operation_Unit]) VALUES (102296, N'Prashansa   Khandelwal', N'prashansa.khandelwal@radixweb.com', 39202, N'123', N'Radix')
GO
SET IDENTITY_INSERT [dbo].[Tasks] ON 
GO
INSERT [dbo].[Tasks] ([taskId], [taskTitle], [isDone], [createdDate], [doneDate]) VALUES (1, N'Get up', 0, CAST(N'2022-11-08' AS Date), NULL)
GO
INSERT [dbo].[Tasks] ([taskId], [taskTitle], [isDone], [createdDate], [doneDate]) VALUES (2, N'Get Ready', 0, CAST(N'2022-11-08' AS Date), NULL)
GO
INSERT [dbo].[Tasks] ([taskId], [taskTitle], [isDone], [createdDate], [doneDate]) VALUES (3, N'Get to work', 1, CAST(N'2022-11-08' AS Date), CAST(N'2022-11-09' AS Date))
GO
INSERT [dbo].[Tasks] ([taskId], [taskTitle], [isDone], [createdDate], [doneDate]) VALUES (4, N'Check e-mail', 0, CAST(N'2022-11-08' AS Date), NULL)
GO
INSERT [dbo].[Tasks] ([taskId], [taskTitle], [isDone], [createdDate], [doneDate]) VALUES (5, N'Attend a meeting', 1, CAST(N'2022-11-08' AS Date), CAST(N'2023-07-19' AS Date))
GO
INSERT [dbo].[Tasks] ([taskId], [taskTitle], [isDone], [createdDate], [doneDate]) VALUES (6, N'Go home', 0, CAST(N'2022-11-08' AS Date), NULL)
GO
INSERT [dbo].[Tasks] ([taskId], [taskTitle], [isDone], [createdDate], [doneDate]) VALUES (7, N'call a friend', 0, CAST(N'2022-11-08' AS Date), NULL)
GO
INSERT [dbo].[Tasks] ([taskId], [taskTitle], [isDone], [createdDate], [doneDate]) VALUES (8, N'test', 0, CAST(N'2022-11-08' AS Date), NULL)
GO
INSERT [dbo].[Tasks] ([taskId], [taskTitle], [isDone], [createdDate], [doneDate]) VALUES (10, N'test2', 0, CAST(N'2022-11-08' AS Date), NULL)
GO
INSERT [dbo].[Tasks] ([taskId], [taskTitle], [isDone], [createdDate], [doneDate]) VALUES (11, N'temp', 0, CAST(N'2023-04-07' AS Date), NULL)
GO
INSERT [dbo].[Tasks] ([taskId], [taskTitle], [isDone], [createdDate], [doneDate]) VALUES (12, N'Client call at 6:30', 0, CAST(N'2023-07-19' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[Tasks] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([userID], [userName], [emailAddress], [password], [roleID], [Balance]) VALUES (1, N'gautamnayak', N'g@gmail.com', N'123456', 3, 510)
GO
INSERT [dbo].[Users] ([userID], [userName], [emailAddress], [password], [roleID], [Balance]) VALUES (2, N'ankitrudani', N'a@gmail.com', N'123456', 2, 330)
GO
INSERT [dbo].[Users] ([userID], [userName], [emailAddress], [password], [roleID], [Balance]) VALUES (3, N'jeetvegad', N'j@gmail.com', N'123456', 1, 800)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[CourseEnrollment] ADD  DEFAULT (getdate()) FOR [enrollDate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [MafDate]
GO
ALTER TABLE [dbo].[Tasks] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[CourseEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_enroll_courseID] FOREIGN KEY([courseID])
REFERENCES [dbo].[Courses] ([courseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseEnrollment] CHECK CONSTRAINT [FK_enroll_courseID]
GO
ALTER TABLE [dbo].[CourseEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_enroll_empID] FOREIGN KEY([empID])
REFERENCES [dbo].[Employees] ([empID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseEnrollment] CHECK CONSTRAINT [FK_enroll_empID]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD FOREIGN KEY([authorId])
REFERENCES [dbo].[Authors] ([authorId])
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_course_deptID] FOREIGN KEY([deptID])
REFERENCES [dbo].[Departments] ([deptID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_course_deptID]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_emp_deptid] FOREIGN KEY([deptID])
REFERENCES [dbo].[Departments] ([deptID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_emp_deptid]
GO
ALTER TABLE [dbo].[Modules]  WITH CHECK ADD FOREIGN KEY([parentModuleID])
REFERENCES [dbo].[Modules] ([moduleID])
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_moduleID_Permission_Modules] FOREIGN KEY([moduleID])
REFERENCES [dbo].[Modules] ([moduleID])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_moduleID_Permission_Modules]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_userID_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_userID_Users]
GO
ALTER TABLE [dbo].[rxemployees]  WITH CHECK ADD  CONSTRAINT [FK_parentempID_empID] FOREIGN KEY([parentempID])
REFERENCES [dbo].[rxemployees] ([empID])
GO
ALTER TABLE [dbo].[rxemployees] CHECK CONSTRAINT [FK_parentempID_empID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleID])
GO
/****** Object:  StoredProcedure [dbo].[addnewModule]    Script Date: 21-07-2023 13:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROC [dbo].[addnewModule] @modulename nvarchar(50)
 AS

 insert into [Modules] (moduleName,isActive) values (@modulename,1)

 Declare @id int = SCOPE_IDENTITY();
 Declare @id2 int =IDENT_CURRENT('Modules')

  insert into Permissions (
     [userID]
    ,[moduleID]
    ,[calView]
    ,[canAdd]
    ,[canUpdate]
    ,[canDelete]) values (1,@id,1,1,1,1)
  
	insert into Permissions (
	 [userID]
    ,[moduleID]
    ,[calView]
    ,[canAdd]
    ,[canUpdate]
    ,[canDelete]) select userId,@id2,0,0,0,0 from users
	where userID != 1
GO
/****** Object:  StoredProcedure [dbo].[getmyfullteam]    Script Date: 21-07-2023 13:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[getmyfullteam] @empID INT
AS

SELECT empID as nodeId,
	EmployeeName,
	OfficialEmail,
	(CASE WHEN parentempID =  @empID THEN parentempID END) AS parentNodeId 
	FROM rxemployees 
	WHERE 
	empID = @empID

	UNION ALL

SELECT e2.empID,e2.EmployeeName,e2.OfficialEmail,e2.parentempID FROM 
rxemployees e1
 JOIN 
rxemployees e2
on e1.empID = e2.parentempID
WHERE 
e1.empID = @empID OR e1.parentempID = @empID 
ORDER BY parentNodeId 
GO
/****** Object:  StoredProcedure [dbo].[getmyteam]    Script Date: 21-07-2023 13:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[getmyteam] @empID INT
AS

	SELECT empID as nodeId,
	EmployeeName,
	OfficialEmail,
	(CASE WHEN parentempID =  @empID THEN parentempID  END) AS parentNodeId 
	FROM rxemployees 
	WHERE 
	
	empID = @empID OR parentempID =  @empID
	
	ORDER BY parentempID 
GO
USE [master]
GO
ALTER DATABASE [CourseManagement] SET  READ_WRITE 
GO
