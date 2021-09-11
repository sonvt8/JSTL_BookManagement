
create database jstl_books

use jstl_books

CREATE TABLE Categories (
    Id int IDENTITY(1,1) Primary Key,
    Name nvarchar(50) NOT NULL,
);

CREATE TABLE Books (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Title nvarchar(max) NOT NULL,
	Author nvarchar(max) NOT NULL,
	Price varchar(5) NOT NULL,
	Released date NULL,
	Quantity int NOT NULL,
	ImageUrl nvarchar (max) NOT NULL,
	Description nvarchar(max) NOT NULL,
	CategoryId INT FOREIGN KEY REFERENCES Categories(id)
);

CREATE TABLE WebUser(
  uid VARCHAR(250) NOT NULL,
  password VARCHAR(250) NULL,
  authlevel INT NULL DEFAULT 0,
  PRIMARY KEY (uid)
);

INSERT INTO 
	WebUser(uid, password, authlevel)
VALUES
	('admin','secret',2),
	('user1','secret',1),
	('user2','secret',0);	
	
INSERT INTO 
	Categories(Name)
VALUES
	('Action and Adventure'),
	('Classics'),
	('Comic Book or Graphic Novel'),
	('Fantasy');
	
INSERT INTO 
	Books(Title,Author,Price,Released,Quantity,ImageUrl,Description,CategoryId)
VALUES
	('Life of Pi','Yann Martel','8.54','2003/05/01','110','Life of Pi.jpg','The son of a zookeeper, Pi Patel has an encyclopedic knowledge of animal behavior and a fervent love of stories. When Pi is sixteen, his family emigrates from India to North America aboard a Japanese cargo ship, along with their zoo animals bound for new homes.',1),
	('Watchmen','Alan Moore','9.50','2019/05/20','151','Watchmen.jpg','Considered the greatest graphic novel in the history of the medium, the Hugo Award-winning story chronicles the fall from grace of a group of superheroes plagued by all-too-human failings. Along the way, the concept of the superhero is dissected as an unknown assassin stalks the erstwhile heroes.',3),
	('The Call of the Wild','Jack London','2.99','2020/12/21','97','The Call of the Wild.jpg','The Call of the Wild is a novel by Jack London published in 1903. The story is set in the Yukon during the 1890s Klondike Gold Rush—a period in which strong sled dogs were in high demand. The novel s central character is a dog named Buck, a domesticated dog living at a ranch in the Santa Clara Valley of California as the story opens. Stolen from his home and sold into service as sled dog in Alaska, he reverts to a wild state. Buck is forced to fight in order to dominate other dogs in a harsh climate.',1),
	('Little Women','Louisa May Alcott','0.45','2018/09/25','167','Little Women.jpg','For generations, children around the world have come of age with Louisa May Alcott s March girls: hardworking eldest sister Meg, headstrong, impulsive Jo, timid Beth, and precocious Amy. With their father away at war, and their loving mother Marmee working to support the family, the four sisters have to rely on one another for support as they endure the hardships of wartime and poverty. We witness the sisters growing up and figuring out what role each wants to play in the world, and, along the way, join them on countless unforgettable adventures.',2),
	('Beloved','Toni Morrison','8.84','2004/06/08','53','Beloved.jpg','Sethe, its protagonist, was born a slave and escaped to Ohio, but eighteen years later she is still not free. She has too many memories of Sweet Home, the beautiful farm where so many hideous things happened. And Sethe’s new home is haunted by the ghost of her baby, who died nameless and whose tombstone is engraved with a single word: Beloved. Filled with bitter poetry and suspense as taut as a rope, Beloved is a towering achievement.',2),
	('CIRCE','Madeline Miller','11.99','2015/03/16','21','CIRCE.jpg','In the house of Helios, god of the sun and mightiest of the Titans, a daughter is born. But Circe is a strange child -- not powerful, like her father, nor viciously alluring like her mother. Turning to the world of mortals for companionship, she discovers that she does possess power -- the power of witchcraft, which can transform rivals into monsters and menace the gods themselves.',4),
	('Ninth House','Leigh Bardugo','7.11','2019/08/08','178','Ninth House.jpg','Galaxy “Alex” Stern is the most unlikely member of Yale’s freshman class. Raised in the Los Angeles hinterlands by a hippie mom, Alex dropped out of school early and into a world of shady drug-dealer boyfriends, dead-end jobs, and much, much worse. In fact, by age twenty, she is the sole survivor of a horrific, unsolved multiple homicide. Some might say she’s thrown her life away. But at her hospital bed, Alex is offered a second chance: to attend one of the world’s most prestigious universities on a full ride. What’s the catch, and why her?',4),
	('The Walking Dead','Robert Kirkman','23.49','2009/05/19','524','The Walking Dead.jpg','Introducing the first eight volumes of the fan-favorite, New York Times Best Seller series collected into one massive paperback collection! Collects The Walking Dead #1-48. This is the perfect collection for any fan of the Emmy Award-winning television series on AMC: over one thousand pages chronicling the beginning of Robert Kirkman s Eisner Award-winning continuing story of survival horror- from Rick Grimes waking up alone in a hospital, to him and his family seeking solace on Hershel s farm, and the controversial introduction of Woodbury despot: The Governor. In a world ruled by the dead, we are finally forced to finally start living.',3);