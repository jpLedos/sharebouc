-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sharebook
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'le Petit Litteraire'),(17,'Nasim Hamou'),(18,'René Barjavel'),(20,'Guy Nicot'),(21,'Isaac Asimov'),(22,'Ken Follett'),(23,'Adilson Borges'),(24,'Rob Scotton'),(25,'Pierre Lemaitre'),(27,'Georges A. Legault'),(28,'Jean-Pierre Béland'),(29,'Ray Bradbury'),(30,'Kenneth Cook'),(31,'Delphine de Vigan'),(32,'Laurent Gounelle'),(33,'Hervé Le Tellier'),(34,'Raphaël Belaïche'),(35,'Laurent Gaulet'),(36,'Robert Charles Wilson'),(37,'Honoré de Balzac'),(38,'Robert Heinlein');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_book`
--

DROP TABLE IF EXISTS `author_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_book` (
  `author_id` int NOT NULL,
  `book_id` int NOT NULL,
  PRIMARY KEY (`author_id`,`book_id`),
  KEY `IDX_2F0A2BEEF675F31B` (`author_id`),
  KEY `IDX_2F0A2BEE16A2B381` (`book_id`),
  CONSTRAINT `FK_2F0A2BEE16A2B381` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2F0A2BEEF675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_book`
--

LOCK TABLES `author_book` WRITE;
/*!40000 ALTER TABLE `author_book` DISABLE KEYS */;
INSERT INTO `author_book` VALUES (1,17),(17,17),(18,16),(18,18),(18,25),(18,26),(21,19),(22,20),(23,21),(24,22),(25,23),(25,24),(25,33),(27,28),(28,28),(29,29),(30,30),(31,31),(32,32),(33,34),(36,37),(37,38),(38,39);
/*!40000 ALTER TABLE `author_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_count` int DEFAULT NULL,
  `thumbnail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by_id` int NOT NULL,
  `added_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_CBE5A33155B127A4` (`added_by_id`),
  CONSTRAINT `FK_CBE5A33155B127A4` FOREIGN KEY (`added_by_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (16,'8tRvDwAAQBAJ','La Nuit des temps (Nouvelle édition)','<p><strong>Dans les steppes glac&eacute;es de l&#39;Antarctique, le mythe des amants l&eacute;gendaires revisit&eacute; par Barjavel. Un grand classique dela litt&eacute;rature, toujours en t&ecirc;te de liste des romans pr&eacute;f&eacute;r&eacute;s des Fran&ccedil;ais.</strong><br />\r\n<strong>Dans le grand silence blanc de l&#39;Antarctique</strong>, les membres d&#39;une mission des Exp&eacute;ditions polaires fran&ccedil;aises s&#39;activent &agrave; pr&eacute;lever des carottes de glace. L&#39;&eacute;paisseur de la banquise atteint plus de 1 000 m&egrave;tres, les couches les plus profondes remontant &agrave; <strong>900 000 ans.</strong>..<br />\r\nC&#39;est alors que l&#39;incroyable intervient : les appareils sondeurs enregistrent un signal provenant du niveau du sol. Il y a un &eacute;metteur sous la glace. La nouvelle &eacute;clate comme une bombe et les journaux du monde entier rivalisent de gros titres : &quot; Une ville sous la glace &quot;, &quot; Un c&oelig;ur sous la banquise &quot;, etc. Que vont d&eacute;couvrir les savants et les techniciens qui, venus du monde entier, forent la glace &agrave; la rencontre du myst&egrave;re ?<br />\r\nReportage, &eacute;pop&eacute;e et chant d&#39;amour passionn&eacute;, <em>La Nuit des temps </em>est tout cela &agrave; la fois.</p>',206,'http://books.google.com/books/publisher/content?id=8tRvDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE73YS13dVQVWl1nLg8873pyzDMW2gGit16y-yEFtOGXtO3NrzAVkJmlnYk1NdC3MP3QBiEXkzvT3AUtwkWzl-eFu6nGSCmSEiuxwana9_Y_RMorwnd3yxIu7bkUGqfIYWptdw7l8&source=gbs_api',4,'2023-11-07 11:46:27'),(17,'RY2MgBX1XnsC','Les Piliers de la Terre (Analyse de l\'oeuvre)','<b>Décryptez Les Piliers de la Terre de Ken Follet avec l’analyse du PetitLitteraire.fr !</b><br><br> Que faut-il retenir des <i>Piliers de la Terre</i>, le roman historique qui passionne les lecteurs ? Retrouvez tout ce que vous devez savoir sur cette œuvre dans une analyse complète et détaillée.<br><br> Vous trouverez notamment dans cette fiche :<br> • Un résumé complet<br> • Une présentation des personnages principaux tels que Jack Jackson, Aliena et Tom le bâtisseur<br> • Une analyse des spécificités de l’œuvre : le fil rouge : la cathédrale de Kingsbridge en construction, les luttes de pouvoir et une toile de fond historique<br><br>Une analyse de référence pour comprendre <b>rapidement</b> le sens de l’œuvre.<br><br> LE MOT DE L’ÉDITEUR : <br> « Dans cette nouvelle édition de notre analyse des <i>Piliers de la Terre</i> (2016), avec Marie-Charlotte Schneider, nous fournissons des pistes pour décoder ce roman historique au succès incroyable. Notre analyse permet de faire rapidement le tour de l’œuvre et d’aller au-delà des clichés. » Stéphanie FELTEN<br> <i></i><br><br> <b>À propos de la collection LePetitLitteraire.fr :</b><br> Plébiscité tant par les passionnés de littérature que par les lycéens, LePetitLittéraire.fr est considéré comme une référence en matière d’analyse d’œuvres classiques et contemporaines. Nos analyses, disponibles au format papier et numérique, ont été conçues pour guider les lecteurs à travers la littérature. Nos auteurs combinent théories, citations, anecdotes et commentaires pour vous faire découvrir et redécouvrir les plus grandes œuvres littéraires. <br><br> LePetitLittéraire.fr est reconnu d’intérêt pédagogique par le ministère de l’Éducation. Plus d’informations sur http://www.lepetitlitteraire.fr<br>',36,'http://books.google.com/books/content?id=RY2MgBX1XnsC&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE734VjS691Z5zr4XIpcm_RGRNmtS0P5fZEfFAtlyIMFNKr2zWeYqh_Oo8H2hT71R3JrJlfTBw82S8RJolnv_l3EEASWh78yFlg5XQJzWcWF4IH3BxfsqR_JxSBsQD3iE7ItCUAV2&source=gbs_api',4,'2023-11-07 16:00:39'),(18,'vXUdBQAAQBAJ','Le grand secret','<p><b>Deux amants fous d\'amour, une île paradisiaque cachée du reste du monde, un virus ultra surveillé, des hommes d\'Etat des plus grandes puissances mondiales au cœur du secret le mieux gardé au monde car le plus convoité et le plus dangereux...</b><br><i>\" Même si le vaccin anti-JL3 est prêt à temps, même si on peut envisager sa production accélérée en grande quantité, comment l\'administrer aux populations sans leur dire la vérité ? Et si on leur dit la vérité, il est bien évident qu\'ils refuseront le vaccin.<br> En buvant le contenu de l\'ampoule, Kennedy s\'est transformé en une bombe mondiale. Mais elle n\'explosera que dans dix mois. Il voit clairement la seule solution possible. Il commence aussitôt à prendre les mesures nécessaires : il prépare sa succession... \"</i><br> \" Le Grand Secret \", c\'est l\'histoire d\'un couple séparé par un extraordinaire événement, puis réuni dans des circonstances que jamais un homme et une femme n\'ont connues. C\'est aussi l\'histoire d\'un mystère qui depuis 1955, a réuni, à l\'insu de tous, dans une angoisse commune, au-delà des oppositions des idéologies et des impérialismes, les chefs des plus grandes nations. C\'est ce \" grand secret \" qui a mis fin à la Guerre Froide, qui a été la cause de l\'assassinat de Kennedy, qui rend compréhensible le comportement de De Gaulle en mai 1968, qui a rendu indispensable les voyages de Nixon à Moscou et à Pékin. Il n\'a rien à voir avec la guerre ou la bombe H. <br> C\'est le secret de la plus grande peur et du plus grand espoir du monde. <br></p>',197,'http://books.google.com/books/publisher/content?id=vXUdBQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE706a8jL9INzI_EpGphGjgsrGEiMYq6AyQL26x6pkJYEiHxEKjXE3gFpeNC5r44kwoQBDUl3oI2ef07Ptpf6gArFSoMgTCG5BKVXW3rtIDnrzdClEh_oASKCar1D6QR163-v5e6p&source=gbs_api',4,'2023-11-08 16:14:25'),(19,'jIc6BAAAQBAJ','Prélude à Fondation','<p>Hari Seldon venait d\'inventer la psychohistoire et il n\'y voyait qu\'une pure spéculation, sans application pratique. La psychohistoire ne pouvait pas prédire l\'avenir ? Les politiques s\'en moquaient ! Les gens allaient y croire. Ensuite, les équations diraient ce qu\'on leur ferait dire. Et si Seldon n\'était pas d\'accord, tant pis pour lui !<br> Alors, le jeune chercheur s\'enfuit. Traqué, il sillonna les dédales souterrains de la planète Trantor, capitale de l\'Empire galactique. Et ce qu\'il vit le stupéfia. Un avenir inquiétant se dessinait sous ses yeux. Était-il trop tard pour éviter la catastrophe ?<br><br></p>',375,'http://books.google.com/books/publisher/content?id=jIc6BAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE73vLiCR7xb3I77in5pKoJBKlKeviJRHnQBBdcZJBLGOeoBTeFM5WkUPO8v4wWBHDHEntK9LfjSS6J3jG0Lw1oyUYL58v4y4fe-_J4z8MDkelLb1jSbQ_EnjvstIfRJVzKwTx2ki&source=gbs_api',4,'2023-11-08 16:29:37'),(20,'o3oKBAAAQBAJ','Aux Portes de l\'éternité','<p><b>De l\'édification du mur de Berlin à l\'effondrement de l\'Union soviétique, la grande aventure du XXe siècle telle que personne ne l\'a jamais racontée. </b><br> 1961. Les Allemands de l\'Est ferment l\'accès à Berlin-Ouest. La tension entre les États-Unis et l\'Union soviétique s\'exacerbe pour atteindre un point culminant l\'année suivante avec la crise des missiles de Cuba. Le monde scindé en deux blocs se livre une guerre froide qui risque de devenir une guerre nucléaire. Confrontées à toutes les tragédies de la fin du XXe siècle, plusieurs familles, russe, allemande, américaine et anglaise, sont emportées dans le tumulte de ces immenses troubles sociaux, politiques et économiques. George Jakes dans le bus des Freedom Riders, Jasper Murray dans la jungle vietnamienne, Tania Dvorkine en Sibérie, Dave Williams et Walli Franck, rockers à Berlin ou San Francisco, vont se battre, trouver le chemin de l\'amour et participer chacun à leur façon à la formidable révolution en marche.<br><b>Entre saga historique et roman d\'espionnage, histoire d\'amour et thriller politique, <i>Aux portes de l\'éternité</i> clôt la fresque gigantesque et magistrale de la trilogie du <i>Siècle</i>, après <i>La Chute des géants</i> (Laffont, 2010) et <i>L\'Hiver du monde</i> (Laffont, 2012).</b><br><br></p>',1114,'http://books.google.com/books/publisher/content?id=o3oKBAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE707Aywx8yMwFGl23f7Ss2LSdS7GYRZIeeeTZoYEgukdNu5_BoRVJ5PY6lfsdO8vrP9NZJElmXas1Ue4VqlR8GNHTRXwBC2BJQQ9gEuTYEDI513tkBy6wAz8P3pF1pj6tpt0LuBv&source=gbs_api',4,'2023-11-09 07:51:16'),(21,'Vj5AEAAAQBAJ','Test & Learn : La stratégie des entreprises agiles','Le premier livre sur le Test & Learn pour renouer concrètement avec la passion de l’innovation, porteuse de sens et de valeur. <br>Expérimenter, analyser, apprendre pour éventuellement corriger, puis valoriser les résultats : voici les maîtres mots du Test & Learn, une nouvelle technique prisée par les start-ups, qui ne cesse de faire ses preuves.<br><br>Pour rester compétitif, il faut vivre au rythme du marché, innover, être réactif, interagir avec ses clients pour constamment s’améliorer. Impossible d’attendre le produit ou le service parfait pour se lancer. Mieux vaut tester, apprendre et recommencer.<br><br>Plus qu’une méthode, le Test & Learn est une culture, qui incite à la curiosité, à la prise de risque mesurée, à l’initiative et à la collaboration dans l’entreprise. <br>• D’où vient le Test & Learn ?<br>• En quoi est-il indispensable à toute organisation, petite ou grande, tournée vers l’innovation ?<br>• Produits, services, formations, manières de travailler... : peut-on tout tester ?<br>• Quelles sont les étapes à respecter pour aboutir à une expérimentation rigoureuse et riche d’enseignements ?<br> <br>Illustrées d’exemples issus de secteurs d’activité variés (du petit restaurant à la multinationale), voici toutes les clés pour développer l’état d’esprit Test & Learn dans votre organisation, une boucle vertueuse à mettre en œuvre pas à pas, pour devenir une entreprise apprenante et agile !',160,'http://books.google.com/books/publisher/content?id=Vj5AEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE73_jjfQDvFB5z-37MWLYK67aDGZWBgZxxr2nHPAFfIPLhsVn7b_TRLzxeBhbd4m_v3Y-EdFyvPqu2v6xho5OAHCqIEAi2vznQaKXdpAn9A99_jaP_VOjUBgFmc-5FsE7zZNgYKX&source=gbs_api',1,'2023-11-10 18:27:43'),(22,'E3gWEAAAQBAJ','Splat se trouve un travail - Album dès 4 ans','<p><b>Dans cette nouvelle aventure délirante,Splat se trouve un travail !</b><br><br><br>Splat, le petit chat gaffeur, s\'est trouvé un travail de grand : distribuer les journaux ! <br> Mais se lever tôt, se souvenir de ce qu\'il faut distribuer et ne pas se perdre, c\'est difficile, et Splat est bientôt débordé ! <br> Avec un peu d\'aide de son amie Kattie et quelques ingénieuses inventions, Splat sera bientôt le plus doué des facteurs ! <br><br> Un album pour les enfants dès 3 ans.</p>',31,'http://books.google.com/books/publisher/content?id=E3gWEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE71Tm-H9OiPRI8bSPaCuc1YW58nc8DVsfyi7fpbus52jJoMJ5Al5bn0xrl7_DsgrDZwu4R425gze0Jm51dgJOkU7erciZdn4LZcseLDZNJJZqFsvj_zIlW6kdFuoQ_TcJfiuYEBn&source=gbs_api',1,'2023-11-10 19:57:27'),(23,'jLGCCwAAQBAJ','Trois jours et une vie','<p>« <i>À la fin de décembre 1999, une surprenante série d\'événements tragiques s\'abattit sur Beauval, au premier rang desquels, bien sûr, la disparition du petit Rémi Desmedt. <br>Dans cette région couverte de forêts, soumise à des rythmes lents, la disparition soudaine de cet enfant provoqua la stupeur et fut même considérée, par bien des habitants, comme le signe annonciateur des catastrophes à venir.<br>Pour Antoine, qui fut au centre de ce drame, tout commença par la mort du chien...</i> »<br>P.L.</p> <p>Le nouveau roman de Pierre Lemaitre, Goncourt 2013.<br></p>',288,'http://books.google.com/books/publisher/content?id=jLGCCwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE71ljLre6PBKJ7_s66owJezTGRuQ5O-suamdaAYIKRcTQ9225A8ebkFv6zEvSZoK9OBL7TPNgr9iebsOoDr-mUAUMscdq3-7K56nV1V-4a-K8ZE-Pesb2cf0AQYBTn96u87uZr4c&source=gbs_api',1,'2023-11-10 20:00:33'),(24,'6ndTEAAAQBAJ','Le Grand Monde','                                                                  Le Grand Monde, le nouveau roman de Pierre Lemaitre.<br>Après sa remarquable fresque de l\'entre-deux-guerres, il nous propose aujourd\'hui une plongée mouvementée et jubilatoire dans les Trente Glorieuses. \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        \r\n        ',592,'http://books.google.com/books/publisher/content?id=6ndTEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE71JwM3b3uMj76cEw88rJ4jZICvFk8fYUrc_5TIUAAVsp_7MP0IJAihfcvZtblfSaSw1yZFY-iFIk6-OTiN_xdbWORjHOkixU9GNwKsqm1l3MBUgS6JLwCs7botnvdVLSehV0Ry9&source=gbs_api',1,'2023-11-10 20:03:42'),(25,'qvGnEAAAQBAJ','L\'Enchanteur','Qui ne connaît Merlin ? Il se joue du temps qui passe, reste jeune et beau, vif et moqueur, tendre, pour tout dire Enchanteur. Et Viviane, la seule femme qui ne l\'ait pas jugé inaccessible, et l\'aime ? Galaad, dit Lancelot du Lac ? Guenièvre, son amour mais sa reine, la femme du roi Arthur ? Elween, sa mère, qui le conduit au Graal voilé ? Perceval et Bénie ? Les chevaliers de la Table Ronde ? Personne comme Barjavel, qui fait le récit de leurs amours, des exploits chevaleresques et des quêtes impossibles, à la frontière du rêve, de la légende et de l\'Histoire. Dans une Bretagne mythique, il y a plus de mille ans, vivait un Enchanteur. Quand il quitta le royaume des hommes, il laissa un regret qui n\'a jamais guéri. Le voici revenu.',360,'http://books.google.com/books/publisher/content?id=qvGnEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE71ZUs0B22sVe8Rp4bjN82jetqTpOagi2ol8OcxyWAnRT6LOQbU3Y3vgyV9RuPSpuLdlOCfhqx6n3im11B6LqQKN5zYR3NrKsOwlslA-XiDQ9TSkWNjI89fFLE2faXDLoXEGrBRU&source=gbs_api',1,'2023-11-13 09:08:16'),(26,'pPGnEAAAQBAJ','Le Voyageur imprudent','\"Je réglai mon appareil pour un voyage de cent mille ans dans le futur et appuyai sur le bouton... J\'arrivai couché. Deux trous ténébreux se promenaient au-dessus de mes lunettes : les naseaux d\'un monstre occupé à me flairer ! Terrifié, j\'allais appuyer sur le bouton de retour quand je reconnus le mufle d\'une vache. Je fus saisi de stupeur : son corps n\'était qu\'une mamelle qui pendait entre quatre pattes raides. J\'évaluai sa contenance à quatre cents litres environ. Ronde et rose, elle ressemblait à un monstrueux sein de femme. Un bruit me fit tourner la tête. Et je vis le premier homme de l\'an cent mille. Il venait vers moi. Il ne semblait pas me voir...\" Tel est le début du rapport de Pierre Saint-Menoux sur son voyage au 1 000e siècle. Mais cette exploration lointaine n\'est qu\'une des multiples aventures du Voyageur imprudent dans le passé et le futur. Le roman de René Barjavel est un classique qui n\'a pas été dépassé et que tout amateur de science-fiction doit avoir dans sa bibliothèque.',248,'http://books.google.com/books/publisher/content?id=pPGnEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE73W0kgtsDI5Ynq_qCCmSjbTDzpUW5-3nT600enPVm14asgFIcjjvBaerQEsKG8LNoK0tWzlEyLUvTtgMofui78b7nGT7ead66d_OLvlrvn0r0mccNELjo38RXbg1nNFe375xl41&source=gbs_api',4,'2023-11-14 07:16:20'),(27,'PehxCgAAQBAJ','Toto pour enfants','<b>Envie d\'un moment détente ? L\'indémodable Toto n\'attend que vous !</b><br><br><i>Après un contrôle de mathématiques, Toto et son ami estiment leur résultat.</i><br><i>- Je pense que j’ai complètement raté, dit Toto, la mine dépitée. Je m’attends à avoir un 0.</i><br><i>Son ami tente de le réconforter.</i><br><i>- Mais tu es sûr, Toto ? Tu avais pourtant bien révisé ?</i><br><i>- Oh oui, j’en suis sûr, aussi sûr que 3 et 4 font 10...</i><i><br></i><br><b>Les meilleures blagues de Toto pour votre plus grand plaisir ! Véritable concentré de bonne humeur qui ravira grands et petits.</b><br><br>(Re)découvrez des centaines de blagues grâce à la collection 100blagues.fr ! Des incontournables aux plus farfelues, il y en aura pour tous les goûts ! Un moment de rigolade à partager aussi bien en famille qu\'entre amis. <br><br><b>Dans la collection 100blagues.fr :</b><br><br>• Toto à l\'école<br>• Toto à la maison<br>• Toto courtes<br>• Toto cochonnes<br>• 100 blagues<br>• 500 blagues de Toto et histoires drôles',18,'http://books.google.com/books/publisher/content?id=PehxCgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE73YrAVluuweq5knBU7YiAgMecHS5NvjvFd6IXFWhqHNy7BMOo327mwATZ3AiRAYOAYhN65VhJmOTpkHBwPUI07X1wQQqIWkIdBWWwHRfgPnANxbcTmSoDoaF8G_LBjVVx-hR2W-&source=gbs_api',4,'2023-11-15 08:35:40'),(28,'_tsoEAAAQBAJ','Asimov et l\'acceptabilité des robots','Isaac Asimov (1920-1992), écrivain américain qui a marqué la science-fiction, est mort depuis vingt ans. Pourtant l’intérêt pour son œuvre est toujours présent, comme en témoignent les activités qui signaleront le vingtième anniversaire de son décès. La science-fiction possède un pouvoir particulier, celui de nous projeter dans le temps et, par l’imaginaire, de tracer le développement technologique ainsi que les réactions humaines à son égard. Avec le temps, la science-fiction peut paraître très déphasée ou, au contraire, être demeurée pertinente pour penser une autre époque. L’œuvre d’Asimov met en scène, à travers diverses nouvelles et plusieurs romans, des robots dont certains ne sont que des machines complexes, alors que d’autres sont des humanoïdes. Ces robots qui interagissent avec les humains sur la Terre ainsi que dans les colonies permettent à Asimov de soulever divers enjeux éthiques, économique, environnementaux, légaux et sociaux connus sous l’acronyme E3LS. Que peut-on tirer d’une lecture d’Asimov aujourd’hui? Comment cet auteur pensait-il ces enjeux? Comment en évaluait-il les risques et les répercussions? De plus, en imaginant une morale des robots pour les rendre plus acceptables socialement, comment voyait-il les enjeux du vivre ensemble? Enfin, on peut se demander aujourd’hui, alors que le développement de la robotique et des implants avance à grands pas, si les robots d’Asimov sont ou seront un jour réalisables. Voilà les questions qui amènent deux philosophes et deux physiciens à se rencontrer pour penser l’acceptabilité des robots dans l’œuvre de science-fiction d’Asimov.',238,'http://books.google.com/books/publisher/content?id=_tsoEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE70mVf-OV7nQxoLLSH48tkzK2T-ugc873LMyzTUtRbw6rPst1pgRT6HOZl9f6b2zOJA8qPoQtJc-BMBcq8BXoWhvIccLyfoUJY5Gq9TdWemk9m4fd5sFd9Vhn79gEKXSXRqMrtso&source=gbs_api',4,'2023-11-16 07:32:04'),(29,'nn6sEAAAQBAJ','Chroniques martiennes','2030, les premières fusées quittent la Terre pour un monde nouveau. La colonisation de Mars vient de débuter. Mais, sur la planète rouge, vit déjà un peuple d’une infinie sagesse. Cette antique civilisation devra-t-elle disparaître pour qu’une nouvelle puisse s’épanouir ?',320,'http://books.google.com/books/publisher/content?id=nn6sEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE73sLimBgkW-oLychSAFQHg_orkkMCVfFrlE2_6dwKFKnPvpnNxedYdSqWyoh2agdDn0HCdrQk5joqStok_K9pU8x8F_-m1Zr5GgGbHuITI3WOqjqK5crpNgwLxUobjPy3lo_jtW&source=gbs_api',1,'2023-11-16 17:48:24'),(30,'IyIAEAAAQBAJ','Le koala tueur et autres histoires du bush','Être poursuivi par un cochon sauvage enragé, se retrouver coincé avec un type qui cache six serpents dans son pantalon, ou pris en otage par un dromadaire roublard dans le désert... Est-ce ça le bush ? Kenneth Cook n’est pas au bout de ses peines ! Au fil de ses pérégrinations australiennes, l’écrivain magnifie l’art de se mettre dans des situations ridiculement dangereuses et terriblement drôles.',267,'http://books.google.com/books/publisher/content?id=IyIAEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE730LtgUfYgMakVNJbZLwhyxm5RRgZPrsZ44MDcGycRY0h7JujUIptM3Dbwr6hG2RFRQCRFmsj27-NKV4FhnXPhU1_PZF4fiPJQxHbVIktzDt4a1CaJsSZMJwXc2MoPeLBNdK1d6&source=gbs_api',1,'2023-11-18 18:46:10'),(31,'sYF0EAAAQBAJ','Les enfants sont rois','\' Même dans les drames les plus terribles, les apparences ont leur mot à dire. \' Mélanie, qui a grandi dans le culte de la téléréalité, n’a qu’une idée en tête : devenir célèbre. Mais son unique apparition à l’écran tourne au fiasco. Quelques années plus tard, mariée et mère de famille, elle décide de mettre en scène le quotidien de ses enfants sur YouTube. Le succès ne se fait pas attendre, et la voilà bientôt suivie par des millions d’abonnés. Jusqu’au jour où sa fille disparaît. Des années Loft Story aux années 2030, marquées par le sacre des réseaux sociaux, Delphine de Vigan explore les dérives d’une époque où l’on ne vit que pour être vu.!',368,'http://books.google.com/books/publisher/content?id=sYF0EAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE73kpMHKbP_yC3xoxgLa7tgMxE-GFxAuAP-pNOdPVujFGFgBMPXVrPMHFVMvz0mhIwFxAplfdYzPzQTXLucxHAh4Ny0Rcut5nfophWqoULuehFntbzOVwEmNPuMmSeLXrzGjoz13&source=gbs_api',1,'2023-11-19 12:54:18'),(32,'kVBcEAAAQBAJ','Le Réveil','Tom, un jeune ingénieur, se retrouve confronté dans son pays à une situation inquiétante qui sème la peur dans la population.<br>Dans ce contexte inédit, des mesures sont adoptées par le pouvoir, contraignantes et liberticides.<br><br>Tom se retrouve pris dans la tourmente des événements, mais il a un ami grec qui l’alerte alors : les peurs des gens sont très utiles à certains.<br><br>C’est en découvrant des vérités parfois dissimulées au grand jour, que l’on peut se réapproprier sa liberté...<br><br>Un roman qui vous fait voir le monde autrement.',198,'http://books.google.com/books/publisher/content?id=kVBcEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE70mPR0f08mmp10boAQVlmQNXudDe_edOOPLA5EpGi6zLyHTlqd_1sO1u0Q8XNjjpkjokCU57lz50qzl-yd7ec3raycqzTPdgEAEBE1Jg8XlWVq4rG7mn-21WdFxyq4pSokbt4cX&source=gbs_api',1,'2023-11-21 20:45:44'),(33,'zIChEAAAQBAJ','Le Silence et la Colère','Après l\'immense succès du Grand Monde<br><br>Un ogre de béton, une vilaine chute dans l’escalier, le Salon des arts ménagers, une grossesse problématique, la miraculée du Charleville-Paris, la propreté des Françaises, « Savons du Levant, Savons des Gagnants », les lapins du laboratoire Delaveau, vingt mille francs de la main à la main, une affaire judiciaire relancée, la mort d’un village, le mystérieux professeur Keller, un boxeur amoureux, les nécessités du progrès, le chat Joseph, l’inexorable montée des eaux, une vendeuse aux yeux gris, la confession de l’ingénieur Destouches, un accident de voiture. Et trois histoires d’amour.<br><br>Un roman virtuose de Pierre Lemaitre',592,'http://books.google.com/books/publisher/content?id=zIChEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE705QXRDaSHgwpniDRPkUObvHLUjYNZAf9FJbIz4GL938q-NwmB8bPKeQd-LlQ4a--c35Ks_904I6F1gYwEyCshmMTwVVyC0wFBRKu5ZO4nQxopGkM8y3hYn1nzL1ljqbpGlT1ff&source=gbs_api',1,'2023-11-21 20:48:18'),(34,'P97sDwAAQBAJ','L\'anomalie','\"Il est une chose admirable qui surpasse toujours la connaissance, l’intelligence, et même le génie, c’est l’incompréhension.\" En juin 2021, un événement insensé bouleverse les vies de centaines d’hommes et de femmes, tous passagers d’un vol Paris-New York. Parmi eux : Blake, père de famille respectable et néanmoins tueur à gages ; Slimboy, pop star nigériane, las de vivre dans le mensonge ; Joanna, redoutable avocate rattrapée par ses failles ; ou encore Victor Miesel, écrivain confidentiel soudain devenu culte. Tous croyaient avoir une vie secrète. Nul n’imaginait à quel point c’était vrai. Roman virtuose où la logique rencontre le magique, L’anomalie explore cette part de nous-mêmes qui nous échappe.',336,'http://books.google.com/books/publisher/content?id=P97sDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE73yZqmrzkxS4v8UEYeKjzhouOIyDfC_xo1BFz-gAgvvTsjhfzcBH0LJeSTj7G6e5pHEnwxYZb4VYaMrttnqM__A7yV6pLbDn1v1fwlzlZsdW0451CGKQOMBi1m_gbVbEb4MolDc&source=gbs_api',1,'2023-11-21 20:49:45'),(37,'uvGnEAAAQBAJ','La trilogie de Spin (Tome 1) - Spin','La vie de Tyler Dupree est inextricablement liée à celle des jumeaux Lawton, Diane et Jason. Ils étaient ensemble la nuit où la Terre a été coupée du reste de l’univers par une mystérieuse barrière opaque à l’extérieur de laquelle le temps s’écoule des millions de fois plus vite. Il ne reste donc plus que quelques décennies avant que le Soleil ne transforme la Terre en une boule de feu, exterminant ainsi l’humanité. Jason n’a alors plus qu’un but dans la vie : comprendre pourquoi et par qui la barrière a été installée. Roman de science-fiction vertigineux, Spin gagne le pari de nous transporter dans un futur lointain qui reste familier. Une réussite couronnée aux États-Unis par la plus haute distinction de la science-fiction, le prix Hugo, et en France par le Grand Prix de l’Imaginaire.',560,'http://books.google.com/books/publisher/content?id=uvGnEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE71qLdvg-iPDCAxudNyev4NPzSRmjqurjR0_DSQPQZLY4RQxpw_HFw2ChYH3vhyOHw6KryGpWvwZo6Kdt9sVCWuJuVeGM9NKfGxtPjKW6fHfIElzNC16e7zVbMGaoriyHUw9C4VQ&source=gbs_api',4,'2023-11-29 12:14:55'),(38,'WmtrEAAAQBAJ','Honoré de Balzac: Le Père Goriot','<p>&quot; <strong>Le P&egrave;re Goriot</strong> &quot; d&#39;Honor&eacute; de Balzac s&#39;ouvre en 1819, avec la description sordide et r&eacute;pugnante de la maison Vauquer, une pension parisienne situ&eacute;e dans la rue Neuve-Sainte-Genevi&egrave;ve, appartenant &agrave; la veuve Vauquer. Plusieurs r&eacute;sidents s&#39;y c&ocirc;toient, dont Eug&egrave;ne de Rastignac, jeune &eacute;tudiant en droit, un myst&eacute;rieux personnage un peu rustre et grossier nomm&eacute; Vautrin et un ancien fabricant de p&acirc;tes et de pain.</p>',340,'http://books.google.com/books/publisher/content?id=WmtrEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE72xcuEyS-S7nNrNA3TGSH2Wk-KolfjAZ6LfbpIyfLuvEJGsad0SKss_gGAl4tVc4GldVWlqDUWs9janjTvn6RoR2rRfZZdy09aP7DbMhVEFhIwkPVk3Aw24tsplmLLcaM3kMBCs&source=gbs_api',17,'2023-12-01 09:01:51'),(39,'R8kyDAAAQBAJ','Révolte sur la lune','<p>La Lune a &eacute;t&eacute; transform&eacute;e en colonie p&eacute;nitentiaire. Manuel Garcia O&rsquo;Kelly y m&egrave;ne une existence de technicien informatique sans la moindre perspective. N&eacute; libre, il est condamn&eacute; &agrave; partager le destin des bagnards de Luna et de leurs descendants, dont la Terre exploite sans vergogne le travail. Mais Manuel r&ecirc;ve de justice. Quand Mike, son superordinateur devenu une entit&eacute; consciente, finit par d&eacute;duire des donn&eacute;es &agrave; sa disposition que la colonie lunaire court &agrave; sa perte si elle ne se lib&egrave;re pas du joug terrestre, la solution s&rsquo;impose d&rsquo;elle-m&ecirc;me : il faut organiser la r&eacute;volte.<br />\r\nVaste r&eacute;flexion sur la politique et les passions humaines, l&rsquo;histoire et la science, R&eacute;volte sur la Lune est le quatri&egrave;me roman de Robert Heinlein &agrave; avoir obtenu le prix Hugo.<br />\r\n<br />\r\nL&rsquo;un des livres de r&eacute;f&eacute;rence de la S-F am&eacute;ricaine. Patrick Imbert, NooSFere.com</p>',640,'http://books.google.com/books/publisher/content?id=R8kyDAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE72BTAXsJVKu0YbZjyVzK1cQ02am-6EN7fIJpVY21F8skgAfXkxZJXSv0-M_jiRwQEmW8Oe1ykRDHq6rLwlC1UFPwKhDZ_6oPIqBRc62tJsFdP6f81GNhLgOQ2CBvUudzp_jqNku&source=gbs_api',1,'2023-12-02 14:05:59');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_kind`
--

DROP TABLE IF EXISTS `book_kind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_kind` (
  `book_id` int NOT NULL,
  `kind_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`kind_id`),
  KEY `IDX_2259F7D116A2B381` (`book_id`),
  KEY `IDX_2259F7D130602CA9` (`kind_id`),
  CONSTRAINT `FK_2259F7D116A2B381` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2259F7D130602CA9` FOREIGN KEY (`kind_id`) REFERENCES `kind` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_kind`
--

LOCK TABLES `book_kind` WRITE;
/*!40000 ALTER TABLE `book_kind` DISABLE KEYS */;
INSERT INTO `book_kind` VALUES (16,2),(16,3),(16,4),(17,2),(17,4),(18,1),(18,3),(19,3),(20,2),(20,4),(25,2),(27,10),(28,3),(29,3),(31,1),(31,2),(34,2),(34,3),(38,2),(39,2),(39,3);
/*!40000 ALTER TABLE `book_kind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20231106092414','2023-11-06 09:25:07',112),('DoctrineMigrations\\Version20231106094057','2023-11-06 09:41:39',574),('DoctrineMigrations\\Version20231106162147','2023-11-06 16:22:27',163),('DoctrineMigrations\\Version20231107095432','2023-11-07 09:55:04',142),('DoctrineMigrations\\Version20231107113314','2023-11-07 11:34:34',122),('DoctrineMigrations\\Version20231110110012','2023-11-10 11:00:20',173),('DoctrineMigrations\\Version20231113101806','2023-11-13 10:18:19',60),('DoctrineMigrations\\Version20231113183825','2023-11-13 18:38:33',94),('DoctrineMigrations\\Version20231114183135','2023-11-14 18:31:50',179),('DoctrineMigrations\\Version20231120165113','2023-11-20 16:51:24',87),('DoctrineMigrations\\Version20231120165234','2023-11-20 16:52:40',21),('DoctrineMigrations\\Version20231120170208','2023-11-20 17:02:11',22),('DoctrineMigrations\\Version20231121085731','2023-11-21 08:57:38',199),('DoctrineMigrations\\Version20231201120328','2023-12-01 12:03:41',125);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reader_id` int DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F11D61A21717D737` (`reader_id`),
  CONSTRAINT `FK_F11D61A21717D737` FOREIGN KEY (`reader_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitation`
--

LOCK TABLES `invitation` WRITE;
/*!40000 ALTER TABLE `invitation` DISABLE KEYS */;
INSERT INTO `invitation` VALUES (9,NULL,'test3@test.fr',''),(11,12,'test4@test.fr',''),(12,NULL,'test@test.fr','uuid-test'),(14,17,'lastTest@test.fr',''),(15,NULL,'test5@test.fr','864802f5-a684-4b95-b17d-b1d3d22715bb'),(16,NULL,'testa@test.fr','6c34cbda-ecd3-41a1-8551-0ae75394c1f6'),(17,NULL,'testv@test.fr','3b8537a2-17f3-46f8-a9c6-fa30da13bb4f'),(18,NULL,'testb@test.fr','bc1145bc-99d1-4a69-bdac-f3a24f5c22d2'),(19,NULL,'testc@test.fr','abbcf6e8-e3c5-472f-a50e-6591236ba4e6'),(20,NULL,'testd@test.fr','a6ceea67-27fc-4b54-b1bb-e11487995cb1'),(21,NULL,'testb@test.fr','47e769ed-e06a-4ff1-854c-5f2634f05720'),(22,NULL,'test@tes.fr','9f280ee7-4e1f-4b05-b3d2-9c4d9acfacfb'),(23,NULL,'tezt@tet.fr','d8167790-5286-4d05-a4b7-ef808ad9b9f5'),(24,NULL,'test5@test.fr','1c0161a5-8dbf-486d-8904-af75719f13dc'),(25,NULL,'test@test.fr','0a06298a-548a-4498-98a3-15a36c4e34ad');
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kind`
--

DROP TABLE IF EXISTS `kind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kind` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bg_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kind`
--

LOCK TABLES `kind` WRITE;
/*!40000 ALTER TABLE `kind` DISABLE KEYS */;
INSERT INTO `kind` VALUES (1,'Policier','#000000','#f0f0f0'),(2,'Roman','#1255c0','#f1f1f1'),(3,'S-Fiction','#9966CC','#FFFFFF'),(4,'Historique','#8B4513','#F0F0F0'),(5,'Nouvelles','#008000','#F0F0F0'),(6,'Biographie','#F5F5DC','#A52A2A'),(7,'Conte,Légende','#DAA520','#A52A2A'),(8,'Poésie','#FFB6C1','#A52A2A'),(9,'Theatre','#FF0000','#000000'),(10,'Bande dessinée','#00FFFF','#0a0a0a');
/*!40000 ALTER TABLE `kind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_messages`
--

LOCK TABLES `messenger_messages` WRITE;
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
INSERT INTO `messenger_messages` VALUES (1,'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:26:\\\"email/invitation.html.twig\\\";i:1;N;i:2;a:2:{s:3:\\\"url\\\";s:74:\\\"https://127.0.0.1:8000/reset_password/00fd26ff-9794-4f4d-a99c-25c023a93bc0\\\";s:4:\\\"user\\\";O:21:\\\"App\\\\Entity\\\\Invitation\\\":4:{s:25:\\\"\\0App\\\\Entity\\\\Invitation\\0id\\\";i:8;s:28:\\\"\\0App\\\\Entity\\\\Invitation\\0email\\\";s:12:\\\"test@test.fr\\\";s:27:\\\"\\0App\\\\Entity\\\\Invitation\\0uuid\\\";s:36:\\\"00fd26ff-9794-4f4d-a99c-25c023a93bc0\\\";s:29:\\\"\\0App\\\\Entity\\\\Invitation\\0reader\\\";N;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:23:\\\"dontreply@ledos-dev.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:12:\\\"test@test.fr\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:33:\\\"Enregistrez vous sur ShareBouc !!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}','[]','default','2023-11-27 17:46:20','2023-11-27 17:46:20',NULL),(2,'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:26:\\\"email/invitation.html.twig\\\";i:1;N;i:2;a:2:{s:3:\\\"url\\\";s:74:\\\"https://127.0.0.1:8000/reset_password/16f4bceb-3935-40ee-9631-994295a3c5fc\\\";s:4:\\\"user\\\";O:21:\\\"App\\\\Entity\\\\Invitation\\\":4:{s:25:\\\"\\0App\\\\Entity\\\\Invitation\\0id\\\";i:9;s:28:\\\"\\0App\\\\Entity\\\\Invitation\\0email\\\";s:13:\\\"test3@test.fr\\\";s:27:\\\"\\0App\\\\Entity\\\\Invitation\\0uuid\\\";s:36:\\\"16f4bceb-3935-40ee-9631-994295a3c5fc\\\";s:29:\\\"\\0App\\\\Entity\\\\Invitation\\0reader\\\";N;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:23:\\\"dontreply@ledos-dev.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:13:\\\"test3@test.fr\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:33:\\\"Enregistrez vous sur ShareBouc !!\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}','[]','default','2023-11-27 17:47:15','2023-11-27 17:47:15',NULL);
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'A lire'),(2,'En cours'),(3,'Lu'),(4,'Abandonné');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bg_color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_book`
--

DROP TABLE IF EXISTS `tag_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_book` (
  `tag_id` int NOT NULL,
  `book_id` int NOT NULL,
  PRIMARY KEY (`tag_id`,`book_id`),
  KEY `IDX_25EA1C87BAD26311` (`tag_id`),
  KEY `IDX_25EA1C8716A2B381` (`book_id`),
  CONSTRAINT `FK_25EA1C8716A2B381` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_25EA1C87BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_book`
--

LOCK TABLES `tag_book` WRITE;
/*!40000 ALTER TABLE `tag_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reset_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test@test.fr','[]','$2y$13$S9p/PTntTKoFPTmkCP8CjepQtPIY9pdaTD1Et382SrkSC7ns8g4Rq','test',''),(2,'test2@test.fr','[]','$2y$13$iwjI59j68J/RFi2YEzO9m.Q4pn.Jd0j.pxUNExgmDz/VkjTLeR2d2','te',NULL),(3,'test33@test.fr','[]','$2y$13$eDaaInfPHkT32Ui.bBeu8eTh834nTL69jG9bEA.y8addcg7N9gnS.','tat',NULL),(4,'admin@test.fr','[\"ROLE_ADMIN\"]','$2y$13$YF2mzY7KX3xkexCpTNY6Eu5kF8dTyE6v4Q8hBG85XCw/Kr5xOMneG','admin','21c1fa89-e8b1-4f27-a4ee-aee6dd8c574c'),(11,'test5@test.fr','[]','$2y$13$JRx1FFIMX1V1z.0AgEKW3.chIYHOFM/88NFxNaAm8NrYQQRaAhrMC','test6',NULL),(12,'test4@test.fr','[]','$2y$13$X1PvioQ3B3KpzpzDmXwnyugAzZk2u9bmPI074yIXK22ptPi2qcf82','test4',NULL),(17,'lastTest@test.fr','[]','$2y$13$WwXT5uvrILpPjxHMLmmxAe76aVz0J9q1JjuIjS2/YRLiNTNpNTbpS','lastTest',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_book`
--

DROP TABLE IF EXISTS `user_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status_id` int NOT NULL,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  `create_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `note` int DEFAULT NULL,
  `comment_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B164EFF86BF700BD` (`status_id`),
  KEY `IDX_B164EFF8A76ED395` (`user_id`),
  KEY `IDX_B164EFF816A2B381` (`book_id`),
  CONSTRAINT `FK_B164EFF816A2B381` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `FK_B164EFF86BF700BD` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `FK_B164EFF8A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_book`
--

LOCK TABLES `user_book` WRITE;
/*!40000 ALTER TABLE `user_book` DISABLE KEYS */;
INSERT INTO `user_book` VALUES (11,1,2,25,'2023-11-13 10:14:41','2023-11-13 10:14:41',NULL,0,NULL),(14,1,1,17,'2023-11-13 10:15:47','2023-11-13 10:15:47',NULL,4,NULL),(15,1,3,17,'2023-11-13 10:21:47','2023-11-13 10:21:47',NULL,5,NULL),(17,3,4,16,'2023-11-16 07:14:55','2023-11-16 07:14:55','',4,'Un bon Barjavel'),(18,2,4,28,'2023-11-16 07:32:08','2023-11-16 07:32:08','trop bien !!',5,NULL),(19,1,1,28,'2023-11-16 08:28:35','2023-11-16 08:28:35',NULL,4,NULL),(21,1,4,18,'2023-11-16 10:55:52','2023-11-16 10:55:52',NULL,0,NULL),(23,2,1,29,'2023-11-16 17:48:26','2023-11-16 17:48:26',NULL,1,NULL),(24,1,1,16,'2023-11-17 16:36:28','2023-11-17 16:36:28',NULL,0,NULL),(25,2,1,31,'2023-11-20 09:06:23','2023-11-20 09:06:23','Post hoc impie perpetratum quod in aliis quoque iam timebatur, tamquam licentia crudelitati indulta per suspicionum nebulas aestimati quidam noxii damnabantur. quorum pars necati, alii puniti bonorum multatione actique laribus suis extorres nullo sibi relicto praeter querelas et lacrimas, stipe conlaticia victitabant, et civili iustoque imperio ad voluntatem converso cruentam, claudebantur opulentae domus et clarae.  Eodem tempore etiam Hymetii praeclarae indolis viri negotium est actitatum, cuius hunc novimus esse textum. cum Africam pro consule regeret Carthaginiensibus victus inopia iam lassatis, ex horreis Romano populo destinatis frumentum dedit, pauloque postea cum provenisset segetum copia, integre sine ulla restituit mora.',4,NULL),(26,1,4,31,'2023-11-20 18:34:54','2023-11-20 18:34:54','',5,NULL),(27,1,4,29,'2023-11-21 10:05:08','2023-11-21 10:05:08','Un bon classique de SF. un peu lent',3,'Un classique'),(28,1,1,34,'2023-11-21 20:51:21','2023-11-21 20:51:21',NULL,0,NULL),(32,3,4,34,'2023-11-29 12:12:19','2023-11-29 12:12:19','',4,'Original, sympa à lire mais fin décevante'),(33,2,4,37,'2023-11-29 12:14:58','2023-11-29 12:14:58','',5,'bon livre de SF - intrigue est originale'),(34,2,17,38,'2023-12-01 09:02:41','2023-12-01 09:02:41','',4,'pas relu depuis le lycee'),(35,1,1,19,'2023-12-02 14:01:31','2023-12-02 14:01:31',NULL,0,NULL),(36,2,1,39,'2023-12-02 14:06:31','2023-12-02 14:06:31','',3,'super bouqin de SF');
/*!40000 ALTER TABLE `user_book` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-02 19:37:44
