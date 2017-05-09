CREATE TABLE data.cata
(
  id_cata serial NOT NULL,
  codi character varying(9) NOT NULL,
  nomb character varying(30) NOT NULL,
  valo character varying(80),
  id_esta integer NOT NULL DEFAULT 1,
  fch_crea timestamp without time zone NOT NULL DEFAULT ('now'::text)::date,
  fch_modi timestamp without time zone,
  CONSTRAINT cata_id_cata_pk PRIMARY KEY (id_cata)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE data.cata
  OWNER TO postgres;

COMMENT ON TABLE data.arch  IS 'Tabla de catálogo maestro';
COMMENT ON COLUMN data.cata.id_cata IS '[PK] Identificador de la tabla';
COMMENT ON COLUMN data.cata.codi IS 'Código';
COMMENT ON COLUMN data.cata.nomb IS 'Nombre';
COMMENT ON COLUMN data.cata.valo IS 'Valor';
COMMENT ON COLUMN data.cata.id_esta IS 'Estatus';
COMMENT ON COLUMN data.cata.fch_crea IS 'Fecha de creación';
COMMENT ON COLUMN data.cata.fch_modi IS 'Fecha de modificación';



CREATE TABLE data.arch
(
  id_arch serial NOT NULL,
  nomb character varying(100),
  desc_arch character varying(255),
  tama double precision,
  vers character varying(10),
  arch_byte bytea,
  id_tipo integer,
  id_esta integer,
  fch_crea timestamp without time zone,
  fch_modi timestamp without time zone,
  CONSTRAINT arch_id_arch_pk PRIMARY KEY (id_arch),
  CONSTRAINT arch_id_esta_fk FOREIGN KEY (id_esta)
      REFERENCES data.cata (id_cata) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT arch_id_tipo_fk FOREIGN KEY (id_tipo)
      REFERENCES data.cata (id_cata) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE data.arch
  OWNER TO postgres;
COMMENT ON TABLE data.arch  IS 'Tabla de archivos';
COMMENT ON COLUMN data.arch.id_arch IS '[PK] Identificador de la tabla';
COMMENT ON COLUMN data.arch.nomb IS 'Nombre';
COMMENT ON COLUMN data.arch.desc_arch IS 'Descripción';
COMMENT ON COLUMN data.arch.tama IS 'Tamaño';
COMMENT ON COLUMN data.arch.vers IS 'Versión';
COMMENT ON COLUMN data.arch.arch_byte IS 'Archivo en bytes';
COMMENT ON COLUMN data.arch.id_tipo IS '[FK] Tipo de archivo';
COMMENT ON COLUMN data.arch.id_esta IS '[FK] Estatus';
COMMENT ON COLUMN data.arch.fch_crea IS 'Fecha de creación';
COMMENT ON COLUMN data.arch.fch_modi IS 'Fecha de modificación';


CREATE TABLE data.perf
(
  id_perf serial NOT NULL,
  id_serv integer NOT NULL,
  corr character varying(30),
  usua character varying(25),
  tele character varying(10),
  cntr character varying(30) NOT NULL,
  id_esta integer NOT NULL DEFAULT 1,
  fch_crea date NOT NULL DEFAULT ('now'::text)::date,
  fch_modi date,
  CONSTRAINT perf_id_perf_pk PRIMARY KEY (id_perf),
  CONSTRAINT perf_id_serv_fk FOREIGN KEY (id_serv)
      REFERENCES data.cata (id_cata) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT perf_id_esta_fk FOREIGN KEY (id_esta)
      REFERENCES data.cata (id_cata) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE data.perf
  OWNER TO postgres;

COMMENT ON TABLE data.perf  IS 'Tabla de <perfiles></perfiles>';
COMMENT ON COLUMN data.perf.id_perf IS '[PK] Identificador de la tabla';
COMMENT ON COLUMN data.perf.id_serv IS '[FK] Servicio';
COMMENT ON COLUMN data.perf.corr IS 'Correo';
COMMENT ON COLUMN data.perf.usua IS 'Usuario';
COMMENT ON COLUMN data.perf.tele IS 'Teléfono';
COMMENT ON COLUMN data.perf.cntr IS 'Contraseña';
COMMENT ON COLUMN data.perf.id_esta IS '[FK] Estatus';
COMMENT ON COLUMN data.perf.fch_crea IS 'Fecha de creación';
COMMENT ON COLUMN data.perf.fch_crea IS 'Fecha de modificación';
