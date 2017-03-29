-- Table: personalinfo.perf

-- DROP TABLE personalinfo.perf;

CREATE TABLE personalinfo.perf
(
  id_perf serial NOT NULL,
  id_serv integer NOT NULL,
  corr character varying(30),
  usua_cnta character varying(25),
  tele character varying(10),
  cntr character varying(30) NOT NULL,
  id_esta integer NOT NULL DEFAULT 1,
  fch_crea date NOT NULL DEFAULT ('now'::text)::date,
  fch_modi date,
  CONSTRAINT fk_1tyujmvs9rbjb3s9nu459lmps FOREIGN KEY (id_serv)
      REFERENCES personalinfo.cata (id_cata) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_dpehymfk4dknien7dfvis9rt3 FOREIGN KEY (id_esta)
      REFERENCES personalinfo.cata (id_cata) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE personalinfo.perf
  OWNER TO postgres;
-- Fin de la tabal
