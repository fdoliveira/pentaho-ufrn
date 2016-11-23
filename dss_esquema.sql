DROP TABLE dm_tempo;
DROP TABLE dm_geo;
DROP TABLE dm_produto;
DROP TABLE ft_nfe;
DROP SEQUENCE ft_nfe_id;

TRUNCATE TABLE dm_produto;

CREATE TABLE pentaho.dm_tempo (
  TempoID						      NUMERIC(11) 	NOT NULL,
  DataTempo 					    DATE   	    NOT NULL,
  AnoTempo 					      NUMERIC(4) 	NOT NULL,
  MesTempo 					      NUMERIC(2) 	NOT NULL,
  DiaAnoTempo 				    NUMERIC(3) 	NOT NULL,
  DiaMesTempo				      NUMERIC(2) 	NOT NULL,
  DiaSemanaTempo 			    NUMERIC(1) 	NOT NULL,
  SemanaAnoTempo 			    NUMERIC(2)   NOT NULL,
  DiaSemanaDescTempo 		  VARCHAR(15) NOT NULL,
  DiaSemanaDescAbrvTempo	CHAR(3) 		NOT NULL,
  MesDescTempo 				    VARCHAR(10) NOT NULL,
  MesDescAbrvTempo		    CHAR(3) 		NOT NULL,
  TrimestreTempo			    CHAR(1) 		NOT NULL,
  CONSTRAINT dm_tempo_pk PRIMARY KEY (TempoId)
);

CREATE TABLE ufrn.dm_tipo (
  TipoID	INT             NOT NULL AUTO_INCREMENT,
  Fonte 	VARCHAR(100)   	NOT NULL,
  Resumo 	VARCHAR(100) 	NOT NULL,
  CONSTRAINT dm_tipo_pk PRIMARY KEY (TipoId)
);

CREATE TABLE dm_geo (
  GeoID				      NUMBER(11)	NOT NULL,
  CodMunicipioGeo   NUMBER(7)		NOT NULL,
  NomeMunicipioGeo	VARCHAR(60) NOT NULL,
  CodMicroGeo   	  NUMBER(5)		NOT NULL,
  NomeMicroGeo  	  VARCHAR(60) NOT NULL,
  CodMesoGeo    	  NUMBER(4)   NOT NULL,
  NomeMesoGeo   	  VARCHAR(60) NOT NULL,
  CodUFGeo			    NUMBER(2)		NOT NULL,				
  SiglaUFGeo			  CHAR(2)		  NOT NULL,				
  NomeUFGeo			    VARCHAR(20) NOT NULL,
  CodRegiaoGeo		  NUMBER(1) 	NOT NULL,
  RegiaoGeo			    VARCHAR(15) NOT NULL,
  CONSTRAINT dm_geo_pk PRIMARY KEY (GeoId)
);

CREATE TABLE dm_produto (
  ProdutoID			    NUMBER(11)	 NOT NULL,
  CodigoProduto  	  VARCHAR(60)	 NOT NULL,
  DescricaoProduto  VARCHAR(120) NOT NULL,
  NCMProduto			  CHAR(8)			 NOT NULL,
  UnProduto			    VARCHAR(6)	 NOT NULL,
  UnTribProduto		  VARCHAR(6)	 NOT NULL,
  EANProduto			  VARCHAR(20),
  EANTribProduto	  VARCHAR(20),
  CONSTRAINT dm_produto_pk PRIMARY KEY (ProdutoId)
);

CREATE TABLE ft_nfe (
  NFeID					      NUMBER(11) 	 NOT NULL,
  DataEmissaoTempoID	NUMBER(11) 	 NOT NULL,
  EmitenteGeoID			  NUMBER(11) 	 NOT NULL,
  DestinarioGeoID		  NUMBER(11) 	 NOT NULL,
  ProdutoID				    NUMBER(11) 	 NOT NULL,
  NumeroNFe				    NUMBER(9)  	 NOT NULL,
  NaturezaOperacao		VARCHAR(60)  NOT NULL,
  IndicadorFormaPagto	VARCHAR(7)   NOT NULL,
  Modelo				      CHAR(2)			 NOT NULL,
  Serie					      NUMBER(3)		 NOT NULL,
  TipoNFe             VARCHAR(10)  NOT NULL,
  Origem					    VARCHAR(30)  NOT NULL,
  CST						      CHAR(2)      NOT NULL,
  CFOP						    NUMBER(4)		 NOT NULL,
  QuantidadeCom			  NUMBER(15,4) NOT NULL,
  ValorUnitarioCom		NUMBER(15,2) NOT NULL,
  ValorTotal				  NUMBER(15,2) NOT NULL,
  QuantidadeTrib		  NUMBER(15,4) NOT NULL,
  ValorUnitarioTrib	  NUMBER(15,2) NOT NULL,
  ValorTotalFrete		  NUMBER(15,2) NOT NULL,
  ValorTotalSeguro		NUMBER(15,2) NOT NULL,
  ValorTotalDesconto	NUMBER(15,2) NOT NULL,
  ValorOutrasDespesas	NUMBER(15,2) NOT NULL,
  IndicadorTotal		  NUMBER(1)		 NOT NULL,
  CONSTRAINT ft_nfe_pk PRIMARY KEY (NFeID),
  CONSTRAINT ft_nfe_dm_tempo_fk   FOREIGN KEY(dataemissaotempoid) REFERENCES dm_tempo(tempoid),
  CONSTRAINT ft_nfe_dm_geo_emi_fk FOREIGN KEY(emitentegeoid)      REFERENCES dm_geo(geoid),
  CONSTRAINT ft_nfe_dm_geo_des_fk FOREIGN KEY(DestinarioGeoID)    REFERENCES dm_geo(geoid),
  CONSTRAINT ft_nfe_dm_produto_fk FOREIGN KEY(produtoid)          REFERENCES dm_produto(produtoid)
);

CREATE SEQUENCE ft_nfe_id START WITH 602904;