-- Scientists
-- 6.1 List all the scientists' names, their projects' names, 
    -- and the hours worked by that scientist on each project, 
    -- in alphabetical order of project name, then scientist name.
SELECT s.Name, Project, Hours FROM Scientists s JOIN AssignedTo a ON s.SSN = a.Scientist JOIN Projects p ON a.Project = p.Code ORDER BY Project, Scientist;

-- 6.2 Select the project names which are not assigned yet
SELECT Name FROM Projects WHERE Name NOT IN (SELECT Project FROM AssignedTo);