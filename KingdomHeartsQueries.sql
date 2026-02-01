USE kingdom_hearts;
-- WHERE --
-- Show all characters whose alignment is 'Light'.
SELECT characterId, name, alignment
FROM Characters
WHERE alignment = 'Light';

-- Show all characters whose origin world is 'Hollow Bastion'.
SELECT characterId, name, originWorld
FROM Characters
WHERE originWorld = 'Hollow Bastion';

-- WHERE IN--
-- Show characters who belong to either Organization XIII or the Land of Departure Masters.
SELECT characterId, name, organizationId
FROM Characters
WHERE organizationId IN ('Org01', 'Org02');

-- Show details of characters who belong to any of three major organizations.
SELECT characterId, name, organizationId
FROM Characters
WHERE organizationId IN ('Org01', 'Org02', 'Org04');

-- WHERE BETWEEN --
-- Show games released between 2005 and 2015.
SELECT gameId, title, releaseDate
FROM Game
WHERE releaseDate BETWEEN '2005-01-01' AND '2015-12-31';

-- Show games released between 2005 and 2020.
SELECT title, releaseDate
FROM Game
WHERE releaseDate BETWEEN '2005-01-01' AND '2020-12-31';

-- WHERE LIKE --
-- Find all worlds with names that end in 'Town'.
SELECT worldId, name
FROM World
WHERE name LIKE '%Town';

-- List all worlds with 'Town' anywhere in the name.
SELECT worldId, name
FROM World
WHERE name LIKE '%Town%';

-- WHERE using multiple conditions --
-- Show characters who are aligned with light AND appeared in 'ZeroOne'.
SELECT characterId, name, alignment
FROM Characters
WHERE alignment = 'Light'
  AND gameId = 'ZeroOne';

-- Date --
-- Extract the year each game was released.
SELECT gameId, title, YEAR(releaseDate) AS releaseYear
FROM Game;

-- Show how many years old each game is.
SELECT title, TIMESTAMPDIFF(YEAR, releaseDate, CURDATE()) AS yearsSinceRelease
FROM Game;

-- INNER JOIN --
-- Show characters along with the game they first appeared in.
SELECT c.name AS characterName, g.title AS firstGame
FROM Characters c
JOIN Game g ON c.gameId = g.gameId;

-- List each character and the name of the organization they belong to.
SELECT c.name AS characterName, o.name AS organizationName
FROM Characters c
JOIN Organization o ON c.organizationId = o.organizationId;

-- Show which voice actor voices which character and the language used.
SELECT c.name AS characterName, v.actorName AS voiceActor, v.language
FROM Characters c
JOIN Voiced_By vb ON c.characterId = vb.characterId
JOIN Voiced_Actor v ON vb.voiceActorId = v.voiceActorId;

-- MIN(), MAX() --
-- Show the earliest and latest game release dates.
SELECT MIN(releaseDate) AS earliestRelease, MAX(releaseDate) AS latestRelease
FROM Game;

-- GROUP BY --
-- Count how many characters belong to each organization.
SELECT organizationId, COUNT(characterId) AS totalMembers
FROM Characters
GROUP BY organizationId;

-- Show organizations that have more than 1 character.
SELECT organizationId, COUNT(characterId) AS totalMembers
FROM Characters
GROUP BY organizationId
HAVING COUNT(characterId) > 1;

-- Show organizations that have 2 or more characters.
SELECT organizationId, COUNT(*) AS members
FROM Characters
GROUP BY organizationId
HAVING COUNT(*) >= 2;

-- Count how many characters belong to each organization.
SELECT organizationId, COUNT(*) AS members
FROM Characters
GROUP BY organizationId;

-- ORDER BY --
-- List all games ordered by release date (oldest first).
SELECT gameId, title, releaseDate
FROM Game
ORDER BY releaseDate ASC;

-- List characters alphabetically by name in reverse order.
SELECT characterId, name
FROM Characters
ORDER BY name DESC;

-- LEFT JOIN --
-- Show all characters and any Keyblades they wield (include characters with none).
SELECT c.name AS characterName, k.name AS keybladeName
FROM Characters c
LEFT JOIN Wields w ON c.characterId = w.characterId
LEFT JOIN Keyblade k ON w.keybladeId = k.keybladeId;

-- Show all Keyblades and which character wields them (include unassigned Keyblades).
SELECT k.name AS keybladeName, c.name AS characterName
FROM Keyblade k
LEFT JOIN Wields w ON k.keybladeId = w.keybladeId
LEFT JOIN Characters c ON w.characterId = c.characterId;

-- RIGHT JOIN --
-- Show all Keyblades and the characters who wield them (include Keyblades wielded by no one).
SELECT k.name AS keybladeName, c.name AS characterName
FROM Characters c
RIGHT JOIN Wields w ON c.characterId = w.characterId
RIGHT JOIN Keyblade k ON w.keybladeId = k.keybladeId;

-- AGGREGATE + JOIN --
-- Count how many Keyblades use each element type.
SELECT element, COUNT(*) AS totalKeyblades
FROM Keyblade_Element
GROUP BY element;

-- MULTI-CONDITION WHERE --
-- Find all characters aligned with Light or Neutral who originate from Twilight Town.
SELECT characterId, name, alignment, originWorld
FROM Characters
WHERE originWorld = 'Twilight Town'
  AND alignment IN ('Light', 'Neutral');

-- MULTIPLE QUERIES -- 
-- Show characters who wield more than one Keyblade.
SELECT c.name
FROM Characters c
WHERE c.characterId IN (
    SELECT characterId
    FROM Wields
    GROUP BY characterId
    HAVING COUNT(*) > 1
);
-- DISTNCT --
-- List all unique world types.
SELECT DISTINCT type
FROM World;
