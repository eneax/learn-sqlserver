-- Create a database called Music
CREATE DATABASE Music;

-- Switch over to the Music database
USE Music;

-- Create Artist Table
CREATE TABLE Artists (
	ArtistID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,		-- first column, integer, starts at 1 and increments by 1, cannot contain null values, unique identifier field for the table
	ArtistName NVARCHAR(255) NOT NULL,						-- accepts variable-length Unicode string data, with a maximum length of 255 characters
	ActiveFrom DATE
);
GO

-- Create Genres Table
CREATE TABLE Genres (
    GenreID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Genre NVARCHAR(50) NOT NULL
);

-- Create Music Table
CREATE TABLE Albums (
    AlbumID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    AlbumName NVARCHAR(255) NOT NULL,
    ReleaseDate DATE NOT NULL,
    ArtistID INT NOT NULL,
    GenreID INT NOT NULL

    -- Create a relationship between the Albums and Artists tables
    -- Albums.ArtistId becomes a foreign key of Artists.ArtistId
    CONSTRAINT FK_Albums_Artists FOREIGN KEY (ArtistID)
        REFERENCES dbo.Artists (ArtistID)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
        -- ON DELETE CASCADE if you want to be able to delete the parent and the child in one go 
);



-- Retrieve Table Information
USE Music;
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS;

-- Retrieve Table Information a WHERE clause:
USE Music;
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Artists';



-- Add a new relationship between the Genres and Albums tables
ALTER TABLE Albums
ADD CONSTRAINT FK_Albums_Genres FOREIGN KEY (GenreID)
    REFERENCES dbo.Genres (GenreID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
;



-- Single Column Foreign Keys
CREATE TABLE Albums2 (
    AlbumID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    AlbumName NVARCHAR(255) NOT NULL,
    ReleaseDate DATE NOT NULL,
    ArtistID INT NOT NULL
        REFERENCES Artists(ArtistID),
    GenreID INT NOT NULL
);




-- Multicolumn Foreign Keys
CONSTRAINT FK_Albums_Artists FOREIGN KEY (ArtistId, ArtistName)
    REFERENCES dbo.Artists (ArtistId, ArtistName)



-- Insert Data by SQL Script
INSERT INTO Artists (ArtistName, ActiveFrom)
VALUES
    ('Iron Maiden','1975-12-25'),
    ('AC/DC','1973-01-11'), 
    ('Allan Holdsworth','1969-01-01'),
    ('Buddy Rich','1919-01-01'),
    ('Devin Townsend','1993-01-01'),
    ('Jim Reeves','1948-01-01'),
    ('Tom Jones','1963-01-01'),
    ('Maroon 5','1994-01-01'),
    ('The Script','2001-01-01'),
    ('Lit','1988-06-26'),
    ('Black Sabbath','1968-01-01'),
    ('Michael Learns to Rock','1988-03-15'),
    ('Carabao','1981-01-01'),
    ('Karnivool','1997-01-01'),
    ('Birds of Tokyo','2004-01-01'),
    ('Bodyjar','1990-01-01');

SELECT * 
FROM Artists;


INSERT INTO Genres (Genre)
VALUES
    ('Rock'),
    ('Jazz'), 
    ('Country'),
    ('Pop'),
    ('Blues'),
    ('Hip Hop'),
    ('Rap'),
    ('Punk');


INSERT INTO Albums (AlbumName, ReleaseDate, ArtistID, GenreID)
VALUES
    ('Powerslave', '1984-09-03', 1, 1),
    ('Powerage', '1978-05-05', 2, 1), 
    ('Singing Down the Lane', '1956-01-01', 6, 3),
    ('Ziltoid the Omniscient', '2007-05-21', 5, 1),
    ('Casualties of Cool', '2014-05-14', 5, 1),
    ('Epicloud', '2012-09-18', 5, 1),
    ('Somewhere in Time', '1986-09-29', 1, 1),	
    ('Piece of Mind', '1983-05-16', 1, 1),	
    ('Killers', '1981-02-02', 1, 1),	
    ('No Prayer for the Dying', '1990-10-01', 1, 1),	
    ('No Sound Without Silence', '2014-09-12', 9, 4),	
    ('Big Swing Face', '1967-06-01', 4, 2),	
    ('Blue Night', '2000-11-01', 12, 4),	
    ('Eternity', '2008-10-27', 12, 4),	
    ('Scandinavia', '2012-06-11', 12, 4),	
    ('Long Lost Suitcase', '2015-10-09', 7, 4),	
    ('Praise and Blame', '2010-06-26', 7, 4),	
    ('Along Came Jones', '1965-05-21', 7, 4),	
    ('All Night Wrong', '2002-05-05', 3, 2),	
    ('The Sixteen Men of Tain', '2000-03-20', 3, 2);



-- Create a Query
SELECT *
FROM Artists;

SELECT * 
FROM Albums;

SELECT *
FROM Genres;



-- Create a Query: Specify the columns
SELECT AlbumID, AlbumName, ArtistID
FROM Albums;



-- Create a Query: Narrow the Criteria
SELECT AlbumID, AlbumName, ArtistID
FROM Albums
WHERE ArtistID = 1;



-- Create a Query: Join Another Table 
-- Join returns results from multiple tables that share data.
-- Join is typically used where the foreign key of one table matches the primary key of another.
SELECT AlbumID, AlbumName, ArtistName
FROM Albums
    INNER JOIN Artists
    ON Albums.ArtistID = Artists.ArtistID
WHERE ReleaseDate < '1980-01-01';



-- Create a Query: Add an Alias
SELECT al.AlbumID, al.AlbumName, ar.ArtistName
FROM Albums AS al
    INNER JOIN Artists AS ar
    ON al.ArtistID = ar.ArtistID
WHERE al.ReleaseDate < '1980-01-01';



-- Create a Query: Format the Date
/*
    In SQL Server there are different data types for storing dates, 
    (such as date, time, datetime, smalldatetime, etc) 
    and there are many different functions for dealing with dates 
    (for example SYSDATETIME(), GETDATE( ), CURRENT_TIMESTAMP, etc).
*/
-- YEAR() function returns just the year part of the date
SELECT AlbumName, YEAR(ReleaseDate) AS Year
FROM Albums;



-- Create a View
/*
    - In SQL Server, a view is a virtual table whose contents are defined by a query. 
    - It is basically a pre-written query that is stored on the database.
    - Views are referred to as virtual tables because they can pull together data 
      from multiple tables, as well as aggregate data, 
      and present it as though it is a single table.
*/
CREATE VIEW RockAlbums
AS
SELECT AlbumName, ArtistName
FROM Albums
    INNER JOIN Artists
    ON Albums.ArtistID = Artists.ArtistID
    INNER JOIN Genres
    ON Albums.GenreID = Genres.GenreID
WHERE Genres.Genre = 'Rock';

SELECT * 
FROM RockAlbums;




-- Alter a View
ALTER VIEW RockAlbums
AS
SELECT AlbumName, ArtistName, ReleaseDate
FROM Albums
    INNER JOIN Artists
    ON Albums.ArtistID = Artists.ArtistID
    INNER JOIN Genres
    ON Albums.GenreID = Genres.GenreID
WHERE Genres.Genre = 'Rock';

SELECT * 
FROM RockAlbums
WHERE ReleaseDate > '1985-01-01';



-- Stored Procedures is a group of SQL statements compiled into one
CREATE PROCEDURE
spAlbumsFromArtist
    @ArtistName VARCHAR(255)
AS
    SELECT AlbumName, ReleaseDate
    FROM Albums
    INNER JOIN Artists
    ON Albums.ArtistID = Artists.ArtistID
    WHERE Artists.ArtistName = @ArtistName;
GO

/*
    Now that the stored procedure has been created, 
    you can run it by using a EXECUTE statement and passing any required parameters.
*/
EXECUTE spAlbumsFromArtist
@ArtistName = 'Devin Townsend';

-- Alter a Stored Procedure
ALTER PROCEDURE
spAlbumsFromArtist
    @ArtistName VARCHAR(255)
AS
    SELECT
        al.AlbumName,
        al.ReleaseDate,
        g.Genre
    FROM Albums al
        INNER JOIN Artists ar
        ON al.ArtistID = ar.ArtistID
        INNER JOIN Genres g
        ON g.GenreID = al.GenreID
    WHERE ar.ArtistName = @ArtistName;
GO

/*
    Now that we've added the Genre column to the view, 
    the stored procedure now returns that column when we execute it.
*/
EXECUTE spAlbumsFromArtist
@ArtistName = 'Devin Townsend';



-- Backup a DB Using Transact-SQL
/*
    Below is an example of a simple backup script on a Linux or Mac system. 
    The script specifies the database to backup, and the location to back it up to.
*/
BACKUP DATABASE Music  
TO DISK = '/var/opt/mssql/data/Music.bak';

-- On a Windows system, the path will use backslashes:
BACKUP DATABASE Music  
TO DISK = 'C:\Backups\Music.bak';



-- How to Copy a File from Host to Docker Container

-- Create a new folder in the Docker container that we can place the .bak file into
$ sudo docker exec -it Homer mkdir /var/opt/mssql/backup

-- Copy the file to the Docker container (this assumes that you're in the same folder as the .bak file)
$ sudo docker cp WideWorldImportersDW-Full.bak Homer:/var/opt/mssql/backup