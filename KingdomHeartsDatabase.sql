CREATE DATABASE kingdom_hearts;
USE kingdom_hearts;

CREATE TABLE Game (
    gameId VARCHAR(15) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    releaseDate DATE,
    platform VARCHAR(50)
);

CREATE TABLE Organization (
    organizationId VARCHAR(15) PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE World (
    worldId VARCHAR(15) PRIMARY KEY,
    gameId VARCHAR(15) NOT NULL,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(30),
    FOREIGN KEY (gameId) REFERENCES Game(gameId)
);

CREATE TABLE Voiced_Actor (
    voiceActorId VARCHAR(15) PRIMARY KEY,
    actorName VARCHAR(50) NOT NULL,
    language VARCHAR(20)
);

CREATE TABLE Characters (
    characterId VARCHAR(15) PRIMARY KEY,
    gameId VARCHAR(15) NOT NULL,
    organizationId VARCHAR(15) NOT NULL,
    name VARCHAR(30) NOT NULL,
    originWorld VARCHAR(30),
    alignment VARCHAR(20),
    FOREIGN KEY (gameId) REFERENCES Game(gameId),
    FOREIGN KEY (organizationId) REFERENCES Organization(organizationId)
);

CREATE TABLE Keyblade (
    keybladeId VARCHAR(15) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(200)
);

CREATE TABLE Keyblade_Element (
    keybladeId VARCHAR(15) NOT NULL,
    element VARCHAR(20) NOT NULL,
    PRIMARY KEY (keybladeId, element),
    FOREIGN KEY (keybladeId) REFERENCES Keyblade(keybladeId)
);

CREATE TABLE Asset (
    assetId VARCHAR(15) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(30)
);

CREATE TABLE Wields (
    keybladeId VARCHAR(15) NOT NULL,
    characterId VARCHAR(15) NOT NULL,
    PRIMARY KEY (keybladeId, characterId),
    FOREIGN KEY (keybladeId) REFERENCES Keyblade(keybladeId),
    FOREIGN KEY (characterId) REFERENCES Characters(characterId)
);

CREATE TABLE Appears_in (
    characterId VARCHAR(15) NOT NULL,
    worldId VARCHAR(15) NOT NULL,
    PRIMARY KEY (characterId, worldId),
    FOREIGN KEY (characterId) REFERENCES Characters(characterId),
    FOREIGN KEY (worldId) REFERENCES World(worldId)
);

CREATE TABLE Voiced_By (
    characterId VARCHAR(15) NOT NULL,
    voiceActorId VARCHAR(15) NOT NULL,
    PRIMARY KEY (characterId, voiceActorId),
    FOREIGN KEY (characterId) REFERENCES Characters(characterId),
    FOREIGN KEY (voiceActorId) REFERENCES Voiced_Actor(voiceActorId)
);

CREATE TABLE Used_Assets (
    gameId VARCHAR(15) NOT NULL,
    assetId VARCHAR(15) NOT NULL,
    PRIMARY KEY (gameId, assetId),
    FOREIGN KEY (gameId) REFERENCES Game(gameId),
    FOREIGN KEY (assetId) REFERENCES Asset(assetId)
);

-- Inserting Data Into tables -- 
INSERT INTO Game VALUES
('ZeroOne', 'Kingdom Hearts', '2002-03-28', 'PlayStation 2'),
('ZeroFour', 'Kingdom Hearts 358/2 Days', '2009-09-29', 'Nintendo DS'),
('Two', 'Kingdom Hearts Birth by Sleep', '2010-01-09', 'PSP'),
('ZeroTwo', 'Kingdom Hearts Final Mix', '2002-12-26', 'PlayStation 2'),
('ZeroThree', 'Kingdom Hearts Chain of Memories', '2004-12-07', 'Game Boy Advance'),
('ZeroFive', 'Kingdom Hearts II', '2005-12-22', 'PlayStation 2'),
('ZeroSix', 'Kingdom Hearts Re:coded', '2010-10-07', 'Nintendo DS'),
('ZeroSeven', 'Kingdom Hearts 3D: Dream Drop Distance', '2012-03-29', 'Nintendo 3DS'),
('ZeroEight', 'Kingdom Hearts III', '2019-01-25', 'PlayStation 4'),
('ZeroNine', 'Kingdom Hearts Melody of Memory', '2020-11-11', 'Nintendo Switch'),
('Ten', 'Kingdom Hearts Union χ', '2016-09-03', 'Mobile'),
('Eleven', 'Kingdom Hearts Dark Road', '2020-06-22', 'Mobile');

INSERT INTO Organization VALUES
('Org00', 'Unaligned'),
('Org01', 'Organization XIII'),
('Org02', 'Land of Departure Masters'),
('Org03', 'Hollow Bastion Restoration Committee'),
('Org04', 'Radiant Garden'),
('Org05', 'Disney Castle'),
('Org06', 'Twilight Town Residents'),
('Org07', 'Wayfinder Trio'),
('Org08', 'Guardians of Light'),
('Org09', 'Seekers of Darkness');

INSERT INTO World VALUES
('W01', 'ZeroOne', 'Destiny Islands', 'Tropical'),
('W02', 'ZeroOne', 'Traverse Town', 'Urban'),
('W03', 'Two', 'Land of Departure', 'Mystic'),
('W04', 'ZeroFour', 'Twilight Town', 'Dusk'),
('W05', 'ZeroFive', 'Hollow Bastion', 'Ruins'),
('W06', 'ZeroFive', 'The World That Never Was', 'Dark Realm'),
('W07', 'ZeroTwo', 'Traverse Town (FM)', 'Urban'),
('W08', 'ZeroEight', 'San Fransokyo', 'City'),
('W09', 'ZeroEight', 'Kingdom of Corona', 'Fantasy'),
('W10', 'ZeroSeven', 'The Grid', 'Digital'),
('W11', 'ZeroNine', 'Musical Realm', 'Rhythm'),
('W12', 'ZeroSix', 'Data World', 'Digital');

INSERT INTO Voiced_Actor VALUES
('VA01', 'Haley Joel Osment', 'English'),
('VA02', 'David Gallagher', 'English'),
('VA03', 'Alyson Stoner', 'English'),
('VA04', 'Miyu Irino', 'Japanese'),
('VA05', 'Jesse McCartney', 'English'),
('VA06', 'Willa Holland', 'English'),
('VA07', 'Jason Dohring', 'English'),
('VA08', 'Koki Uchiyama', 'Japanese'),
('VA09', 'Mamoru Miyano', 'Japanese'),
('VA10', 'Risa Uchida', 'Japanese'),
('VA11', 'Ben Diskin', 'English'),
('VA12', 'Richard Epcar', 'English');

INSERT INTO Characters VALUES
('Char01', 'ZeroOne', 'Org00', 'Sora', 'Destiny Islands', 'Light'),
('Char02', 'ZeroOne', 'Org00', 'Riku', 'Destiny Islands', 'Light/Dark'),
('Char03', 'ZeroOne', 'Org00', 'Kairi', 'Destiny Islands', 'Light'),
('Char04', 'ZeroFour', 'Org01', 'Roxas', 'Twilight Town', 'Neutral'),
('Char05', 'ZeroFour', 'Org01', 'Axel', 'Twilight Town', 'Neutral'),

('Char06', 'Two', 'Org02', 'Aqua', 'Land of Departure', 'Light'),
('Char07', 'Two', 'Org02', 'Terra', 'Land of Departure', 'Light/Dark'),
('Char08', 'Two', 'Org02', 'Ventus', 'Land of Departure', 'Light'),
('Char09', 'ZeroFive', 'Org04', 'Leon', 'Hollow Bastion', 'Neutral'),

('Char10', 'ZeroFive', 'Org04', 'Yuffie', 'Hollow Bastion', 'Light'),
('Char11', 'ZeroFive', 'Org04', 'Aerith', 'Hollow Bastion', 'Light'),
('Char12', 'ZeroEight', 'Org08', 'Mickey', 'Disney Castle', 'Light'),
('Char13', 'ZeroSeven', 'Org09', 'Xehanort', 'The World That Never Was', 'Dark'),
('Char14', 'ZeroFive', 'Org01', 'Saix', 'The World That Never Was', 'Neutral'),
('Char15', 'ZeroSeven', 'Org08', 'Roxas', 'Twilight Town', 'Light');

INSERT INTO Keyblade VALUES
('KB01', 'Kingdom Key', 'Sora’s Keyblade'),
('KB02', 'Way to the Dawn', 'Riku’s Keyblade'),
('KB03', 'Oathkeeper', 'Kairi’s symbolic Keyblade'),
('KB04', 'Oblivion', 'A blade born from sorrow'),
('KB05', 'Kingdom Key D', 'Mickey’s Keyblade'),
('KB06', 'Fatal Flame', 'A fiery beginner blade'),
('KB07', 'Guardian Bell', 'Protective magic blade'),
('KB08', 'Star Seeker', 'A Keyblade infused with starlight'),
('KB09', 'Bond of Flame', 'Axel’s fire Keyblade'),
('KB10', 'Master Keeper', 'A master-level Keyblade'),
('KB11', 'Rain Storm', 'Wind-aligned Keyblade');

INSERT INTO Keyblade_Element VALUES
('KB01', 'Light'),
('KB02', 'Dark'),
('KB03', 'Light'),
('KB04', 'Dark'),
('KB04', 'Shadow'),
('KB05', 'Light'),
('KB06', 'Fire'),
('KB07', 'Defense'),
('KB08', 'Magic'),
('KB09', 'Fire'),
('KB10', 'Light'),
('KB11', 'Wind'),
('KB11', 'Magic');

INSERT INTO Asset VALUES
('A01', 'SoraModel', 'Model'),
('A02', 'HeartlessModel', 'Model'),
('A03', 'KeybladeSound', 'Audio'),
('A04', 'AxelModel', 'Model'),
('A05', 'TwilightMusic', 'Audio'),
('A06', 'BattleTheme1', 'Audio'),
('A07', 'FireFX', 'FX'),
('A08', 'WindFX', 'FX'),
('A09', 'KeybladeTrail', 'FX'),
('A10', 'Cutscene01', 'Video'),
('A11', 'EnemyShadow', 'Model'),
('A12', 'SanFransokyoMap', 'Texture');

INSERT INTO Wields VALUES
('KB01', 'Char01'),
('KB02', 'Char02'),
('KB03', 'Char03'),
('KB04', 'Char04'),
('KB05', 'Char12'),
('KB09', 'Char05'),
('KB10', 'Char06'),
('KB11', 'Char08'),
('KB08', 'Char01'),
('KB07', 'Char03'),
('KB06', 'Char10'),
('KB04', 'Char13');

INSERT INTO Appears_in VALUES
('Char01', 'W01'),
('Char02', 'W01'),
('Char03', 'W01'),
('Char04', 'W04'),
('Char05', 'W04'),
('Char06', 'W03'),

('Char07', 'W03'),
('Char08', 'W03'),
('Char04', 'W06'),
('Char05', 'W06'),
('Char09', 'W05'),
('Char10', 'W05'),

('Char11', 'W05'),
('Char12', 'W02'),
('Char13', 'W06'),
('Char14', 'W06'),
('Char15', 'W04'),
('Char09', 'W07'),
('Char11', 'W07'),
('Char12', 'W08');

INSERT INTO Voiced_By VALUES
('Char01', 'VA01'),
('Char02', 'VA02'),
('Char03', 'VA03'),
('Char04', 'VA04'),

('Char04', 'VA05'),
('Char05', 'VA11'),
('Char06', 'VA07'),
('Char07', 'VA07'),
('Char08', 'VA05'),

('Char09', 'VA12'),
('Char10', 'VA11'),
('Char11', 'VA06'),
('Char12', 'VA01'),
('Char13', 'VA12'),
('Char14', 'VA12'),
('Char15', 'VA05');

INSERT INTO Used_Assets VALUES
('ZeroOne', 'A01'),
('ZeroOne', 'A02'),
('ZeroOne', 'A03'),
('Two', 'A03'),
('ZeroFour', 'A02'),
('ZeroOne', 'A04'),
('ZeroOne', 'A05'),
('ZeroFour', 'A11'),
('Two', 'A10'),
('ZeroFive', 'A06'),
('ZeroFive', 'A07'),
('ZeroEight', 'A12'),
('ZeroSeven', 'A09'),
('ZeroSeven', 'A08'),
('ZeroNine', 'A05'),
('ZeroThree', 'A06');







