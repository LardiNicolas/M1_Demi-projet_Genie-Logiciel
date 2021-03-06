DROP TABLE InfoCereale;
DROP TABLE Reception;
DROP TABLE Expedition;
DROP TABLE Cellule;

CREATE TABLE InfoCereale (
    Catégorie VARCHAR(50), /* Blé, orge, pois, proteagineux, colza */
    Poids number(2), /* moyenne en grammes */
    Qualité VARCHAR(50),  /* Mauvais, Bon, Excellent*/
    NoLot number(5), /* Numero du lot sur 5 chiffres max */
    VolumeLot number(5), /*en volume unitaire t'es chiant si tu dépasse 1370 m3 */
    PRIMARY KEY (NoLot) 
);

CREATE TABLE Reception (
    Acheminement VARCHAR(50), /* Train, Routier, Bateau, Aérien */
    NoCellule number(2), /* Numéro de la cellule dans laquelle il va être stocké */
    NoRecepLot number(5),
    NoRecep number(5),
    FOREIGN KEY (NoRecepLot) REFERENCES InfoCereale(NoLot),
    PRIMARY KEY (NoRecep) 
);

CREATE TABLE Cellule (
    Nettoyage DATE,
    Ventilation DATE,
    Traitement DATE,
    PoidsMax number(5), /* en volume unitaire de 410 à 1370 m3 */
    NoCell number(2),
    NoCellLot number(5),
    FOREIGN KEY (NoCellLot) REFERENCES InfoCereale(NoLot),
    PRIMARY KEY (NoCell)
);

CREATE TABLE Expedition (
    SocieteTransport VARCHAR(50), 
    TempsExpeditionPrevu number(2), /* en heure */
    Destination VARCHAR(50), /* Ville */
    NoExpeLot number(5),
    NoExpe number(5),
    FOREIGN KEY (NoExpeLot) REFERENCES InfoCereale(NoLot),
    PRIMARY KEY (NoExpe)
);

/* petit test d'intégration */
INSERT INTO InfoCereale VALUES('Blé', 10, 'Bon', 225, 445);
INSERT INTO Reception VALUES('Routier',2,225,1);

INSERT INTO InfoCereale VALUES('Blé', 6, 'Mauvais', 226, 1200);
INSERT INTO Cellule VALUES(current DATE,current DATE,current DATE, 1300, 2, 226, 3);

INSERT INTO InfoCereale VALUES('Blé', 10, 'Bon', 227, 4);
INSERT INTO Reception VALUES('BazinMobile',35,'TonnerreCity',227,4);
