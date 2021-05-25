begin;

CREATE TABLE public.Users
(
	Id INTEGER NOT NULL GENERATED BY DEFAULT  AS IDENTITY (INCREMENT 1 START 1),
	Email CHARACTER VARYING(100) NOT NULL,
	Password CHARACTER VARYING(10) NOT NULL,
	CONSTRAINT PK_Users PRIMARY KEY(Id),
	CONSTRAINT UK_Users_Email UNIQUE (Email)
);

CREATE TABLE public.Employees(
	UserId INTEGER NOT NULL,
	FirstName CHARACTER VARYING(50) NOT NULL,
	Surname CHARACTER VARYING(50) NOT NULL,
	CONSTRAINT PK_Employees PRIMARY KEY(UserId),
	CONSTRAINT FK_Employees_Users FOREIGN KEY(UserId) REFERENCES public.Users(Id)
);

CREATE TABLE public.JobSeekers(
	UserId INTEGER NOT NULL,
	FirstName CHARACTER VARYING(50) NOT NULL,
	Surname CHARACTER VARYING(50) NOT NULL,
	TcNo CHARACTER VARYING(11) NOT NULL,
	BirthDate DATE NOT NULL,
	CONSTRAINT PK_JobSeekerss PRIMARY KEY(UserId),
	CONSTRAINT FK_JobSeekers_Users FOREIGN KEY(UserId) REFERENCES public.Users(Id),
	CONSTRAINT UK_JobSeekers_TcNo UNIQUE(TcNo)

);

CREATE TABLE public.Employers(
	UserId INTEGER NOT NULL,
	CompanyName CHARACTER VARYING(50) NOT NULL,
	WebAddress CHARACTER VARYING(50) NOT NULL,
	PhoneNo CHARACTER VARYING(10) NOT NULL,
	CONSTRAINT PK_Employers PRIMARY KEY(UserId),
	CONSTRAINT FK_Employers_Users FOREIGN KEY(UserId) REFERENCES public.Users(Id),
	CONSTRAINT UK_Employers_WebAddress UNIQUE(WebAddress)

);

CREATE TABLE public.EmailVerifications(
	UserId INTEGER NOT NULL,
	Codes CHARACTER VARYING(50) NOT NULL,
	IsVerified Boolean NOT NULL DEFAULT false,
	CONSTRAINT PK_EmailVerifications PRIMARY KEY(UserId),
	CONSTRAINT FK_Employers_Users FOREIGN KEY(UserId) REFERENCES public.Users(Id)


);

CREATE TABLE public.Jobs(
	Id INTEGER NOT NULL,
	UserId INTEGER NOT NULL,
	Title CHARACTER VARYING(200) NOT NULL,
	CONSTRAINT PK_Jobs PRIMARY KEY(Id),
	CONSTRAINT FK_Jobs_Users FOREIGN KEY(UserId) REFERENCES public.Users(Id),
	CONSTRAINT UK_Jobs_Title UNIQUE(Title)

);

CREATE TABLE public.JobPositions(
	Id INTEGER NOT NULL,
	Title CHARACTER VARYING(255) NOT NULL,
	CONSTRAINT PK_JobPositions PRIMARY KEY(Id),
	CONSTRAINT UK_Jobs_Title UNIQUE(Title)

CREATE TABLE public.EmployerConfirmations(
	EmployerId INTEGER NOT NULL,
	IsConfirmated Boolean NOT NULL DEFAULT false,
	ConfirmatedByStaffId INTEGER NOT NULL,
	CONSTRAINT PK_EmployerConfirmations PRIMARY KEY(EmployerId),
	CONSTRAINT FK_EmployerConfirmations_Employers FOREIGN KEY(EmployerId) REFERENCES public.Employers(UserId),
	
	

);
end;