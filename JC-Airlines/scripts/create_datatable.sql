CREATE TABLE `lennot` (
  `LentoID` int(11) NOT NULL,
  `LähtöMaa` varchar(255) NOT NULL,
  `LähtöKaupunki` varchar(255) NOT NULL,
  `KohdeMaa` varchar(255) NOT NULL,
  `KohdeKaupunki` varchar(255) NOT NULL,
  `Aika` varchar(20) NOT NULL,
  `Kone` varchar(20) NOT NULL,
  `LipunHinta` decimal(7,2) NOT NULL,
  `VapaatPaikat` int(5) NOT NULL,
  PRIMARY KEY (`LentoID`)
);

-- Generated with the help of ChatGPT --
INSERT INTO Flights (LentoID, LähtöMaa, LähtöKaupunki, KohdeMaa, KohdeKaupunki, Aika, Kone, LipunHinta, VapaatPaikat) VALUES
(1, 'Suomi', 'Oulu', 'Suomi', 'Helsinki', 'Aamu', 'Bombardier Q400', 75.50, 32),
(2, 'Suomi', 'Oulu', 'Suomi', 'Rovaniemi', 'Ilta', 'Embraer E195', 85.00, 12),
(3, 'Suomi', 'Helsinki', 'Suomi', 'Oulu', 'Päivä', 'Airbus A320', 92.30, 42),
(4, 'Suomi', 'Helsinki', 'Norja', 'Oslo', 'Ilta', 'Boeing 737 MAX', 140.50, 57),
(5, 'Norja', 'Oslo', 'Suomi', 'Rovaniemi', 'Aamu', 'Airbus A321', 155.00, 28),
(6, 'Suomi', 'Helsinki', 'Ruotsi', 'Stockholm', 'Aamu', 'Airbus A320', 120.50, 27),
(7, 'Ruotsi', 'Göteborg', 'Suomi', 'Helsinki', 'Aamu', 'Airbus A350', 250.00, 6),
(8, 'Ruotsi', 'Malmö', 'Norja', 'Bergen', 'Ilta', 'Boeing 737 MAX', 115.00, 51),
(9, 'Tanska', 'Kööpenhamina', 'Suomi', 'Oulu', 'Päivä', 'Airbus A320', 105.00, 21),
(10, 'Islanti', 'Keflavík', 'Suomi', 'Helsinki', 'Ilta', 'Airbus A350', 180.00, 11),
(11, 'Suomi', 'Oulu', 'Suomi', 'Helsinki', 'Päivä', 'Boeing 737 MAX', 110.00, 17),
(12, 'Norja', 'Oslo', 'Ruotsi', 'Malmö', 'Päivä', 'Airbus A320', 120.00, 43),
(13, 'Tanska', 'Kööpenhamina', 'Norja', 'Oslo', 'Ilta', 'Boeing 737-800', 125.00, 15),
(14, 'Ruotsi', 'Stockholm', 'Suomi', 'Helsinki', 'Päivä', 'Boeing 737-800', 125.00, 38),
(15, 'Tanska', 'Billund', 'Suomi', 'Helsinki', 'Päivä', 'Airbus A321', 120.00, 34),
(16, 'Suomi', 'Rovaniemi', 'Suomi', 'Oulu', 'Ilta', 'Bombardier Q400', 80.00, 48),
(17, 'Suomi', 'Helsinki', 'Norja', 'Trondheim', 'Aamu', 'Boeing 787 Dreamline', 220.00, 3),
(18, 'Norja', 'Oslo', 'Ruotsi', 'Göteborg', 'Päivä', 'Airbus A350', 180.00, 19),
(19, 'Tanska', 'Kööpenhamina', 'Suomi', 'Rovaniemi', 'Päivä', 'Boeing 737 MAX', 140.00, 36),
(20, 'Ruotsi', 'Göteborg', 'Islanti', 'Keflavík', 'Ilta', 'Airbus A321', 155.00, 9),
(21, 'Suomi', 'Oulu', 'Suomi', 'Helsinki', 'Aamu', 'Airbus A320', 95.00, 44),
(22, 'Norja', 'Bergen', 'Ruotsi', 'Göteborg', 'Ilta', 'Boeing 737-800', 120.00, 38),
(23, 'Tanska', 'Kööpenhamina', 'Ruotsi', 'Malmö', 'Ilta', 'Embraer E195', 105.00, 33),
(24, 'Islanti', 'Keflavík', 'Suomi', 'Helsinki', 'Päivä', 'Airbus A320', 110.00, 56),
(25, 'Suomi', 'Oulu', 'Tanska', 'Billund', 'Päivä', 'Boeing 737 MAX', 120.00, 12),
(26, 'Norja', 'Oslo', 'Islanti', 'Keflavík', 'Ilta', 'Boeing 757', 145.00, 49),
(27, 'Suomi', 'Helsinki', 'Norja', 'Trondheim', 'Päivä', 'Airbus A320', 115.00, 41),
(28, 'Ruotsi', 'Malmö', 'Suomi', 'Rovaniemi', 'Aamu', 'Airbus A321', 130.00, 54),
(29, 'Islanti', 'Keflavík', 'Tanska', 'Kööpenhamina', 'Päivä', 'Boeing 737-800', 140.00, 63),
(30, 'Tanska', 'Billund', 'Norja', 'Oslo', 'Ilta', 'Embraer E190', 125.00, 27),
(31, 'Suomi', 'Oulu', 'Suomi', 'Helsinki', 'Aamu', 'Bombardier Q400', 85.00, 16),
(32, 'Norja', 'Bergen', 'Suomi', 'Oulu', 'Päivä', 'Airbus A350', 170.00, 53),
(33, 'Tanska', 'Kööpenhamina', 'Suomi', 'Oulu', 'Ilta', 'Boeing 737 MAX', 115.00, 44),
(34, 'Suomi', 'Helsinki', 'Ruotsi', 'Stockholm', 'Ilta', 'Airbus A321', 130.00, 50),
(35, 'Norja', 'Oslo', 'Ruotsi', 'Göteborg', 'Ilta', 'Airbus A320', 115.00, 26),
(36, 'Tanska', 'Kööpenhamina', 'Islanti', 'Keflavík', 'Päivä', 'Boeing 737 MAX', 120.00, 51),
(37, 'Suomi', 'Helsinki', 'Suomi', 'Rovaniemi', 'Ilta', 'Bombardier Q400', 85.00, 49),
(38, 'Ruotsi', 'Göteborg', 'Norja', 'Bergen', 'Päivä', 'Airbus A320', 120.00, 40),
(39, 'Tanska', 'Billund', 'Suomi', 'Helsinki', 'Ilta', 'Boeing 737-800', 110.00, 59),
(40, 'Islanti', 'Keflavík', 'Tanska', 'Kööpenhamina', 'Ilta', 'Airbus A350', 160.00, 8),
(41, 'Suomi', 'Rovaniemi', 'Norja', 'Trondheim', 'Päivä', 'Boeing 737 MAX', 130.00, 18),
(42, 'Norja', 'Bergen', 'Ruotsi', 'Malmö', 'Ilta', 'Boeing 737 MAX', 125.00, 31),
(43, 'Suomi', 'Helsinki', 'Tanska', 'Kööpenhamina', 'Päivä', 'Airbus A350', 180.00, 5),
(44, 'Ruotsi', 'Malmö', 'Norja', 'Oslo', 'Aamu', 'Airbus A320', 110.00, 41),
(45, 'Tanska', 'Kööpenhamina', 'Suomi', 'Rovaniemi', 'Päivä', 'Embraer E195', 100.00, 36),
(46, 'Suomi', 'Oulu', 'Ruotsi', 'Göteborg', 'Ilta', 'Boeing 737 MAX', 120.00, 24),
(47, 'Suomi', 'Rovaniemi', 'Suomi', 'Helsinki', 'Päivä', 'Bombardier Q400', 90.00, 37),
(48, 'Suomi', 'Helsinki', 'Ruotsi', 'Malmö', 'Ilta', 'Embraer E195', 105.00, 19),
(49, 'Norja', 'Oslo', 'Tanska', 'Billund', 'Päivä', 'Airbus A321', 145.00, 14),
(50, 'Islanti', 'Keflavík', 'Norja', 'Oslo', 'Ilta', 'Boeing 737 MAX', 135.00, 30),
(51, 'Suomi', 'Oulu', 'Ruotsi', 'Göteborg', 'Päivä', 'Airbus A320', 95.00, 11),
(52, 'Norja', 'Oslo', 'Suomi', 'Oulu', 'Ilta', 'Airbus A350', 180.00, 23),
(53, 'Tanska', 'Kööpenhamina', 'Suomi', 'Rovaniemi', 'Aamu', 'Boeing 737-800', 120.00, 45),
(54, 'Suomi', 'Helsinki', 'Islanti', 'Keflavík', 'Ilta', 'Embraer E195', 125.00, 38),
(55, 'Ruotsi', 'Malmö', 'Tanska', 'Kööpenhamina', 'Päivä', 'Boeing 737 MAX', 135.00, 33),
(56, 'Suomi', 'Rovaniemi', 'Ruotsi', 'Göteborg', 'Aamu', 'Airbus A320', 110.00, 12),
(57, 'Islanti', 'Keflavík', 'Suomi', 'Rovaniemi', 'Päivä', 'Airbus A350', 150.00, 8),
(58, 'Norja', 'Oslo', 'Suomi', 'Rovaniemi', 'Ilta', 'Boeing 787 Dreamline', 250.00, 2),
(59, 'Tanska', 'Kööpenhamina', 'Islanti', 'Keflavík', 'Aamu', 'Airbus A320', 120.00, 16),
(60, 'Suomi', 'Helsinki', 'Ruotsi', 'Malmö', 'Päivä', 'Boeing 737-800', 125.00, 18),
(61, 'Ruotsi', 'Göteborg', 'Norja', 'Oslo', 'Ilta', 'Boeing 737 MAX', 115.00, 10),
(62, 'Suomi', 'Oulu', 'Norja', 'Bergen', 'Päivä', 'Airbus A350', 150.00, 6),
(63, 'Norja', 'Bergen', 'Suomi', 'Oulu', 'Ilta', 'Bombardier Q400', 85.00, 27),
(64, 'Tanska', 'Billund', 'Ruotsi', 'Malmö', 'Aamu', 'Airbus A320', 105.00, 40),
(65, 'Islanti', 'Keflavík', 'Norja', 'Oslo', 'Päivä', 'Boeing 737 MAX', 140.00, 11),
(66, 'Tanska', 'Kööpenhamina', 'Ruotsi', 'Göteborg', 'Ilta', 'Airbus A321', 115.00, 33),
(67, 'Suomi', 'Helsinki', 'Tanska', 'Billund', 'Päivä', 'Embraer E195', 110.00, 14),
(68, 'Norja', 'Oslo', 'Suomi', 'Rovaniemi', 'Aamu', 'Airbus A350', 165.00, 5),
(69, 'Ruotsi', 'Malmö', 'Tanska', 'Kööpenhamina', 'Päivä', 'Boeing 737 MAX', 120.00, 19),
(70, 'Suomi', 'Oulu', 'Suomi', 'Rovaniemi', 'Ilta', 'Airbus A320', 95.00, 32),
(71, 'Suomi', 'Helsinki', 'Ruotsi', 'Malmö', 'Päivä', 'Airbus A320', 101.50, 20),
(72, 'Suomi', 'Helsinki', 'Tanska', 'Kööpenhamina', 'Ilta', 'Boeing 737 MAX', 119.99, 25),
(73, 'Suomi', 'Helsinki', 'Norja', 'Oslo', 'Päivä', 'Airbus A321', 111.25, 18),
(74, 'Suomi', 'Helsinki', 'Islanti', 'Keflavík', 'Ilta', 'Boeing 737 MAX', 139.99, 15),
(75, 'Suomi', 'Helsinki', 'Suomi', 'Oulu', 'Aamu', 'Bombardier Q400', 81.50, 35),
(76, 'Suomi', 'Helsinki', 'Suomi', 'Rovaniemi', 'Päivä', 'Airbus A320', 94.80, 28),
(77, 'Tanska', 'Kööpenhamina', 'Suomi', 'Helsinki', 'Päivä', 'Airbus A320', 96.45, 30),
(78, 'Tanska', 'Kööpenhamina', 'Ruotsi', 'Göteborg', 'Ilta', 'Boeing 737-800', 112.50, 40),
(79, 'Tanska', 'Kööpenhamina', 'Norja', 'Oslo', 'Aamu', 'Airbus A350', 124.75, 45),
(80, 'Tanska', 'Kööpenhamina', 'Islanti', 'Keflavík', 'Päivä', 'Boeing 737 MAX', 129.99, 30),
(81, 'Tanska', 'Kööpenhamina', 'Tanska', 'Billund', 'Päivä', 'Boeing 737 MAX', 99.50, 35),
(82, 'Ruotsi', 'Malmö', 'Suomi', 'Helsinki', 'Päivä', 'Airbus A320', 106.75, 25),
(83, 'Ruotsi', 'Malmö', 'Tanska', 'Kööpenhamina', 'Päivä', 'Boeing 737 MAX', 109.99, 22),
(84, 'Ruotsi', 'Malmö', 'Norja', 'Oslo', 'Ilta', 'Boeing 737-800', 119.60, 18),
(85, 'Ruotsi', 'Malmö', 'Islanti', 'Keflavík', 'Ilta', 'Airbus A350', 139.50, 25),
(86, 'Ruotsi', 'Malmö', 'Suomi', 'Rovaniemi', 'Päivä', 'Airbus A321', 126.30, 20),
(87, 'Suomi', 'Oulu', 'Suomi', 'Helsinki', 'Päivä', 'Boeing 737 MAX', 121.00, 18),
(88, 'Norja', 'Oslo', 'Suomi', 'Helsinki', 'Päivä', 'Airbus A350', 130.75, 22),
(89, 'Tanska', 'Billund', 'Suomi', 'Helsinki', 'Ilta', 'Boeing 737 MAX', 111.20, 20),
(90, 'Suomi', 'Oulu', 'Suomi', 'Rovaniemi', 'Päivä', 'Bombardier Q400', 85.30, 40),
(91, 'Suomi', 'Rovaniemi', 'Suomi', 'Oulu', 'Ilta', 'Embraer E195', 94.75, 25),
(92, 'Norja', 'Oslo', 'Ruotsi', 'Stockholm', 'Päivä', 'Boeing 737 MAX', 126.80, 30),
(93, 'Suomi', 'Helsinki', 'Ruotsi', 'Stockholm', 'Aamu', 'Airbus A320', 118.50, 52),
(94, 'Ruotsi', 'Stockholm', 'Suomi', 'Helsinki', 'Päivä', 'Boeing 737 MAX', 124.75, 43),
(95, 'Suomi', 'Helsinki', 'Ruotsi', 'Stockholm', 'Ilta', 'Airbus A350', 139.99, 38),
(96, 'Ruotsi', 'Stockholm', 'Suomi', 'Helsinki', 'Aamu', 'Airbus A320', 108.90, 48),
(97, 'Suomi', 'Helsinki', 'Ruotsi', 'Stockholm', 'Päivä', 'Boeing 737-800', 132.20, 63),
(98, 'Ruotsi', 'Stockholm', 'Suomi', 'Helsinki', 'Ilta', 'Airbus A321', 133.45, 34),
(99, 'Norja', 'Oslo', 'Ruotsi', 'Stockholm', 'Päivä', 'Airbus A320', 124.50, 44),
(100, 'Ruotsi', 'Stockholm', 'Norja', 'Oslo', 'Ilta', 'Boeing 737 MAX', 128.25, 51),
(101, 'Norja', 'Oslo', 'Ruotsi', 'Stockholm', 'Ilta', 'Boeing 737-800', 119.75, 47),
(102, 'Ruotsi', 'Stockholm', 'Norja', 'Oslo', 'Aamu', 'Airbus A350', 134.60, 28),
(103, 'Suomi', 'Helsinki', 'Norja', 'Oslo', 'Aamu', 'Boeing 737 MAX', 126.80, 64),
(104, 'Norja', 'Oslo', 'Suomi', 'Helsinki', 'Päivä', 'Airbus A320', 109.95, 58),
(105, 'Suomi', 'Helsinki', 'Norja', 'Oslo', 'Ilta', 'Airbus A321', 132.40, 50),
(106, 'Norja', 'Oslo', 'Suomi', 'Helsinki', 'Ilta', 'Boeing 737-800', 131.10, 42),
(107, 'Suomi', 'Helsinki', 'Suomi', 'Rovaniemi', 'Aamu', 'Bombardier Q400', 94.50, 38),
(108, 'Suomi', 'Rovaniemi', 'Suomi', 'Helsinki', 'Päivä', 'Airbus A320', 103.80, 49),
(109, 'Suomi', 'Helsinki', 'Suomi', 'Rovaniemi', 'Ilta', 'Boeing 737 MAX', 109.25, 27),
(110, 'Suomi', 'Rovaniemi', 'Suomi', 'Helsinki', 'Päivä', 'Embraer E195', 99.70, 56),
(111, 'Suomi', 'Oulu', 'Suomi', 'Helsinki', 'Päivä', 'Airbus A320', 94.10, 38),
(112, 'Suomi', 'Oulu', 'Suomi', 'Helsinki', 'Ilta', 'Bombardier Q400', 84.90, 33),
(113, 'Suomi', 'Rovaniemi', 'Suomi', 'Helsinki', 'Päivä', 'Airbus A320', 99.95, 53),
(114, 'Suomi', 'Rovaniemi', 'Suomi', 'Helsinki', 'Ilta', 'Embraer E195', 94.30, 43),
(115, 'Norja', 'Bergen', 'Norja', 'Oslo', 'Päivä', 'Airbus A320', 119.60, 47),
(116, 'Norja', 'Bergen', 'Suomi', 'Helsinki', 'Ilta', 'Airbus A350', 149.80, 38),
(117, 'Suomi', 'Oulu', 'Ruotsi', 'Göteborg', 'Päivä', 'Embraer E195', 94.90, 18),
(118, 'Suomi', 'Oulu', 'Ruotsi', 'Stockholm', 'Aamu', 'Boeing 737 MAX', 118.25, 16),
(119, 'Norja', 'Oslo', 'Suomi', 'Oulu', 'Päivä', 'Airbus A350', 130.00, 30),
(120, 'Suomi', 'Oulu', 'Ruotsi', 'Stockholm', 'Päivä', 'Boeing 737 MAX', 110.00, 45),
(121, 'Ruotsi', 'Stockholm', 'Suomi', 'Oulu', 'Päivä', 'Airbus A320', 115.00, 22),
(122, 'Suomi', 'Oulu', 'Islanti', 'Keflavík', 'Ilta', 'Boeing 737-800', 140.00, 38),
(123, 'Islanti', 'Keflavík', 'Suomi', 'Oulu', 'Päivä', 'Airbus A321', 150.00, 25),
(124, 'Suomi', 'Helsinki', 'Norja', 'Trondheim', 'Ilta', 'Boeing 737 MAX', 220.00, 25),
(125, 'Norja', 'Trondheim', 'Suomi', 'Helsinki', 'Päivä', 'Airbus A350', 215.00, 18),
(126, 'Suomi', 'Helsinki', 'Ruotsi', 'Stockholm', 'Aamu', 'Airbus A320', 120.00, 45),
(127, 'Ruotsi', 'Stockholm', 'Suomi', 'Helsinki', 'Ilta', 'Boeing 737-800', 125.00, 40),
(128, 'Suomi', 'Rovaniemi', 'Ruotsi', 'Göteborg', 'Päivä', 'Embraer E195', 105.00, 30),
(129, 'Ruotsi', 'Göteborg', 'Suomi', 'Rovaniemi', 'Päivä', 'Airbus A320', 115.00, 20),
(130, 'Ruotsi', 'Stockholm', 'Suomi', 'Helsinki', 'Ilta', 'Embraer E195', 110.00, 32),
(131, 'Suomi', 'Helsinki', 'Ruotsi', 'Stockholm', 'Päivä', 'Boeing 737 MAX', 135.75, 40),
(132, 'Ruotsi', 'Stockholm', 'Suomi', 'Helsinki', 'Aamu', 'Bombardier Q400', 95.00, 28),
(133, 'Suomi', 'Helsinki', 'Ruotsi', 'Stockholm', 'Aamu', 'Boeing 737-800', 118.50, 35),
(134, 'Ruotsi', 'Stockholm', 'Suomi', 'Helsinki', 'Päivä', 'Airbus A320', 121.75, 30),
(135, 'Suomi', 'Helsinki', 'Ruotsi', 'Stockholm', 'Ilta', 'Airbus A350', 145.00, 42),
(136, 'Ruotsi', 'Stockholm', 'Suomi', 'Helsinki', 'Ilta', 'Boeing 787 Dreamliner', 150.00, 33),
(137, 'Suomi', 'Helsinki', 'Ruotsi', 'Stockholm', 'Päivä', 'Embraer E195', 123.50, 39),
(138, 'Ruotsi', 'Stockholm', 'Suomi', 'Helsinki', 'Aamu', 'Airbus A350', 130.00, 41);



CREATE TABLE `matkustajat` (
  `MatkustajaID` INT(11) NOT NULL AUTO_INCREMENT,
  `LähtöPäivä` VARCHAR(20) NOT NULL,
  `LentoID` INT(11) NOT NULL,
  `Etunimi` VARCHAR(255) NOT NULL,
  `Sukunimi` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `Osoite` VARCHAR(255) NOT NULL,
  `Puhelin` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`MatkustajaID`),
  FOREIGN KEY (`LentoID`) REFERENCES `lennot`(`LentoID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
