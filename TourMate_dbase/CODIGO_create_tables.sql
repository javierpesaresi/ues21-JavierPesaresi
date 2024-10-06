
create table `persona` (
  `id_persona` int(8) not null primary key,
  `apellidos` varchar(80) not null,
  `nombres` varchar(80) not null);

create table `tipodoc` (
  `id_tipoDoc` int(1) not null,
  `tipoDoc` varchar(20) not null);

create table provincia (
    id_provincia int (8) not null primary key,
    provincia varchar (80) not null,
    idf_pais int (8) not null,
	foreign key (idf_pais) references pais (id_pais));

create table ciudad (
    id_ciudad int (8) not null primary key,
    ciudad varchar (8) not null,
    idf_provincia int (8) not null,
	codigoPostal varchar (12),
    foreign key (idf_provincia) references provincia (id_provincia));
	
create table domicilio (
    id_domicilio int (8) not null primary key,
    idf_ciudad int (8) not null,
    calle varchar (80) not null,
    numero varchar (8) not null,
    piso varchar (12),
    depto varchar (12),
    foreign key (idf_ciudad) references ciudad (id_ciudad));
	
create table datosPersona (
    id_datosPersona int (8) not null primary key,
    idf_tipoDoc int (1),
    numeroDoc varchar (12),
    idf_domicilio int (8),
    fechaNacimiento date,
    foreign key (idf_tipoDoc) references tipodoc (id_tipoDoc),
    foreign key (idf_domicilio) references domicilio (id_domicilio));

create table datosContacto (
    id_datosContacto int (8) not null primary key,
	idf_personas int (8) not null,
    telefono1 varchar (20),
    telefono2 varchar (20),
    email1 varchar (80),
    email2 varchar (80),
    linkFB varchar (255),
    linkIG varchar (255),
    linkLin varchar (255),
    linkweb varchar (255),
    foreign key (idf_personas) references persona (id_persona));
	
create table tipogestor (
    id_tipogestor int (8) not null primary key,
    tipogestor varchar (25));
	
create table calificacion (
    idf_calif int (8) not null primary key,
    calificacion varchar (12) not null);
	
create table gestor (
    id_gestor int (8) not null primary key,
    idf_persona int (8) not null,
    idf_tipoGestor int (8) not null,
	comision float (5),
    foreign key (idf_persona) references persona (id_persona),
    foreign key (idf_tipogestor) references tipogestor (id_tipogestor));
	
create table predioevento (
    id_predio int (8) not null primary key,
    id_domicilio int (8) not null,
    nombrePredio varchar (255));

create table categoriaevento (
    id_categoria int (8) not null primary key,
    categoria int (1) not null,
    descripcioncategoria varchar (80));
	
create table evento (
    id_evento int (8) not null primary key,
    idf_categoriaevento int (8) not null,
    idf_predioevento int (8) not null,
    idf_gestorevento int (8) not null,
    eventonombre varchar (120) not null,
    descripcionevento varchar (255),
    foreign key (idf_categoriaevento) references categoriaevento (id_categoria),
    foreign key (idf_predioevento) references predioevento (id_predio),
    foreign key (idf_gestorevento) references gestor (id_gestor));

create table tipoacuerdo (
    id_tipoacuerdo int (8) not null primary key,
    tipoacuerdo varchar (50) not null);	
	
create table puesto (
    id_puesto int (8) not null primary key,
    descripcionpuesto varchar (50) not null);
	
create table acuerdocolaborador (
    id_acuerdo int (8) not null primary key,
    idf_tipoacuerdo int (8) not null,
    idf_puesto int (8) not null,
    fechaAltaAcuerdo date not null,
    fechaBajaAcuerdo date,
    comisionvalor float,
    foreign key (idf_tipoacuerdo) references tipoacuerdo (id_tipoacuerdo),
    foreign key (idf_puesto) references puesto (id_puesto));
    
create table colaborador (
    id_colaborador int (8) not null primary key,
    idf_persona int (8) not null,
    idf_acuerdo int (8) not null,
    fechaalta date not null,
    fechabaja date,
    foreign key (idf_persona) references persona (id_persona),
    foreign key (idf_acuerdo) references acuerdocolaborador (id_acuerdo));

create table tipocontrato (
    id_tipocontrato int (8) not null primary key,
    tipocontrato varchar (50) not null);
	
create table origen (
    id_origen int (8) not null primary key,
    origen varchar (50) not null);
	
create table moneda (
    id_moneda int (8) not null primary key,
    monedanombre varchar (50) not null,
    monedasimbolo varchar (6) not null);
	
create table tiposhow (
    id_tiposhow int (8) not null primary key,
    tiposhow varchar (50) not null,
    duracion int (3) not null);
	
create table 
tipopago (
    id_tipo int (8) not null primary key,
    tipopago varchar (20) not null);
	
create table estadopago (
    id_estadopago int (8) not null primary key,
    estadopago varchar (20) not null);
	
create table aqueaplica (
    id_aqueaplica int (8) not null primary key,
    aqueaplica varchar (20) not null);
	
create table pago (
    id_pago int (8) not null primary key,
    idf_tipopago int (8) not null,
    idf_estadopago int (8) not null,
    idf_aqueaplica int (8) not null,
    monto float (12) not null,
    fechapago date not null,
    foreign key (idf_tipopago) references tipopago (id_tipo),
    foreign key (idf_estadopago) references estadopago (id_estadopago),
    foreign key (idf_aqueaplica) references aqueaplica (id_aqueaplica));
	
 create table cotizacion (
    id_cotizacion int (8) not null primary key,
    idf_evento int (8) not null,
    idf_tipocontrato int (8) not null,
    idf_origen int (8) not null,
    idf_monedatipo int (8) not null,
    idf_tiposhow int (8) not null,
    idf_pagos int (8) not null,
    fechaevento date not null,
    monedacotizacion float (12) not null,
    montocachet  float (12) not null,
    foreign key (idf_evento) references evento (id_evento),
    foreign key (idf_tipocontrato) references tipocontrato (id_tipocontrato),
    foreign key (idf_origen) references origen (id_origen),
    foreign key (idf_monedatipo) references moneda (id_moneda),
    foreign key (idf_tiposhow) references tiposhow (id_tiposhow),
    foreign key (idf_pagos) references pago (id_pago));
	
create table estadotramite (
    id_estado int (8) not null primary key,
    estado varchar (8) not null);
	
create table bajamotivo (
    id_motivobaja int (8) not null primary key,
    motivobaja varchar (20) not null);
	
 create table cotizseguimiento (
    id_movimiento int (8) not null primary key,
    idf_cotizacion int (8) not null,
    idf_estadotramite int (8) not null,
    idf_motivobaja int (8) not null,
    idf_colaboradoractual int (8) not null,
    idf_colaboradorproximo int (8) not null,
    fechanovedad date not null,
    fechaproxgestion date,
    detallenovedad varchar (255),
    foreign key (idf_cotizacion) references cotizacion (id_cotizacion),
    foreign key (idf_estadotramite) references estadotramite (id_estado),
    foreign key (idf_motivobaja) references bajamotivo (id_motivobaja),
    foreign key (idf_colaboradoractual) references colaborador (id_colaborador),
    foreign key (idf_colaboradorproximo) references colaborador (id_colaborador));
	
create table precontrato (
    id_precontrato int (8) not null primary key,
    idf_cotizacion int (8) not null,
    firmante1nombres varchar (80) not null,
    firmante1apellidos varchar (80) not null,
    firmante1tipodoc varchar (15) not null,
    firmante1nrodoc varchar (15) not null,
    firmante2nombres varchar (80),
    firmante2apellidos varchar (80),
    firmante2tipodoc varchar (15),
    firmante2nrodoc varchar (15),
    contratanterazonsoc varchar (80) not null,
    contratanteidtributario varchar (15) not null,
    contratantecondicioniva varchar (50) not null,
    contratantedomicilio_calle varchar (80) not null,
    contratantedomicilio_numero varchar (80) not null,
    contratantedomicilio_piso varchar (80) not null,
    contratantedomicilio_depto varchar (80) not null,
    contratantedomicilio_localidad varchar (80) not null,
    contratantedomicilio_cpostal varchar (80) not null,
    contratantedomicilio_ciudad varchar (80) not null,
    contratantedomicilio_provincia varchar (80) not null,
    contratantedomicilio_pais varchar (80) not null,
    predioshow_nombre varchar (120) not null,
    predioshow_domicilio varchar (255) not null,
    foreign key (idf_cotizacion) references cotizacion (id_cotizacion));
	
create table estadogestion (
    id_estadogestion int (8) not null primary key,
    estadogestion varchar (20) not null);
	
create table contratomodelo (
    id_modelo int (8) not null primary key,
    modelocontrato varchar (50) not null);
	
create table contrato (
    id_contrato int (8) not null primary key,
    idf_cotizacion int (8) not null,
    idf_precontrato int (8) not null,
    idf_firmantecontrato int (8) not null,
    idf_contratomodelo int (8) not null,
    idf_estadogestion int (8) not null,
    fechagestion date,
    foreign key (idf_cotizacion) references cotizacion (id_cotizacion),
    foreign key (idf_precontrato) references precontrato (id_precontrato),
    foreign key (idf_firmantecontrato) references colaborador (id_colaborador),
    foreign key (idf_contratomodelo) references contratomodelo (id_modelo),
    foreign key (idf_estadogestion) references estadogestion (id_estadogestion));
	
	
	
	insert into persona (apellidos, nombres) values ("Perez", "Juan");
	
	insert into tipodoc (tipodoc) values("DNI");
