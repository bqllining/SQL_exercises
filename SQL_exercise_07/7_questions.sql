-- Planet_Express 
-- 7.1 Who receieved a 1.5kg package?
    -- The result is "Al Gore's Head".
SELECT Name FROM Client c WHERE AccountNumber = (SELECT Recipient FROM Package WHERE Weight = 2);
SELECT Recipient FROM Package WHERE Weight = 1.5;
-- !! 未知错误

-- 7.2 What is the total weight of all the packages that he sent?
-- !!! 不会