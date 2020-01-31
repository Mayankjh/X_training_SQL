create DATABASE music;
Go

USE Music;

CREATE TABLE Artists (
  ArtistId int IDENTITY(1,1) PRIMARY KEY,
  ArtistName nvarchar(255) NOT NULL,
  ActiveFrom date
);
GO

CREATE TABLE Genres (
  GenreId int IDENTITY(1,1) PRIMARY KEY,
  Genre nvarchar(50) NOT NULL
);
Go

CREATE TABLE Albums (
  AlbumId int IDENTITY(1,1) PRIMARY KEY,
  AlbumName nvarchar(255) NOT NULL,
  ReleaseDate date NOT NULL,
  ArtistId int NOT NULL,
  GenreId int NOT NULL

  CONSTRAINT FK_Albums_Artists FOREIGN KEY (ArtistId)     
    REFERENCES Artists (ArtistId)     
    ON DELETE NO ACTION    
    ON UPDATE NO ACTION    
);
Go

SELECT column_name, data_type, character_maximum_length, is_nullable 
FROM information_schema.columns;

SELECT column_name, data_type, character_maximum_length, is_nullable 
FROM information_schema.columns 
WHERE table_name = 'Artists';

ALTER TABLE Albums
ADD CONSTRAINT FK_Albums_Genres FOREIGN KEY (GenreId)     
	REFERENCES Genres (GenreId)     
	ON DELETE NO ACTION    
	ON UPDATE NO ACTION