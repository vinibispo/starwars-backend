# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

sqls = <<-SQL

  INSERT INTO films(title,episode_id,opening_crawl,director,producer,release_date,id) VALUES ('A New Hope',4,'It is a period of civil war.
  Rebel spaceships, striking
  from a hidden base, have won
  their first victory against
  the evil Galactic Empire.

  During the battle, Rebel
  spies managed to steal secret
  plans to the Empire''s
  ultimate weapon, the DEATH
  STAR, an armored space
  station with enough power
  to destroy an entire planet.

  Pursued by the Empire''s
  sinister agents, Princess
  Leia races home aboard her
  starship, custodian of the
  stolen plans that can save her
  people and restore
  freedom to the galaxy....','George Lucas','Gary Kurtz, Rick McCallum','1977-05-25',1);
  INSERT INTO films(title,episode_id,opening_crawl,director,producer,release_date,id) VALUES ('The Empire Strikes Back',5,'It is a dark time for the
  Rebellion. Although the Death
  Star has been destroyed,
  Imperial troops have driven the
  Rebel forces from their hidden
  base and pursued them across
  the galaxy.

  Evading the dreaded Imperial
  Starfleet, a group of freedom
  fighters led by Luke Skywalker
  has established a new secret
  base on the remote ice world
  of Hoth.

  The evil lord Darth Vader,
  obsessed with finding young
  Skywalker, has dispatched
  thousands of remote probes into
  the far reaches of space....','Irvin Kershner','Gary Kurtz, Rick McCallum','1980-05-17',2);
  INSERT INTO films(title,episode_id,opening_crawl,director,producer,release_date,id) VALUES ('Return of the Jedi',6,'Luke Skywalker has returned to
  his home planet of Tatooine in
  an attempt to rescue his
  friend Han Solo from the
  clutches of the vile gangster
  Jabba the Hutt.

  Little does Luke know that the
  GALACTIC EMPIRE has secretly
  begun construction on a new
  armored space station even
  more powerful than the first
  dreaded Death Star.

  When completed, this ultimate
  weapon will spell certain doom
  for the small band of rebels
  struggling to restore freedom
  to the galaxy...','Richard Marquand','Howard G. Kazanjian, George Lucas, Rick McCallum','1983-05-25',3);
  INSERT INTO films(title,episode_id,opening_crawl,director,producer,release_date,id) VALUES ('The Phantom Menace',1,'Turmoil has engulfed the
  Galactic Republic. The taxation
  of trade routes to outlying star
  systems is in dispute.

  Hoping to resolve the matter
  with a blockade of deadly
  battleships, the greedy Trade
  Federation has stopped all
  shipping to the small planet
  of Naboo.

  While the Congress of the
  Republic endlessly debates
  this alarming chain of events,
  the Supreme Chancellor has
  secretly dispatched two Jedi
  Knights, the guardians of
  peace and justice in the
  galaxy, to settle the conflict....','George Lucas','Rick McCallum','1999-05-19',4);
  INSERT INTO films(title,episode_id,opening_crawl,director,producer,release_date,id) VALUES ('Attack of the Clones',2,'There is unrest in the Galactic
  Senate. Several thousand solar
  systems have declared their
  intentions to leave the Republic.

  This separatist movement,
  under the leadership of the
  mysterious Count Dooku, has
  made it difficult for the limited
  number of Jedi Knights to maintain#{' '}
  peace and order in the galaxy.

  Senator Amidala, the former
  Queen of Naboo, is returning
  to the Galactic Senate to vote
  on the critical issue of creating
  an ARMY OF THE REPUBLIC
  to assist the overwhelmed
  Jedi....','George Lucas','Rick McCallum','2002-05-16',5);
  INSERT INTO films(title,episode_id,opening_crawl,director,producer,release_date,id) VALUES ('Revenge of the Sith',3,'War! The Republic is crumbling
  under attacks by the ruthless
  Sith Lord, Count Dooku.
  There are heroes on both sides.
  Evil is everywhere.

  In a stunning move, the
  fiendish droid leader, General
  Grievous, has swept into the
  Republic capital and kidnapped
  Chancellor Palpatine, leader of
  the Galactic Senate.

  As the Separatist Droid Army
  attempts to flee the besieged
  capital with their valuable
  hostage, two Jedi Knights lead a
  desperate mission to rescue the
  captive Chancellor....','George Lucas','Rick McCallum','2005-05-19',6);

  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Tatooine','23','304','10465','arid','1 standard','desert','1','200000',1);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Alderaan','24','364','12500','temperate','1 standard','grasslands, mountains','40','2000000000',2);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Yavin IV','24','4818','10200','temperate, tropical','1 standard','jungle, rainforests','8','1000',3);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Hoth','23','549','7200','frozen','1.1 standard','tundra, ice caves, mountain ranges','100','unknown',4);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Dagobah','23','341','8900','murky','N/A','swamp, jungles','8','unknown',5);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Bespin','12','5110','118000','temperate','1.5 (surface), 1 standard (Cloud City)','gas giant','0','6000000',6);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Endor','18','402','4900','temperate','0.85 standard','forests, mountains, lakes','8','30000000',7);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Naboo','26','312','12120','temperate','1 standard','grassy hills, swamps, forests, mountains','12','4500000000',8);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Coruscant','24','368','12240','temperate','1 standard','cityscape, mountains','unknown','1000000000000',9);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Kamino','27','463','19720','temperate','1 standard','ocean','100','1000000000',10);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Geonosis','30','256','11370','temperate, arid','0.9 standard','rock, desert, mountain, barren','5','100000000000',11);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Utapau','27','351','12900','temperate, arid, windy','1 standard','scrublands, savanna, canyons, sinkholes','0.9','95000000',12);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Mustafar','36','412','4200','hot','1 standard','volcanoes, lava rivers, mountains, caves','0','20000',13);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Kashyyyk','26','381','12765','tropical','1 standard','jungle, forests, lakes, rivers','60','45000000',14);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Polis Massa','24','590','0','artificial temperate','0.56 standard','airless asteroid','0','1000000',15);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Mygeeto','12','167','10088','frigid','1 standard','glaciers, mountains, ice canyons','unknown','19000000',16);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Felucia','34','231','9100','hot, humid','0.75 standard','fungus forests','unknown','8500000',17);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Cato Neimoidia','25','278','0','temperate, moist','1 standard','mountains, fields, forests, rock arches','unknown','10000000',18);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Saleucami','26','392','14920','hot','unknown','caves, desert, mountains, volcanoes','unknown','1400000000',19);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Stewjon','unknown','unknown','0','temperate','1 standard','grass','unknown','unknown',20);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Eriadu','24','360','13490','polluted','1 standard','cityscape','unknown','22000000000',21);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Corellia','25','329','11000','temperate','1 standard','plains, urban, hills, forests','70','3000000000',22);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Rodia','29','305','7549','hot','1 standard','jungles, oceans, urban, swamps','60','1300000000',23);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Nal Hutta','87','413','12150','temperate','1 standard','urban, oceans, swamps, bogs','unknown','7000000000',24);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Dantooine','25','378','9830','temperate','1 standard','oceans, savannas, mountains, grasslands','unknown','1000',25);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Bestine IV','26','680','6400','temperate','unknown','rocky islands, oceans','98','62000000',26);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Ord Mantell','26','334','14050','temperate','1 standard','plains, seas, mesas','10','4000000000',27);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('unknown','0','0','0','unknown','unknown','unknown','unknown','unknown',28);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Trandosha','25','371','0','arid','0.62 standard','mountains, seas, grasslands, deserts','unknown','42000000',29);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Socorro','20','326','0','arid','1 standard','deserts, mountains','unknown','300000000',30);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Mon Cala','21','398','11030','temperate','1','oceans, reefs, islands','100','27000000000',31);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Chandrila','20','368','13500','temperate','1','plains, forests','40','1200000000',32);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Sullust','20','263','12780','superheated','1','mountains, volcanoes, rocky deserts','5','18500000000',33);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Toydaria','21','184','7900','temperate','1','swamps, lakes','unknown','11000000',34);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Malastare','26','201','18880','arid, temperate, tropical','1.56','swamps, deserts, jungles, mountains','unknown','2000000000',35);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Dathomir','24','491','10480','temperate','0.9','forests, deserts, savannas','unknown','5200',36);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Ryloth','30','305','10600','temperate, arid, subartic','1','mountains, valleys, deserts, tundra','5','1500000000',37);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Aleen Minor','unknown','unknown','unknown','unknown','unknown','unknown','unknown','unknown',38);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Vulpter','22','391','14900','temperate, artic','1','urban, barren','unknown','421000000',39);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Troiken','unknown','unknown','unknown','unknown','unknown','desert, tundra, rainforests, mountains','unknown','unknown',40);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Tund','48','1770','12190','unknown','unknown','barren, ash','unknown','0',41);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Haruun Kal','25','383','10120','temperate','0.98','toxic cloudsea, plateaus, volcanoes','unknown','705300',42);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Cerea','27','386','unknown','temperate','1','verdant','20','450000000',43);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Glee Anselm','33','206','15600','tropical, temperate','1','lakes, islands, swamps, seas','80','500000000',44);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Iridonia','29','413','unknown','unknown','unknown','rocky canyons, acid pools','unknown','unknown',45);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Tholoth','unknown','unknown','unknown','unknown','unknown','unknown','unknown','unknown',46);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Iktotch','22','481','unknown','arid, rocky, windy','1','rocky','unknown','unknown',47);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Quermia','unknown','unknown','unknown','unknown','unknown','unknown','unknown','unknown',48);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Dorin','22','409','13400','temperate','1','unknown','unknown','unknown',49);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Champala','27','318','unknown','temperate','1','oceans, rainforests, plateaus','unknown','3500000000',50);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Mirial','unknown','unknown','unknown','unknown','unknown','deserts','unknown','unknown',51);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Serenno','unknown','unknown','unknown','unknown','unknown','rainforests, rivers, mountains','unknown','unknown',52);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Concord Dawn','unknown','unknown','unknown','unknown','unknown','jungles, forests, deserts','unknown','unknown',53);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Zolan','unknown','unknown','unknown','unknown','unknown','unknown','unknown','unknown',54);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Ojom','unknown','unknown','unknown','frigid','unknown','oceans, glaciers','100','500000000',55);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Skako','27','384','unknown','temperate','1','urban, vines','unknown','500000000000',56);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Muunilinst','28','412','13800','temperate','1','plains, forests, hills, mountains','25','5000000000',57);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Shili','unknown','unknown','unknown','temperate','1','cities, savannahs, seas, plains','unknown','unknown',58);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Kalee','23','378','13850','arid, temperate, tropical','1','rainforests, cliffs, canyons, seas','unknown','4000000000',59);
  INSERT INTO planets(name,rotation_period,orbital_period,diameter,climate,gravity,terrain,surface_water,population,id) VALUES ('Umbara','unknown','unknown','unknown','unknown','unknown','unknown','unknown','unknown',60);

  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Luke Skywalker','172','77','blond','fair','blue','19BBY','male',1,1);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('C-3PO','167','75','n/a','gold','yellow','112BBY','n/a',1,2);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('R2-D2','96','32','n/a','white, blue','red','33BBY','n/a',8,3);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Darth Vader','202','136','none','white','yellow','41.9BBY','male',1,4);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Leia Organa','150','49','brown','light','brown','19BBY','female',2,5);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Owen Lars','178','120','brown, grey','light','blue','52BBY','male',1,6);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Beru Whitesun lars','165','75','brown','light','blue','47BBY','female',1,7);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('R5-D4','97','32','n/a','white, red','red','unknown','n/a',1,8);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Biggs Darklighter','183','84','black','light','brown','24BBY','male',1,9);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Obi-Wan Kenobi','182','77','auburn, white','fair','blue-gray','57BBY','male',20,10);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Anakin Skywalker','188','84','blond','fair','blue','41.9BBY','male',1,11);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Wilhuff Tarkin','180','unknown','auburn, grey','fair','blue','64BBY','male',21,12);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Chewbacca','228','112','brown','unknown','blue','200BBY','male',14,13);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Han Solo','180','80','brown','fair','brown','29BBY','male',22,14);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Greedo','173','74','n/a','green','black','44BBY','male',23,15);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Jabba Desilijic Tiure','175','1,358','n/a','green-tan, brown','orange','600BBY','hermaphrodite',24,16);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Wedge Antilles','170','77','brown','fair','hazel','21BBY','male',22,18);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Jek Tono Porkins','180','110','brown','fair','blue','unknown','male',26,19);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Yoda','66','17','white','green','brown','896BBY','male',28,20);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Palpatine','170','75','grey','pale','yellow','82BBY','male',8,21);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Boba Fett','183','78.2','black','fair','brown','31.5BBY','male',10,22);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('IG-88','200','140','none','metal','red','15BBY','none',28,23);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Bossk','190','113','none','green','red','53BBY','male',29,24);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Lando Calrissian','177','79','black','dark','brown','31BBY','male',30,25);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Lobot','175','79','none','light','blue','37BBY','male',6,26);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Ackbar','180','83','none','brown mottle','orange','41BBY','male',31,27);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Mon Mothma','150','unknown','auburn','fair','blue','48BBY','female',32,28);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Arvel Crynyd','unknown','unknown','brown','fair','brown','unknown','male',28,29);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Wicket Systri Warrick','88','20','brown','brown','brown','8BBY','male',7,30);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Nien Nunb','160','68','none','grey','black','unknown','male',33,31);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Qui-Gon Jinn','193','89','brown','fair','blue','92BBY','male',28,32);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Nute Gunray','191','90','none','mottled green','red','unknown','male',18,33);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Finis Valorum','170','unknown','blond','fair','blue','91BBY','male',9,34);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Padmé Amidala','185','45','brown','light','brown','46BBY','female',8,35);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Jar Jar Binks','196','66','none','orange','orange','52BBY','male',8,36);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Roos Tarpals','224','82','none','grey','orange','unknown','male',8,37);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Rugor Nass','206','unknown','none','green','orange','unknown','male',8,38);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Ric Olié','183','unknown','brown','fair','blue','unknown','male',8,39);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Watto','137','unknown','black','blue, grey','yellow','unknown','male',34,40);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Sebulba','112','40','none','grey, red','orange','unknown','male',35,41);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Quarsh Panaka','183','unknown','black','dark','brown','62BBY','male',8,42);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Shmi Skywalker','163','unknown','black','fair','brown','72BBY','female',1,43);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Darth Maul','175','80','none','red','yellow','54BBY','male',36,44);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Bib Fortuna','180','unknown','none','pale','pink','unknown','male',37,45);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Ayla Secura','178','55','none','blue','hazel','48BBY','female',37,46);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Ratts Tyerel','79','15','none','grey, blue','unknown','unknown','male',38,47);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Dud Bolt','94','45','none','blue, grey','yellow','unknown','male',39,48);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Gasgano','122','unknown','none','white, blue','black','unknown','male',40,49);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Ben Quadinaros','163','65','none','grey, green, yellow','orange','unknown','male',41,50);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Mace Windu','188','84','none','dark','brown','72BBY','male',42,51);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Ki-Adi-Mundi','198','82','white','pale','yellow','92BBY','male',43,52);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Kit Fisto','196','87','none','green','black','unknown','male',44,53);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Eeth Koth','171','unknown','black','brown','brown','unknown','male',45,54);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Adi Gallia','184','50','none','dark','blue','unknown','female',9,55);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Saesee Tiin','188','unknown','none','pale','orange','unknown','male',47,56);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Yarael Poof','264','unknown','none','white','yellow','unknown','male',48,57);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Plo Koon','188','80','none','orange','black','22BBY','male',49,58);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Mas Amedda','196','unknown','none','blue','blue','unknown','male',50,59);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Gregar Typho','185','85','black','dark','brown','unknown','male',8,60);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Cordé','157','unknown','brown','light','brown','unknown','female',8,61);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Cliegg Lars','183','unknown','brown','fair','blue','82BBY','male',1,62);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Poggle the Lesser','183','80','none','green','yellow','unknown','male',11,63);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Luminara Unduli','170','56.2','black','yellow','blue','58BBY','female',51,64);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Barriss Offee','166','50','black','yellow','blue','40BBY','female',51,65);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Dormé','165','unknown','brown','light','brown','unknown','female',8,66);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Dooku','193','80','white','fair','brown','102BBY','male',52,67);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Bail Prestor Organa','191','unknown','black','tan','brown','67BBY','male',2,68);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Jango Fett','183','79','black','tan','brown','66BBY','male',53,69);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Zam Wesell','168','55','blonde','fair, green, yellow','yellow','unknown','female',54,70);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Dexter Jettster','198','102','none','brown','yellow','unknown','male',55,71);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Lama Su','229','88','none','grey','black','unknown','male',10,72);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Taun We','213','unknown','none','grey','black','unknown','female',10,73);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Jocasta Nu','167','unknown','white','fair','blue','unknown','female',9,74);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('R4-P17','96','unknown','none','silver, red','red, blue','unknown','female',28,75);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Wat Tambor','193','48','none','green, grey','unknown','unknown','male',56,76);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('San Hill','191','unknown','none','grey','gold','unknown','male',57,77);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Shaak Ti','178','57','none','red, blue, white','black','unknown','female',58,78);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Grievous','216','159','none','brown, white','green, yellow','unknown','male',59,79);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Tarfful','234','136','brown','brown','blue','unknown','male',14,80);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Raymus Antilles','188','79','brown','light','brown','unknown','male',2,81);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Sly Moore','178','48','none','pale','white','unknown','female',60,82);
  INSERT INTO people(name,height,mass,hair_color,skin_color,eye_color,birth_year,gender,homeworld,id) VALUES ('Tion Medon','206','80','none','grey','black','unknown','male',12,83);

  INSERT INTO film_people(people_id,film_id) VALUES (1,1);
  INSERT INTO film_people(people_id,film_id) VALUES (1,2);
  INSERT INTO film_people(people_id,film_id) VALUES (1,3);
  INSERT INTO film_people(people_id,film_id) VALUES (1,6);
  INSERT INTO film_people(people_id,film_id) VALUES (2,1);
  INSERT INTO film_people(people_id,film_id) VALUES (2,2);
  INSERT INTO film_people(people_id,film_id) VALUES (2,3);
  INSERT INTO film_people(people_id,film_id) VALUES (2,4);
  INSERT INTO film_people(people_id,film_id) VALUES (2,5);
  INSERT INTO film_people(people_id,film_id) VALUES (2,6);
  INSERT INTO film_people(people_id,film_id) VALUES (3,1);
  INSERT INTO film_people(people_id,film_id) VALUES (3,2);
  INSERT INTO film_people(people_id,film_id) VALUES (3,3);
  INSERT INTO film_people(people_id,film_id) VALUES (3,4);
  INSERT INTO film_people(people_id,film_id) VALUES (3,5);
  INSERT INTO film_people(people_id,film_id) VALUES (3,6);
  INSERT INTO film_people(people_id,film_id) VALUES (4,1);
  INSERT INTO film_people(people_id,film_id) VALUES (4,2);
  INSERT INTO film_people(people_id,film_id) VALUES (4,3);
  INSERT INTO film_people(people_id,film_id) VALUES (4,6);
  INSERT INTO film_people(people_id,film_id) VALUES (5,1);
  INSERT INTO film_people(people_id,film_id) VALUES (5,2);
  INSERT INTO film_people(people_id,film_id) VALUES (5,3);
  INSERT INTO film_people(people_id,film_id) VALUES (5,6);
  INSERT INTO film_people(people_id,film_id) VALUES (6,1);
  INSERT INTO film_people(people_id,film_id) VALUES (6,5);
  INSERT INTO film_people(people_id,film_id) VALUES (6,6);
  INSERT INTO film_people(people_id,film_id) VALUES (7,1);
  INSERT INTO film_people(people_id,film_id) VALUES (7,5);
  INSERT INTO film_people(people_id,film_id) VALUES (7,6);
  INSERT INTO film_people(people_id,film_id) VALUES (8,1);
  INSERT INTO film_people(people_id,film_id) VALUES (9,1);
  INSERT INTO film_people(people_id,film_id) VALUES (10,1);
  INSERT INTO film_people(people_id,film_id) VALUES (10,2);
  INSERT INTO film_people(people_id,film_id) VALUES (10,3);
  INSERT INTO film_people(people_id,film_id) VALUES (10,4);
  INSERT INTO film_people(people_id,film_id) VALUES (10,5);
  INSERT INTO film_people(people_id,film_id) VALUES (10,6);
  INSERT INTO film_people(people_id,film_id) VALUES (11,4);
  INSERT INTO film_people(people_id,film_id) VALUES (11,5);
  INSERT INTO film_people(people_id,film_id) VALUES (11,6);
  INSERT INTO film_people(people_id,film_id) VALUES (12,1);
  INSERT INTO film_people(people_id,film_id) VALUES (12,6);
  INSERT INTO film_people(people_id,film_id) VALUES (13,1);
  INSERT INTO film_people(people_id,film_id) VALUES (13,2);
  INSERT INTO film_people(people_id,film_id) VALUES (13,3);
  INSERT INTO film_people(people_id,film_id) VALUES (13,6);
  INSERT INTO film_people(people_id,film_id) VALUES (14,1);
  INSERT INTO film_people(people_id,film_id) VALUES (14,2);
  INSERT INTO film_people(people_id,film_id) VALUES (14,3);
  INSERT INTO film_people(people_id,film_id) VALUES (15,1);
  INSERT INTO film_people(people_id,film_id) VALUES (16,1);
  INSERT INTO film_people(people_id,film_id) VALUES (16,3);
  INSERT INTO film_people(people_id,film_id) VALUES (16,4);
  INSERT INTO film_people(people_id,film_id) VALUES (18,1);
  INSERT INTO film_people(people_id,film_id) VALUES (18,2);
  INSERT INTO film_people(people_id,film_id) VALUES (18,3);
  INSERT INTO film_people(people_id,film_id) VALUES (19,1);
  INSERT INTO film_people(people_id,film_id) VALUES (20,2);
  INSERT INTO film_people(people_id,film_id) VALUES (20,3);
  INSERT INTO film_people(people_id,film_id) VALUES (20,4);
  INSERT INTO film_people(people_id,film_id) VALUES (20,5);
  INSERT INTO film_people(people_id,film_id) VALUES (20,6);
  INSERT INTO film_people(people_id,film_id) VALUES (21,2);
  INSERT INTO film_people(people_id,film_id) VALUES (21,3);
  INSERT INTO film_people(people_id,film_id) VALUES (21,4);
  INSERT INTO film_people(people_id,film_id) VALUES (21,5);
  INSERT INTO film_people(people_id,film_id) VALUES (21,6);
  INSERT INTO film_people(people_id,film_id) VALUES (22,2);
  INSERT INTO film_people(people_id,film_id) VALUES (22,3);
  INSERT INTO film_people(people_id,film_id) VALUES (22,5);
  INSERT INTO film_people(people_id,film_id) VALUES (23,2);
  INSERT INTO film_people(people_id,film_id) VALUES (24,2);
  INSERT INTO film_people(people_id,film_id) VALUES (25,2);
  INSERT INTO film_people(people_id,film_id) VALUES (25,3);
  INSERT INTO film_people(people_id,film_id) VALUES (26,2);
  INSERT INTO film_people(people_id,film_id) VALUES (27,3);
  INSERT INTO film_people(people_id,film_id) VALUES (28,3);
  INSERT INTO film_people(people_id,film_id) VALUES (29,3);
  INSERT INTO film_people(people_id,film_id) VALUES (30,3);
  INSERT INTO film_people(people_id,film_id) VALUES (31,3);
  INSERT INTO film_people(people_id,film_id) VALUES (32,4);
  INSERT INTO film_people(people_id,film_id) VALUES (33,4);
  INSERT INTO film_people(people_id,film_id) VALUES (33,5);
  INSERT INTO film_people(people_id,film_id) VALUES (33,6);
  INSERT INTO film_people(people_id,film_id) VALUES (34,4);
  INSERT INTO film_people(people_id,film_id) VALUES (35,4);
  INSERT INTO film_people(people_id,film_id) VALUES (35,5);
  INSERT INTO film_people(people_id,film_id) VALUES (35,6);
  INSERT INTO film_people(people_id,film_id) VALUES (36,4);
  INSERT INTO film_people(people_id,film_id) VALUES (36,5);
  INSERT INTO film_people(people_id,film_id) VALUES (37,4);
  INSERT INTO film_people(people_id,film_id) VALUES (38,4);
  INSERT INTO film_people(people_id,film_id) VALUES (39,4);
  INSERT INTO film_people(people_id,film_id) VALUES (40,4);
  INSERT INTO film_people(people_id,film_id) VALUES (40,5);
  INSERT INTO film_people(people_id,film_id) VALUES (41,4);
  INSERT INTO film_people(people_id,film_id) VALUES (42,4);
  INSERT INTO film_people(people_id,film_id) VALUES (43,4);
  INSERT INTO film_people(people_id,film_id) VALUES (43,5);
  INSERT INTO film_people(people_id,film_id) VALUES (44,4);
  INSERT INTO film_people(people_id,film_id) VALUES (45,3);
  INSERT INTO film_people(people_id,film_id) VALUES (46,4);
  INSERT INTO film_people(people_id,film_id) VALUES (46,5);
  INSERT INTO film_people(people_id,film_id) VALUES (46,6);
  INSERT INTO film_people(people_id,film_id) VALUES (47,4);
  INSERT INTO film_people(people_id,film_id) VALUES (48,4);
  INSERT INTO film_people(people_id,film_id) VALUES (49,4);
  INSERT INTO film_people(people_id,film_id) VALUES (50,4);
  INSERT INTO film_people(people_id,film_id) VALUES (51,4);
  INSERT INTO film_people(people_id,film_id) VALUES (51,5);
  INSERT INTO film_people(people_id,film_id) VALUES (51,6);
  INSERT INTO film_people(people_id,film_id) VALUES (52,4);
  INSERT INTO film_people(people_id,film_id) VALUES (52,5);
  INSERT INTO film_people(people_id,film_id) VALUES (52,6);
  INSERT INTO film_people(people_id,film_id) VALUES (53,4);
  INSERT INTO film_people(people_id,film_id) VALUES (53,5);
  INSERT INTO film_people(people_id,film_id) VALUES (53,6);
  INSERT INTO film_people(people_id,film_id) VALUES (54,4);
  INSERT INTO film_people(people_id,film_id) VALUES (54,6);
  INSERT INTO film_people(people_id,film_id) VALUES (55,4);
  INSERT INTO film_people(people_id,film_id) VALUES (55,6);
  INSERT INTO film_people(people_id,film_id) VALUES (56,4);
  INSERT INTO film_people(people_id,film_id) VALUES (56,6);
  INSERT INTO film_people(people_id,film_id) VALUES (57,4);
  INSERT INTO film_people(people_id,film_id) VALUES (58,4);
  INSERT INTO film_people(people_id,film_id) VALUES (58,5);
  INSERT INTO film_people(people_id,film_id) VALUES (58,6);
  INSERT INTO film_people(people_id,film_id) VALUES (59,4);
  INSERT INTO film_people(people_id,film_id) VALUES (59,5);
  INSERT INTO film_people(people_id,film_id) VALUES (60,5);
  INSERT INTO film_people(people_id,film_id) VALUES (61,5);
  INSERT INTO film_people(people_id,film_id) VALUES (62,5);
  INSERT INTO film_people(people_id,film_id) VALUES (63,5);
  INSERT INTO film_people(people_id,film_id) VALUES (63,6);
  INSERT INTO film_people(people_id,film_id) VALUES (64,5);
  INSERT INTO film_people(people_id,film_id) VALUES (64,6);
  INSERT INTO film_people(people_id,film_id) VALUES (65,5);
  INSERT INTO film_people(people_id,film_id) VALUES (66,5);
  INSERT INTO film_people(people_id,film_id) VALUES (67,5);
  INSERT INTO film_people(people_id,film_id) VALUES (67,6);
  INSERT INTO film_people(people_id,film_id) VALUES (68,5);
  INSERT INTO film_people(people_id,film_id) VALUES (68,6);
  INSERT INTO film_people(people_id,film_id) VALUES (69,5);
  INSERT INTO film_people(people_id,film_id) VALUES (70,5);
  INSERT INTO film_people(people_id,film_id) VALUES (71,5);
  INSERT INTO film_people(people_id,film_id) VALUES (72,5);
  INSERT INTO film_people(people_id,film_id) VALUES (73,5);
  INSERT INTO film_people(people_id,film_id) VALUES (74,5);
  INSERT INTO film_people(people_id,film_id) VALUES (75,5);
  INSERT INTO film_people(people_id,film_id) VALUES (75,6);
  INSERT INTO film_people(people_id,film_id) VALUES (76,5);
  INSERT INTO film_people(people_id,film_id) VALUES (77,5);
  INSERT INTO film_people(people_id,film_id) VALUES (78,5);
  INSERT INTO film_people(people_id,film_id) VALUES (78,6);
  INSERT INTO film_people(people_id,film_id) VALUES (79,6);
  INSERT INTO film_people(people_id,film_id) VALUES (80,6);
  INSERT INTO film_people(people_id,film_id) VALUES (81,1);
  INSERT INTO film_people(people_id,film_id) VALUES (81,6);
  INSERT INTO film_people(people_id,film_id) VALUES (82,5);
  INSERT INTO film_people(people_id,film_id) VALUES (82,6);
  INSERT INTO film_people(people_id,film_id) VALUES (83,6);

  INSERT INTO film_planet(planet_id,film_id) VALUES (1,1);
  INSERT INTO film_planet(planet_id,film_id) VALUES (1,3);
  INSERT INTO film_planet(planet_id,film_id) VALUES (1,4);
  INSERT INTO film_planet(planet_id,film_id) VALUES (1,5);
  INSERT INTO film_planet(planet_id,film_id) VALUES (1,6);
  INSERT INTO film_planet(planet_id,film_id) VALUES (2,1);
  INSERT INTO film_planet(planet_id,film_id) VALUES (2,6);
  INSERT INTO film_planet(planet_id,film_id) VALUES (3,1);
  INSERT INTO film_planet(planet_id,film_id) VALUES (4,2);
  INSERT INTO film_planet(planet_id,film_id) VALUES (5,2);
  INSERT INTO film_planet(planet_id,film_id) VALUES (5,3);
  INSERT INTO film_planet(planet_id,film_id) VALUES (5,6);
  INSERT INTO film_planet(planet_id,film_id) VALUES (6,2);
  INSERT INTO film_planet(planet_id,film_id) VALUES (7,3);
  INSERT INTO film_planet(planet_id,film_id) VALUES (8,3);
  INSERT INTO film_planet(planet_id,film_id) VALUES (8,4);
  INSERT INTO film_planet(planet_id,film_id) VALUES (8,5);
  INSERT INTO film_planet(planet_id,film_id) VALUES (8,6);
  INSERT INTO film_planet(planet_id,film_id) VALUES (9,3);
  INSERT INTO film_planet(planet_id,film_id) VALUES (9,4);
  INSERT INTO film_planet(planet_id,film_id) VALUES (9,5);
  INSERT INTO film_planet(planet_id,film_id) VALUES (9,6);
  INSERT INTO film_planet(planet_id,film_id) VALUES (10,5);
  INSERT INTO film_planet(planet_id,film_id) VALUES (11,5);
  INSERT INTO film_planet(planet_id,film_id) VALUES (12,6);
  INSERT INTO film_planet(planet_id,film_id) VALUES (13,6);
  INSERT INTO film_planet(planet_id,film_id) VALUES (14,6);
  INSERT INTO film_planet(planet_id,film_id) VALUES (15,6);
  INSERT INTO film_planet(planet_id,film_id) VALUES (16,6);
  INSERT INTO film_planet(planet_id,film_id) VALUES (17,6);
  INSERT INTO film_planet(planet_id,film_id) VALUES (18,6);
  INSERT INTO film_planet(planet_id,film_id) VALUES (19,6);
  INSERT INTO film_planet(planet_id,film_id) VALUES (27,2);
SQL

ApplicationRecord.transaction do
  sqls.squish.split(';').each { |sql| ActiveRecord::Base.connection.execute(sql.squish) }
end
