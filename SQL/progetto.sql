drop database progetto;
create database progetto;
use progetto;

create table 	Cliente(
						Nome	varchar(20)	not null,
						Cognome	varchar(20)	not null,
                        IDCliente	varchar(4)	primary key not null,
                        Via			varchar(20)	not null,
                        NCivico		varchar(3)	not null,
                        CAP			varchar(5)	not null
                        );
create table	Telefono(
						Numero	varchar(10)	not null
                        );
                        
create table	Gioco(
						CodiceProdotto	varchar(4)	primary key	not null,
                        Titolo			varchar(40) not null,
                        Prezzo			dec(10,2)	not null,
                        AnnoPubblicazione	varchar(4) not null,
                        PEGI				varchar(2)	not null,
                        Condizioni			varchar(5)	not null
					);
create table	Acquista(
						Giorno				date	primary key,
                        CodiceProdotto		varchar(4) not null,
                        IDCliente			varchar(4) not null,
						NumeroCopie			varchar(2) not null,
                        primary key(CodiceProdotto, IDCliente),
						foreign key(CodiceProdotto)	references	Gioco(CodiceProdotto),
                        foreign key(IDCliente)		references	Cliente(IDCliente)
                        );
create table	Vende(
						CodiceProdotto	varchar(4) not null,
                        IDCliente		varchar(4) not null,
						primary key(CodiceProdotto,IDCliente),
						foreign key(CodiceProdotto)	references	Gioco(CodiceProdotto),
                        foreign key(IDCliente)		references	Cliente(IDCliente)
					);
create table	Piattaforma(
						CodiceCatalogo	varchar(4) primary key not null,
                        Tipo			varchar(4) not null,
                        Requisiti		varchar(20),
                        Modello			varchar(3)
							);
create table	Riproduzione(
						CodiceCatalogo	varchar(4)  not null,
                        CodiceProdotto	varchar(4)	not null,
                        primary key(CodiceCatalogo,CodiceProdotto),
						foreign key(CodiceProdotto)	references	Gioco(CodiceProdotto),
						foreign key(CodiceCatalogo)	references	Piattaforma(CodiceCatalogo)
                        );
create table	CasaDiSviluppo	(
							IDCasaDiSviluppo	varchar(4)	primary key not null,
                            Nome				varchar(20)	not null
								);
create table	Pubblicazione(
							IDCasaDiSviluppo	varchar(4) 	not null,
                            CodiceProdotto		varchar(4),
                            primary key(IDCasaDiSviluppo, CodiceProdotto),
                            foreign key(IDCasaDiSviluppo) references CasaDiSviluppo(IDCasaDiSviluppo),
                            foreign key(CodiceProdotto) references	Gioco(CodiceProdotto)
                            );

insert into Cliente values	('Gianfranco','Coppo','0208','Patturelli','81','80100'),
							('Gianluca','Zuna','0273','Cappuccini','02','81100'),
							('Beatrice','Rossi','4637','Clanio','48','81100'),
                            ('Mario','Bianchi','2914','Acquaviva','07','81100'),
                            ('Antonella','Verdi','0321','Roma','15','80100'),
                            ('Corrado','Bianchi','5213','Mazzini','22','81100');
                            
insert into Telefono values ('3332714029'),
							('3881207317'),
                            ('3472910400'),
                            ('3922869445'),
                            ('3393116692'),
                            ('3387796899');
                            
insert into DocumentoFiscale values	('5934','','65.00','G05'),
									('9381','','120.50','G01'),
                                    ('7323','','30.00','G01'),
                                    ('9322','2020-11-28','90.00','G05'),
                                    ('0237','2021-01-07','20.50','G02'),
                                    ('9137','2021-02-15','15.00','G01');

insert into Gioco values('2724','Final Fantasy 7 Remake','39,90','2020','16','Nuovo'),
						('3429','AC Valhallah','30,00','2020','18','Usato'),
                        ('0573','Fifa 21','25,00','2020','3','Nuovo'),
                        ('6205','infamous: second son','15,00','2014','16','Usato'),
                        ('9071','Spider-man','35,00','2018','16','Nuovo'),
                        ('0318','Metal Gear Solid 5: The Phantom Pain','19,90','2015','18','Nuovo'),
                        ('6492','The witcher 3: wild hunt','19,90','2015','18','Nuovo'),
                        ('5840','Sekiro Shadows Die Twice','39,90','2019','18','Nuovo'),
                        ('5347','Skyrim Special Edition','9,90','2017','18','Usato'),
                        ('3124','Persona 5 Royal','44,90','2020','16','Nuovo');

insert into Piattaforma values	('3429','XBOX',NULL,'ONE'),
								('0573','PC','Medio-Alta',NULL),
                                ('0318','PS',NULL,'3'),
                                ('2724','PS',NULL,'4'),
                                ('5840','PC','Alta',NULL),
                                ('3124','PC','Alta',NULL),
                                ('6205','PS',NULL,'4'),
                                ('6492','XBOX',NULL,'ONE'),
                                ('9071','PS',NULL,'4'),
                                ('5347','XBOX',NULL,'360');

insert into CasaDiSviluppo values	('3429','Ubisoft'),
									('0573','EA'),
                                    ('0318','Konami'),
                                    ('2724','Square Enix'),
                                    ('5840','From Software'),
                                    ('3124','Atlus'),
                                    ('6205','Sucker Punch'),
                                    ('6492','Cd Project Red'),
                                    ('9071','Insomniac'),
                                    ('5347','Bethesda'),
                                    ('9673','Activision');
							
insert into Acquista values	('2020-12-14','9071','4637','5934','1'),
							('2020-12-23','0573','5213','9381','1'),
							('2020-12-23','6492','5213','9381','2'),
							('2020-11-06','2724','2914','7323','1'),
							('2020-11-06','3429','2914','7323','1'),
							('2020-11-06','0573','2914','7323','1'),
							('2020-11-28','6205','2914','7323','1'),
							('2020-11-28','9071','2914','7323','2'),
							('2020-11-28','0318','2914','7323','1'),
							('2020-11-28','6492','2914','7323','1'),
							('2021-01-07','5840','2914','7323','1'),
							('2021-01-07','5347','2914','7323','1'),
							('2021-01-07','3124','2914','7323','1'),
							('2021-01-07','6205','0321','9322','1'),
							('2021-02-15','2724','0273','9137','1'),
							('2021-02-15','6205','0273','9137','1'),
							('2020-11-26','0318','0273','9137','1'),
							('2020-08-13','3429','0208','0237','2'),
                            ('2021-01-14','2724','0273','9137','1');
                        
insert into Vende values	('3429','2914'),
							('6205','2914'),
                            ('5347','0273'),
                            ('6205','5213'),
                            ('5347','4637'),
                            ('5347','5213');
                            
insert into Riproduzione values	('2724','2724'),
								('3429','3429'),
								('0573','0573'),
								('0318','0318'),
								('9071','9071'),
								('6205','6205'),
								('6492','6492'),
								('5840','5840'),
								('5347','5347'),
								('3124','3124');

insert into Pubblicazione values	('2724','2724'),
									('3429','3429'),
									('0573','0573'),
									('0318','0318'),
									('9071','9071'),
									('6205','6205'),
									('6492','6492'),
									('5840','5840'),
									('5347','5347'),
									('3124','3124');
									
                                    
#1 Una selezione ordinata su un attributo di una tabella con condizioni in And e OR;
	
    #Elencare tutti i giochi nelle piattaforme di PS4 e XBOX ONE
    Select	*
    From Piattaforma
    Where	(Tipo='Xbox' AND Modello='ONE') OR (Tipo='PS' AND Modello='4');
    
#2 Una selezione su due o più tabelle con condizioni;

#Elencare tutti i giochi con PEGI 18
	
		Select *
        From Gioco
        Where Pegi=18;
	
#3 Una selezione aggregata su tutti i valori 
	
    #Elencare tutti i giochi in condizioni usate
    
    Select count(*) as ProdottiUsati 
    From Gioco
    Where Condizioni='Usato';
    
#4 Una selezione aggregata su raggruppamenti 
	
    #Elencare una somma totale di importi per sede
    
	Select sede, sum(Importo) as SommaImportoPerSede
    From DocumentoFiscale
    Group by Sede;
	
#5 Una selezione aggregata su raggruppamenti con condizioni

	#Elencare una somma dei ricavi maggiori di 100 per sede
	
    Select sede, sum(Importo) as SommaRicavi
    From DocumentoFiscale
    Group by sede
    Having SommaRicavi>100;
    
#6 Una selezione aggregata su raggruppamenti con condizioni che includano un’altra funzione di raggruppamento (es. dipartimenti la cui somma degli stipendi è la più alta)
	
   #Elencare la sede che ha ricevuto il ricavo totale maggiore delle altre sedi
   
    create view RicavoMax(SedeNegozi,RicavoTotale) as 
    Select sede, sum(Importo) as RicavoTotale
    from DocumentoFiscale
    Group by sede;
    
    Select SedeNegozi,RicavoTotale
    From RicavoMax
    Where RicavoTotale=(Select max(RicavoTotale)
						From RicavoMax);
    
#7 Una selezione con operazioni sugli insiemi

	#Elencare le case di sviluppo che non hanno pubblicato giochi

	Select nome,IDCasaDiSviluppo
	From CasaDiSviluppo
	Where IDCasaDiSviluppo not in(	Select CodiceProdotto
									From Gioco);
    
#8 Uso dell’operatore quoziente.

	#Elencare tutti i clienti che hanno acquistato tutti i giochi
    
	Select *
    From Cliente c
    Where not exists(	Select *
						From Gioco g
                        Where not exists(	Select *
											From Acquista a
                                            Where c.IDCliente=a.IDCliente AND g.CodiceProdotto=a.CodiceProdotto));