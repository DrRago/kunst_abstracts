-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2018 at 06:10 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kunst`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_abstract`
--

CREATE TABLE `tbl_abstract` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `material` int(11) NOT NULL DEFAULT '1',
  `topic` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(200) NOT NULL,
  `class` varchar(200) NOT NULL DEFAULT 'DQI14',
  `img_sell_count` int(10) NOT NULL DEFAULT '0',
  `price` int(10) NOT NULL DEFAULT '15'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_abstract`
--

INSERT INTO `tbl_abstract` (`id`, `title`, `material`, `topic`, `content`, `author`, `class`, `img_sell_count`, `price`) VALUES
(1, 'Eine friedliche Schafsherde', 1, 'EuroparÃ¤tsel', '<p>Das Werk zeigt eine Schafsherde, die friedlich auf einer Wiese grast. Die Herde symbolisiert eine Gemeinschaft. In dieser Gemeinschaft ist jeder zwar alleine &uuml;berlebensf&auml;hig, aber wirklich sicher und stark f&uuml;hlt man sich nur in der Gruppe. In dieser Gruppe herrscht Frieden und gegenseitige Umsicht. Allerdings sind in bestimmten Punkten auch immer Eigennutz und Egoismus zu sp&uuml;ren.</p>\n<p>Ich fand, dass diese Eigenschaften der Schafsherde auch sehr gut das Zusammenleben in Europa widerspiegeln. Dabei sollen die unterschiedlichen Gr&ouml;&szlig;en sowie die Farbstruktur der einzelnen Schafe auf die Unterschiede der Staaten in der Europ&auml;ischen Gemeinschaft aufmerksam machen.</p>\n<p>Zur Umsetzung wurde eine zuerst angefertigte Skizze auf eine Linoleumplatte geschnitzt und diese wurde dann mithilfe von Farbe und einer Walze auf Papier &uuml;bertragen. Beim Ausarbeiten der Platte habe ich vor allem darauf geachtet, eine Struktur in die Schafe einzuarbeiten, um besagten Effekt der Unterschiedlichkeit zu erzeugen.</p>', 'Pascal de Vries', 'DQI14', 0, 15),
(2, 'Ein Baum', 1, 'EuroparÃ¤tsel; GegensÃ¤tze (positiv â€“ negativ)', '<p>Der wei&szlig;e Baum inmitten des schwarzen Raumes soll einen Lichtblick oder etwas Positives darstellen, w&auml;hrend die Dunkelheit, die ihn umgibt, etwas Negatives oder Bedr&uuml;ckendes darstellen soll. Dabei ist zu beachten, dass die Dunkelheit nicht komplett oder extrem ist, sondern von einem wei&szlig;en Nebel durchzogen ist, welcher auch etwas Positives erahnen l&auml;sst. Der Baum selber hingegen ist nicht unbedingt positiv, da er durch das Fehlen von Bl&auml;ttern tot erscheint.</p>\n<p>Dieses Modell kann man in mehrfacher Hinsicht auf Europa &uuml;bertragen. So stellt die Dunkelheit die dunkle Vergangenheit Europas dar. Die Dunkelheit symbolisiert die zwei Weltkriege, aus denen Europa und die EU hervorgegangen sind. Der Baum hingegen steht f&uuml;r eine scheinbar positive Zukunft, getr&uuml;bt durch Ereignisse, wie dem Brexit, durch den die EU schon zerbr&ouml;ckelt.<br /> <br /> Der Baum in Kreuzform kann auch Christentum darstellen, auf dem ein Gro&szlig;teil der europ&auml;ischen Geschichte basiert und die bis heute noch stark in der Kultur verwurzelt ist. Das Hauptmerkmal des Bildes ist allerdings die Gegenseitigkeit des positiven &bdquo;Wei&szlig;&ldquo; und des negativen &bdquo;Schwarz&ldquo;, wobei diese jedoch nie wirklich ein Extrem darstellen und auch Teile des jeweils anderen beinhalten.</p>', 'Robin SchÃ¤ffer', 'DQI14', 0, 15),
(3, 'PokÃ©mon-Trainer', 1, 'Europareise', '<p>Das Bild zeigt den Pok&eacute;mon-Trainer &bdquo;Rot&ldquo; aus den Spielen Pok&eacute;mon Rot/Blau. In diesen Spielen reist er durch die Welt, um Pok&eacute;mons zu entdecken und andere Leute zu treffen.</p>\n<p>Dieses Reisen durch die Welt verbinde ich mit der Reisefreiheit in Europa, da man dort auch viele verschiedene Orte und Personen trifft.</p>', 'Marcel Lillig', 'DQI14', 0, 15),
(4, 'Minion', 1, 'Eine starke Gemeinschaft', '<p>Schon am Anfang stand f&uuml;r mich fest, dass ich die Fr&ouml;hlichkeit, die Offenheit und den Optimismus der europ&auml;ischen Gesellschaft mit Hilfe von Minions symbolisieren wollte. Dabei halten Minions, wie auch Europa, in guten, wie in schlechten Zeiten zueinander und bilden dadurch eine starke Gemeinschaft, wenngleich sie sich ebenfalls wie Politiker kleine Streiche spielen. Dar&uuml;ber hinaus versuchen Minions im gleichnamigen Film die englische Krone zu stehlen, w&auml;hrend Europa derzeit aufgrund des Austritts Gro&szlig;britanniens Zahlungen in zweistelliger Milliardenh&ouml;he fordert. Auf ihrer Suche nach einem Schurken, dem sie dienen k&ouml;nnen, begleiten sie dabei im gleichen Film zum Beispiel mit Napoleon Bonaparte die historische Entwicklung Europas. Hierdurch bringen sie diese den Kindern auf unterhaltsame Weise bei und sind dabei multikulturell beliebt. Des Weiteren bestehen sie im Sinne der Gleichheit aller Menschen alle aus demselben Klumpen DNA.</p>', 'Maik Jostes', 'DQI14', 0, 15),
(5, 'Europa BinÃ¤r', 1, 'Die Gesellschaft im Wandel der Digitalisierung', '<p>Die Aussage des Entwurfs spielt auf die Macht der Nullen und Einsen in der heutigen Zeit der Digitalisierung und der Industrie 4.0 an, sowie die positiven als auch die negativen Auswirkungen auf unsere Gesellschaft. Zudem birgt es ein R&auml;tsel, da zur Entschl&uuml;sselung grundlegende Informatikkenntnisse bez&uuml;glich des Bin&auml;rsystems, sowie der Tabelle des &bdquo;American Standard Code for Information Interchange&ldquo; erforderlich sind. Des Weiteren ist es ein Geflecht aus Nullen und Einsen, die erst, wie die L&auml;nder Europas, im Ganzen einen Sinn ergeben. Au&szlig;erdem stellt es neben Naturwissenschaft, Wirtschaft und Fremdsprachen das Informatikprofil der Europaschule Schulzentrum SII Utbremen dar. Dar&uuml;ber hinaus spielt es in Hinblick auf gl&auml;serne B&uuml;rger durch den Ausbau der &Uuml;berwachung, Big-Data-Auswertung und k&uuml;nstliche Intelligenz auf den Film &bdquo;Matrix&ldquo; an, in dem Menschen in einer d&uuml;steren Zukunft von Maschinen kontrolliert werden.</p>', 'Maik Jostes', 'DQI14', 0, 15),
(6, 'Ein Aus', 1, 'Wie europÃ¤isch ist Europa?', '<p>Bei dem Bild handelt es sich um einen Ein- und Ausschalter f&uuml;r die Europ&auml;ische Union. Dabei kann man diesen jedoch nicht einfach nach Belieben einsetzen und bei Vorteilen Pro-Europ&auml;isch, beziehungsweise bei Nachteilen Anti-Europ&auml;isch sein. Beim Eintritt muss man sich an die gemeinsam geteilten europ&auml;ischen Normen und Werte halten. Man kann den Beitritt nicht einfach verlangen, wenn man gegen diese verst&ouml;&szlig;t, wie es derzeit die T&uuml;rkei tut. Ein Austritt, wie zum Beispiel der Brexit hingegen hat Konsequenzen. Sobald man sich ausklingt, hat man keinen Zugriff mehr. Auch werden in der heutigen Zeit vermehrt Falschmeldungen im Internet verbreitet, um unter anderem Wahlen zu beeinflussen. Dem stellen sich die B&uuml;rger jedoch gemeinsam entgegen. Zudem sorgt der historisch niedrige Leitzins der Europ&auml;ischen Zentralbank f&uuml;r die n&ouml;tige Energie des Motors unserer Zeit. Dar&uuml;ber ist es eine Anspielung auf das Mann-Frau-Geek-Symbol.</p>', 'Maik Jostes', 'DQI14', 0, 15),
(7, 'Runder Tisch', 1, 'aktuelle Politik der Mitgliedsstaaten der EuropÃ¤ischen Union', '<p>Der Hintergrund des Bildes ist die Abwendung von multilateralen Beziehungen und die Abkehr von den Gedanken der Aufkl&auml;rung, also beispielsweise der bevorstehende Austritt Gro&szlig;britanniens aus der EU und der Einzug der AfD in die deutschen Landtagsparlamente.</p>\n<p>Der Runde Tisch repr&auml;sentiert die Europ&auml;ische Union als Staatenge&shy;meinschaft, die durch Gespr&auml;che und Verhandlungen zu dem gewor&shy;den ist, was sie ist und Probleme auf diesem Weg zu l&ouml;sen ver&shy;sucht. Durch den wachsenden Zuspruch f&uuml;r sowohl europakritische als auch nationalis&shy;tische Parteien und Bewegungen droht die Gemeinschaft, wie am Beispiel Gro&szlig;britanniens zu se&shy;hen ist, aus&shy;einander zu brechen. Die fr&uuml;her in relativer Eintracht handelnden Staaten werden wie der Runde Tisch von innen heraus gespalten.</p>', 'Swantje KnÃ¼wer', 'DQI14', 0, 15),
(8, 'Die Mitte der Gesellschaft Europas', 1, 'EuroparÃ¤tsel', '<p>Die Aussage meines Werkes ist die Verbindung von Videospielen und Europas Bev&ouml;lkerung.<br /> Aus meinem Werk kann man ein \'O\' herauslesen, welches f&uuml;r die Europ&auml;ische Bev&ouml;lkerung steht, genauer die Mitte dieser, wie das \'O\' auch in der Mitte von \'Europa\' steht.<br /> Die Verbindung zu Videospielen ist der, dass Videospiele tats&auml;chlich nicht unwichtig f&uuml;r Europ&auml;ische B&uuml;rger (weltweit auch, hier aber nicht wichtig) sind, aber auch nicht das Wichtigste, da \'O\' nicht der einzige Buchstabe in der Mitte von \'Europa\' ist, sondern nur einer von Zweien.</p>', 'Alexander Kossens', 'DQI14', 0, 15),
(9, 'Schau in den Spiegel!', 1, 'EuroparÃ¤tsel', '<p>Das Kunstwerk &bdquo;Schau in den Spiegel&ldquo; wurde im Zeitraum vom November 2016 bis April 2017 angefertigt. Bei diesem Kunstwerk handelt es sich um einen Linoleumdruck, welcher mit einer Druckgrafikpresse auf einen gelben Hintergrund gedruckt wurde. Dadurch, dass das geschnitzte Motiv auf der Linoleumkachel mit blauer Farbe bestrichen wurde, erscheint das Werk in einem dunklen t&uuml;rkisfarbenen Ton, wobei das eigentliche Motiv durch die gelbe Farbe hervorgehoben wird.&nbsp; Das Motiv ist ein rankenumschlungenes &bdquo;E&ldquo;, das in Verbindung mit dem Thema der Vernissage &bdquo;Europar&auml;tsel&ldquo; steht.</p>\n<p>In diesem Zusammenhang steht das &bdquo;E&ldquo; spiegelverkehrt und wird von unterschiedlichen Strukturen verdeckt. So ist der Anfangsbuchstabe Europas nicht auf den ersten Blick erkennbar. Meine Intention des Drucks ist die Veranschaulichung des R&auml;tsels um die Zukunft Europas. Der Titel &bdquo;Schau in den Spiegel&ldquo; ist eine Aufforderung und stellt eine m&ouml;gliche Antwort auf die Frage nach der Zukunft der Gemeinschaft dar. Aus der Vergangenheit k&ouml;nnen R&uuml;ckschl&uuml;sse auf die Zukunft gezogen werden. Doch dabei sollte das Nachdenken nicht vergessen werden.</p>', 'Marion MeiÃŸner', 'DQF14', 0, 15),
(10, 'WeiÃŸer Regen', 1, 'Hoffnung', '<p>Mein Bild &bdquo;Wei&szlig;er Regen&ldquo; dr&uuml;ckt f&uuml;r mich aus, wie ich &uuml;ber die heutige Situation in Europa f&uuml;hle. &Uuml;berall auf der Welt finden Angriffe von Terroristen statt, die viele Menschen in Trauer und Wut versetzt. Doch man sollte nie aus den Augen verlieren, dass man nicht alleine k&auml;mpft.</p>\n<p>Urspr&uuml;nglich bestand die Idee aus monotoner schwarzer Farbe mit einem gro&szlig;en Gewitter, welcher die Stadt bedeckte. Doch die Zeit ver&auml;ndert sich und mit ihr ver&auml;ndern sich auch meine Gef&uuml;hle und Sichtweisen. Ich wandte mich zu der Idee mit hellen Kontrasten zu arbeiten, welche die Stadt umh&uuml;llt. Somit entstand aus dem Europa voller Wut eine Nation mit Hoffnung.</p>', 'Trung-Hoa Ha', 'DQI14', 0, 15),
(11, 'Simplistic Design', 1, 'EuroparÃ¤tsel', '<p>Das Werk soll zeigen, dass ein simples Design genauso ausdrucksvoll sein kann wie ein Komplexes. Des Weiteren soll es aussagen, dass es in Europa auch einfach zugehen kann, obwohl es auf den ersten Blick vielleicht nicht so aussehen mag. Um diese Aussage zu unterst&uuml;tzen, habe ich mich f&uuml;r einen Linoleumdruck mit den Farben schwarz und wei&szlig; entschieden, da diese genau diesen Kontrast darstellen.</p>', 'Nicolas Nierentz', 'DQI14', 0, 15),
(12, 'Please Enjoy Art', 1, 'EuroparÃ¤tsel', '<p>Dieses Werk soll die Freude an simplen Bildern widerspiegeln. Auf dem Bild erkennt man den Schriftzug &ldquo;Please Enjoy Art&rdquo;, welcher ein &ldquo;A&rdquo; formt. Die Farbe um dieses Design entstand willk&uuml;rlich, wodurch sich eine immer andere Aura bildet. Diese Aura, welche auch ruhig oder geheimnisvoll sein kann, wirkt sich immens auf die Kernaussage der Arbeit aus.</p>', 'Maximilian Kossens', 'DQI14', 0, 15),
(13, 'Der wÃ¼tende Zeus', 1, 'Legende Europas', '<p>Dieses Werk symbolisiert den Stier &ldquo;Zeus&rdquo; aus der Entstehungsgeschichte Europas. Dieser Stier ist ein sehr edles Tier, welches f&uuml;r den Willen von Europa steht. Im Hintergrund dieses Stieres kann man seinen K&ouml;rper sehen. Die roten Augen symbolisieren die Wut &uuml;ber das Verhalten von Europa, deren Mitglieder und Noch-Mitglieder, welche den gew&uuml;nschten Zusammenhalt von Europa schw&auml;chen oder gar zerst&ouml;ren. In dem, vom Betrachter aus, linken Auge kann man auch die Deutschlandflagge erkennen, welche f&uuml;r den Zusammenhalt Europas steht. Als wir das Thema &ldquo;Europar&auml;tsel&rdquo; bekamen, habe ich von der Legende zur Entstehung von Europa erfahren und war fasziniert von ihr. Allerdings war f&uuml;r mich die Geschichte des Stieres viel interessanter als die Geschichte von Europa. Darum habe ich mich f&uuml;r dieses Motiv entschieden.</p>', 'SÃ¶nke Allen', 'DQI14', 0, 15),
(14, 'EuropAhoy', 1, '', '<p>Das Kunstwerk &bdquo;EuropAhoy&ldquo; wurde im Zeitraum vom November 2016 bis April 2017 angefertigt. Bei dem Kunstwerk handelt es sich um einen Linoleumdruck, der mit einer Druckgrafikpresse auf einen wei&szlig;en Hintergrund gedruckt wurde. Das Motiv des Druckes stellt ein &bdquo;A&ldquo; da, das mit kunstvollen Ranken verziert ist.</p>\n<p>Die blaue Farbe des Druckes greift das Thema Europa auf, denn hierbei handelt es sich um das Blau der europ&auml;ischen Flagge.&nbsp; Die Ranken des &bdquo;A&rsquo;s&ldquo; sollen das Aufbl&uuml;hen symbolisieren, denn mehr denn je ist der Zusammenhalt innerhalb Europas wichtig. Au&szlig;erdem sollen die Ranken das Potenzial Europas zu wachsen darstellen. Eine Verbindung der Worte &bdquo;Europa&ldquo; und dem spanischen Begriff f&uuml;r &bdquo;heute&ldquo; (hoy) liegt hierbei nahe, weil das Werk eine m&ouml;gliche Sichtweise einiger Menschen auf Europa heute darstellt. Im Gegensatz zu Kritikern sehen diese die Chancen in Europas Zukunft.</p>', 'Vanessa Winter', 'DQF14', 0, 15),
(15, 'Das Wesen Europas', 1, 'europÃ¤ische Gemeinschaft und Zusammenhalt', '<p>Dieses Kunstwerk steht f&uuml;r die Beziehungen zwischen den einzelnen L&auml;ndern und Gemeinden Europas. Dabei symbolisiert das Werk die eigenen Grenzen, die ein jedes Wesen aufweist, also ihre eigene kleinere Gemeinschaft ist, aber trotzdem Beziehungen mit anderen Wesen pflegt, dabei Gemeinsamkeiten und Unterschiede existieren und entstehen, und sowohl in sich geschlossen, als auch in Verbindung mit anderen leben.</p>', 'Leonhard Gahr', 'DQI14', 0, 15),
(16, 'Das Wachstum Europas', 1, 'Die SchÃ¶nheit der Welt', '<p>Ich habe mich in dem Prozess f&uuml;r die Blume entschieden, da eine Blume f&uuml;r mich Sch&ouml;nheit widerspiegelt. Sie steht f&uuml;r mich au&szlig;erdem f&uuml;r Fruchtbarkeit und Wachstum. Genau wie Europa w&auml;chst die Blume und braucht Zeit zu gedeihen. Die Blume wirkt auch ein wenig r&auml;tselhaft, da sie alleine auf einer Wiese steht.</p>\n<p>Die Zeichnung der Blume war bereits vorhanden, ich habe die Zeichnung auf Linoleum &uuml;bertragen und anschlie&szlig;end gedruckt.</p>', 'Franziska Braun', 'DQF14', 0, 15),
(17, 'Das U im Dornengarten', 1, 'MÃ¤rchen', '<p>Der Buchstabe steht f&uuml;r Unklarheiten und Unsicherheiten der EU. Durch die vielen Verzierungen ist das Bild sehr vielseitig, was ebenfalls das Thema Europa unterstreicht. Die scharfen Kanten oben und der runde Teil vom U bilden einen guten Kontrast. Der Prozess begann mit dem Zeichnen einer Skizze. Anschlie&szlig;end folgten der Druck eines gelben Untergrunds und das Schnitzen in Linoleum. Danach habe ich das U mit der Farbe Blau darauf gedruckt.</p>', 'Aylin Aytekin', 'DQF14', 0, 15),
(18, 'Das UnbekAnnte', 1, 'Ãœberwachungsstaat Europa', '<p>Angefertigt in einem Zeitraum von etwa f&uuml;nf Monaten, startend im November 2016 stellt das Kunstwerk &bdquo;Das UnbekAnnte&ldquo; die letztendlichen Pl&auml;ne Europas dar, welche den Weg zum &Uuml;berwachungsstaat einl&auml;uten. Dies l&auml;sst sich aus der Position des As am Ende des Wortes &bdquo;Europa&ldquo; und dem Auge in der Mitte anschaulich machen. Des weiteren sagt die schwarze Farbe aus, dass dieses Vorhaben des &Uuml;berwachungsstaates f&uuml;r Europa keinesfalls die beste Wahl ist.</p>', 'Alexander Kossens', 'DQI14', 0, 15),
(19, 'Europas Kultur', 1, 'EuroparÃ¤tsel', '<p>Das Werk &ldquo;Europas Kultur&rdquo; soll den Schriftzug &bdquo;Europa&ldquo; in der japanischen Sprache darstellen und zeigen, dass in Europa Menschen aus verschiedenen Kulturen zusammen kommen und mit einander leben. Dies fand ich in der heutigen Zeit sehr wichtig, da man dadurch verschiedenes &uuml;ber andere Kulturen lernen kann und sie zu verstehen versucht, bevor man &uuml;ber sie urteilt.</p>', 'Nicolas Nierentz', 'DQI14', 0, 15),
(20, 'Entwicklung als Ganzes und Einzelnes', 1, 'EuroparÃ¤tsel', '<p>Die &bdquo;Entwicklung&ldquo; wurde von dem Drei-S&auml;ulen-Modell inspiriert, welches, bis zur Einf&uuml;hrung des Lissabon Vertrags 2007, zur Beschreibung von EUs Struktur verwendet wurde.<br /> Grundlegende Themen waren hierbei die Europ&auml;ische Gemeinschaft, Gemeinsame Au&szlig;en- u. Sicherheitspolitik und Zusammenarbeit in Strafsachen. Doch wie sieht es mit diesen drei S&auml;ulen in unserer heutigen Welt aus? Was ist zum Beispiel mit der Asylpolitik passiert, welches doch ein Teil der EG war? Was ist mit der Bewahrung der Menschenrechte und der Demokratie der gemeinsamen Au&szlig;enpolitik oder die Bek&auml;mpfung von Terrorismus geschehen? Hat sich nun die Lage mit der Zeit verbessert oder verschlechtert?</p>\r\n<p>Doch das Bild kann auch mit John Elkingtons Drei-S&auml;ulen-Modell aus dem Jahre 1994 identifiziert werden, wodurch sich die Frage ver&auml;ndert. Denn Elkington beschreibt mit seinem Modell die nachhaltige Entwicklung einer Gesellschaft in Bezug auf Soziales, &Ouml;kologie und Wirtschaft, die sich gegenseitig beeinflussen.</p>', 'Trung-Hoa Ha', 'DQI14', 0, 15),
(21, 'Das magische A', 1, 'EuroparÃ¤tsel', '<p>Das abgebildete A erinnert mich an den Eiffelturm in Paris. Paris ist eine sehr bedeutende Stadt fÃ¼r Europa, die viele Geheimnisse verbirgt. Die Magie der Stadt spiegelt sich in den VerschnÃ¶rkelungen und unklaren Linien des Bildes wieder.</p>', 'Aylin Aytekin', 'DQF14', 0, 15);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_material`
--

CREATE TABLE `tbl_material` (
  `id` int(11) NOT NULL,
  `material` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_material`
--

INSERT INTO `tbl_material` (`id`, `material`) VALUES
(1, 'Papier, Farbe, Linoleum');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_person`
--

CREATE TABLE `tbl_person` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sold`
--

CREATE TABLE `tbl_sold` (
  `id` int(11) NOT NULL,
  `abstract_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `password` varchar(128) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `price` int(10) NOT NULL,
  `surcharge` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sold`
--

INSERT INTO `tbl_sold` (`id`, `abstract_id`, `amount`, `email`, `message`, `password`, `active`, `price`, `surcharge`) VALUES
(1, 0, 0, 'admin@tandashi.de', '', '1A3DF780055C35FBD2F29C2B903324F42CF369F0D7DC71262BA311A33DA8C1E73D4CCC98FF8F4A248F2053ABFB72AF2476AC9E0C512E3A1F2B81B7E602F558BA', 3, 0, 0),
(4, 14, 1, 'remmerhuellsiek@gmail.com', '', '5833366f165ca5b36e2f10966922de70410b413aa4b37dcc3e1024277b1e7706eae17038f9ba982f09777b33bc50f98b35a7c5aa10b13163ea953611434301d8', 2, 15, 15),
(5, 1, 1, 'a@a.de', 'Blaue Schaafe', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 2, 15, 5),
(6, 13, 3, 'a@a.de', 'Gelb + Schwarz & Blau\r\nWeiÃŸ + Schwarz', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 2, 15, 85),
(7, 13, 1, 'a@a.de', 'WeiÃŸ + Schwarz', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 2, 15, 25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_abstract`
--
ALTER TABLE `tbl_abstract`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_material`
--
ALTER TABLE `tbl_material`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_person`
--
ALTER TABLE `tbl_person`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `tbl_sold`
--
ALTER TABLE `tbl_sold`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_abstract`
--
ALTER TABLE `tbl_abstract`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tbl_material`
--
ALTER TABLE `tbl_material`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_person`
--
ALTER TABLE `tbl_person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_sold`
--
ALTER TABLE `tbl_sold`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
