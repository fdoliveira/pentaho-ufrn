DROP TABLE ufrn.dm_tempo;

CREATE TABLE ufrn.dm_tempo (
  TempoID		INT NOT NULL,
  DataTempo 	DATE   	NOT NULL,
  AnoTempo 		INT 	NOT NULL,
  MesTempo 		INT 	NOT NULL,
  CONSTRAINT dm_tempo_pk PRIMARY KEY (TempoId)
);

DROP TABLE ufrn.dm_tipo;

CREATE TABLE ufrn.dm_tipo (
  TipoID	INT             NOT NULL AUTO_INCREMENT,
  Fonte 	VARCHAR(100)   	NOT NULL,
  Resumo 	VARCHAR(100) 	NOT NULL,
  CONSTRAINT dm_tipo_pk PRIMARY KEY (TipoId)
);

DROP TABLE ufrn.ft_empregos;

CREATE TABLE ufrn.ft_empregos (
  EmpregoID 	INT  NOT NULL AUTO_INCREMENT,
  TempoID   	INT  NOT NULL,
  TipoID		INT  NOT NULL,
  Quantidade	INT  NOT NULL,
  CONSTRAINT ft_empregos_pk PRIMARY KEY(EmpregoID),
  CONSTRAINT ft_empregos_tempo_fk FOREIGN KEY(TempoID) REFERENCES ufrn.dm_tempo(TempoID),
  CONSTRAINT ft_empregos_tipo_fk  FOREIGN KEY(TipoID) REFERENCES ufrn.dm_tipo(TipoID)
);