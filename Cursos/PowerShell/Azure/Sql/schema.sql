IF OBJECT_ID(N'dbo.Person', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Person
    (
        PersonId INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Person PRIMARY KEY,
        FirstName NVARCHAR(128) NOT NULL,
        MiddleInitial NVARCHAR(10) NULL,
        LastName NVARCHAR(128) NOT NULL,
        DateOfBirth DATE NOT NULL
    );
END;

IF OBJECT_ID(N'dbo.Student', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Student
    (
        StudentId INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Student PRIMARY KEY,
        PersonId INT NOT NULL CONSTRAINT FK_Student_Person REFERENCES dbo.Person(PersonId),
        Email NVARCHAR(256) NULL
    );
END;

IF OBJECT_ID(N'dbo.Course', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Course
    (
        CourseId INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Course PRIMARY KEY,
        Name NVARCHAR(50) NOT NULL,
        Teacher NVARCHAR(256) NOT NULL
    );
END;

IF OBJECT_ID(N'dbo.Credit', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Credit
    (
        StudentId INT NOT NULL CONSTRAINT FK_Credit_Student REFERENCES dbo.Student(StudentId),
        CourseId INT NOT NULL CONSTRAINT FK_Credit_Course REFERENCES dbo.Course(CourseId),
        Grade DECIMAL(5,2) NULL CONSTRAINT CK_Credit_Grade CHECK (Grade <= 100.00),
        Attempt TINYINT NOT NULL,
        CONSTRAINT UQ_Credit UNIQUE (StudentId, CourseId, Grade, Attempt)
    );
END;

