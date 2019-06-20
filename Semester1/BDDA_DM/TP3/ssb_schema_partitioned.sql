DROP TABLE IF EXISTS customer;
CREATE TABLE IF NOT EXISTS customer
(
    C_CustomerKey int primary key,
    C_Name varchar(25),
    C_Address varchar(25),
    C_City varchar(10),
    C_Nation varchar(15),
    C_Region varchar(12),
    C_Phone varchar(15),
    C_MktSegment varchar(10),
    KEY(C_Name),
    KEY(C_City),
    KEY(C_Region),
    KEY(C_Phone),
    KEY(C_MktSegment)
);
 
DROP TABLE IF EXISTS part;
CREATE TABLE IF NOT EXISTS part
(
    P_PartKey int primary key,
    P_Name varchar(25),
    P_MFGR varchar(10),
    P_Category varchar(10),
    P_Brand varchar(15),
    P_Colour varchar(15),
    P_Type varchar(25),
    P_Size tinyint,
    P_Container char(10),
    key(P_Name),
    key(P_MFGR),
    key(P_Category),
    key(P_Brand)
);
 
DROP TABLE IF EXISTS supplier;
CREATE TABLE supplier
(
    S_SuppKey int primary key,
    S_Name char(25),
    S_Address varchar(25),
    S_City char(10),
    S_Nation char(15),
    S_Region char(12),
    S_Phone char(15),
    key(S_City),
    key(S_Name),
    key(S_Phone)
);
 
DROP TABLE IF EXISTS dim_date;
CREATE TABLE IF NOT EXISTS dim_date
(
    D_DateKey int primary key,
    D_Date char(18),
    D_DayOfWeek char(9),
    D_Month char(9),
    D_Year smallint,
    D_YearMonthNum int,
    D_YearMonth char(7),
    D_DayNumInWeek tinyint,
    D_DayNumInMonth tinyint,
    D_DayNumInYear smallint,
    D_MonthNumInYear tinyint,
    D_WeekNumInYear tinyint,
    D_SellingSeason char(12),
    D_LastDayInWeekFl tinyint,
    D_LastDayInMonthFl tinyint,
    D_HolidayFl tinyint,
    D_WeekDayFl tinyint,
    KEY(D_Year, D_DayNumInYear),
    KEY(D_YearMonth),
    KEY(D_WeekNumInYear, D_Year)
);
 
DROP TABLE IF EXISTS lineorder;
CREATE TABLE IF NOT EXISTS lineorder
(
    LO_OrderKey bigint not null,
    LO_LineNumber tinyint not null,
    LO_CustKey int not null,
    LO_PartKey int not null,
    LO_SuppKey int not null,
    LO_OrderDateKey int not null,
    LO_OrderPriority varchar(15),
    LO_ShipPriority char(1),
    LO_Quantity tinyint,
    LO_ExtendedPrice decimal,
    LO_OrdTotalPrice decimal,
    LO_Discount decimal,
    LO_Revenue decimal,
    LO_SupplyCost decimal,
    LO_Tax tinyint,
    LO_CommitDateKey int not null,
    LO_ShipMode varchar(10),
    key(LO_CustKey),
    key(LO_PartKey),
    key(LO_SuppKey),
    key(LO_OrderDateKey)
)
partition by range (LO_OrderDateKey)  (
partition p1992_01 values less than (19920131),
partition p1992_02 values less than (19920231),
partition p1992_03 values less than (19920331),
partition p1992_04 values less than (19920431),
partition p1992_05 values less than (19920531),
partition p1992_06 values less than (19920631),
partition p1992_07 values less than (19920731),
partition p1992_08 values less than (19920831),
partition p1992_09 values less than (19920931),
partition p1992_10 values less than (19921031),
partition p1992_11 values less than (19921131),
partition p1992_12 values less than (19921231),
partition p1993_01 values less than (19930131),
partition p1993_02 values less than (19930231),
partition p1993_03 values less than (19930331),
partition p1993_04 values less than (19930431),
partition p1993_05 values less than (19930531),
partition p1993_06 values less than (19930631),
partition p1993_07 values less than (19930731),
partition p1993_08 values less than (19930831),
partition p1993_09 values less than (19930931),
partition p1993_10 values less than (19931031),
partition p1993_11 values less than (19931131),
partition p1993_12 values less than (19931231),
partition p1994_01 values less than (19940131),
partition p1994_02 values less than (19940231),
partition p1994_03 values less than (19940331),
partition p1994_04 values less than (19940431),
partition p1994_05 values less than (19940531),
partition p1994_06 values less than (19940631),
partition p1994_07 values less than (19940731),
partition p1994_08 values less than (19940831),
partition p1994_09 values less than (19940931),
partition p1994_10 values less than (19941031),
partition p1994_11 values less than (19941131),
partition p1994_12 values less than (19941231),
partition p1995_01 values less than (19950131),
partition p1995_02 values less than (19950231),
partition p1995_03 values less than (19950331),
partition p1995_04 values less than (19950431),
partition p1995_05 values less than (19950531),
partition p1995_06 values less than (19950631),
partition p1995_07 values less than (19950731),
partition p1995_08 values less than (19950831),
partition p1995_09 values less than (19950931),
partition p1995_10 values less than (19951031),
partition p1995_11 values less than (19951131),
partition p1995_12 values less than (19951231),
partition p1996_01 values less than (19960131),
partition p1996_02 values less than (19960231),
partition p1996_03 values less than (19960331),
partition p1996_04 values less than (19960431),
partition p1996_05 values less than (19960531),
partition p1996_06 values less than (19960631),
partition p1996_07 values less than (19960731),
partition p1996_08 values less than (19960831),
partition p1996_09 values less than (19960931),
partition p1996_10 values less than (19961031),
partition p1996_11 values less than (19961131),
partition p1996_12 values less than (19961231),
partition p1997_01 values less than (19970131),
partition p1997_02 values less than (19970231),
partition p1997_03 values less than (19970331),
partition p1997_04 values less than (19970431),
partition p1997_05 values less than (19970531),
partition p1997_06 values less than (19970631),
partition p1997_07 values less than (19970731),
partition p1997_08 values less than (19970831),
partition p1997_09 values less than (19970931),
partition p1997_10 values less than (19971031),
partition p1997_11 values less than (19971131),
partition p1997_12 values less than (19971231),
partition p1998_01 values less than (19980131),
partition p1998_02 values less than (19980231),
partition p1998_03 values less than (19980331),
partition p1998_04 values less than (19980431),
partition p1998_05 values less than (19980531),
partition p1998_06 values less than (19980631),
partition p1998_07 values less than (19980731),
partition p1998_08 values less than (19980831),
partition p1998_09 values less than (19980931),
partition p1998_10 values less than (19981031),
partition p1998_11 values less than (19981131),
partition p1998_12 values less than (19981231)
) ;