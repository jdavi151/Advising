CREATE TABLE STUDENT(
  EID CHAR(9) PRIMARY KEY NOT NULL,
  firstName CHAR(15) NOT NULL,
  lastName CHAR(15) NOT NULL,
  studentNetID CHAR(10) NOT NULL
);

CREATE TABLE ADVISOR(
  advisorNetID CHAR(10) PRIMARY KEY NOT NULL,
  firstName CHAR(15) NOT NULL,
  lastName CHAR(15) NOT NULL,
  isAdmin BOOLEAN NOT NULL,
  hashedPassword TEXT NOT NULL
);

CREATE TABLE SCHEDULE(
  scheduleID INT PRIMARY KEY NOT NULL AUTOINCREMENT,
  scheduleDate TEXT NOT NULL,
  FOREIGN KEY(EID) REFERENCES STUDENT(EID),
  FOREIGN KEY(advisorNetID) REFERENCES ADVISOR(advisorNetID)
);

CREATE TABLE COURSE(
  CRN CHAR(5) NOT NULL,
  title TEXT NOT NULL,
  courseNO CHAR(5) NOT NULL,
  coursePrefix CHAR(5) NOT NULL,
  term CHAR(12) NOT NULL,
  timeEnd TEXT,
  timeStart TEXT,
  capacity INT,
  actual INT,
  credits INT,
  isHonors INT,
  PRIMARY KEY(CRN, term)
);

CREATE TABLE COURSE_ADVISED(
  FOREIGN Key(CRN) REFERENCES(COURSE),
  FOREIGN KEY(term) REFERENCES(COURSE),
  FOREIGN KEY(scheduleID) REFERENCES(SCHEDULE),
  PRIMARY KEY(CRN, COURSE, scheduleID)
);
