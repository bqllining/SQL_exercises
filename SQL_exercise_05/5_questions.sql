-- Pieces_and_providers
-- 5.1 Select the name of all the pieces. 
SELECT Name FROM Pieces;

-- 5.2  Select all the providers' data. 
SELECT * FROM Providers;

-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).
SELECT Piece, AVG(Price) FROM Provides GROUP BY Piece;

-- 5.4  Obtain the names of all providers who supply piece 1.
SELECT Provider FROM Provides WHERE Piece = 1;

-- 5.5 Select the name of pieces provided by provider with code "HAL".
SELECT a.Name,c.Code FROM (Pieces a INNER JOIN Provides b ON a.Code = b.Piece) JOIN Providers c ON c.Code = b.Provider WHERE c.Code = 'HAL'; 

-- 5.6
-- ---------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Interesting and important one.
-- For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).
SELECT a.Name, b.Provider, Max(Price) FROM Pieces a, Provides b WHERE a.Code = b.Piece GROUP BY a.Name, b.Provider;
-- !!!!!!写的还是不对
-- ---------------------------------------------
-- 5.7 Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
INSERT INTO Provides VALUES(1,'TNBC', 7);


-- 5.8 Increase all prices by one cent.
UPDATE Provides SET Price = Price + 1;

-- 5.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
UPDATE Provides SET Piece = NULL WHERE Provider = 'RBT' AND Piece = 4;
-- !! 不会

-- 5.10 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
    -- (the provider should still remain in the database).
UPDATE Provides SET Piece = NULL WHERE Provider = (SELECT Name FROM Providers WHERE Code = 'RBT');
-- !! 不会