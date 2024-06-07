PGDMP      ,                |            db_locadora_carros_heitor    16.2    16.2 �    W           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            X           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Z           1262    19231    db_locadora_carros_heitor    DATABASE     �   CREATE DATABASE db_locadora_carros_heitor WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
 )   DROP DATABASE db_locadora_carros_heitor;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            [           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4                        1259    19605    administradores    TABLE     �   CREATE TABLE public.administradores (
    pk_id_administradores integer NOT NULL,
    cpf_administradores character varying(14) NOT NULL,
    fk_nivel_acesso integer NOT NULL,
    senha_administradores character varying(30)
);
 #   DROP TABLE public.administradores;
       public         heap    postgres    false    4            �            1259    19604 #   administradores_fk_nivel_acesso_seq    SEQUENCE     �   CREATE SEQUENCE public.administradores_fk_nivel_acesso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.administradores_fk_nivel_acesso_seq;
       public          postgres    false    4    256            \           0    0 #   administradores_fk_nivel_acesso_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.administradores_fk_nivel_acesso_seq OWNED BY public.administradores.fk_nivel_acesso;
          public          postgres    false    255            �            1259    19603 )   administradores_pk_id_administradores_seq    SEQUENCE     �   CREATE SEQUENCE public.administradores_pk_id_administradores_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.administradores_pk_id_administradores_seq;
       public          postgres    false    4    256            ]           0    0 )   administradores_pk_id_administradores_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.administradores_pk_id_administradores_seq OWNED BY public.administradores.pk_id_administradores;
          public          postgres    false    254            �            1259    19286    agencias    TABLE     j  CREATE TABLE public.agencias (
    pk_num_agencias integer NOT NULL,
    contato_agencias character varying(30) NOT NULL,
    endereco_agencias character varying(255) NOT NULL,
    cidade_agencias character varying(255) NOT NULL,
    uf_agencias character varying(2) NOT NULL,
    fk_id_funcionarios integer NOT NULL,
    fk_placa_carros character varying(8)
);
    DROP TABLE public.agencias;
       public         heap    postgres    false    4            �            1259    19285    agencias_fk_id_funcionarios_seq    SEQUENCE     �   CREATE SEQUENCE public.agencias_fk_id_funcionarios_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.agencias_fk_id_funcionarios_seq;
       public          postgres    false    4    227            ^           0    0    agencias_fk_id_funcionarios_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.agencias_fk_id_funcionarios_seq OWNED BY public.agencias.fk_id_funcionarios;
          public          postgres    false    226            �            1259    19284    agencias_pk_num_agencias_seq    SEQUENCE     �   CREATE SEQUENCE public.agencias_pk_num_agencias_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.agencias_pk_num_agencias_seq;
       public          postgres    false    227    4            _           0    0    agencias_pk_num_agencias_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.agencias_pk_num_agencias_seq OWNED BY public.agencias.pk_num_agencias;
          public          postgres    false    225            �            1259    19317    aluga    TABLE     N  CREATE TABLE public.aluga (
    pk_id_locacao_aluga integer NOT NULL,
    valor_total_aluga money NOT NULL,
    data_entrega_aluga date NOT NULL,
    data_retirada_aluga date NOT NULL,
    fk_id_clientes_pf integer NOT NULL,
    fk_placa_carros character varying(8) NOT NULL,
    fk_cnpj_clientes_pj character varying(18) NOT NULL
);
    DROP TABLE public.aluga;
       public         heap    postgres    false    4            �            1259    19316    aluga_fk_id_clientes_pf_seq    SEQUENCE     �   CREATE SEQUENCE public.aluga_fk_id_clientes_pf_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.aluga_fk_id_clientes_pf_seq;
       public          postgres    false    236    4            `           0    0    aluga_fk_id_clientes_pf_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.aluga_fk_id_clientes_pf_seq OWNED BY public.aluga.fk_id_clientes_pf;
          public          postgres    false    235            �            1259    19315    aluga_pk_id_locacao_aluga_seq    SEQUENCE     �   CREATE SEQUENCE public.aluga_pk_id_locacao_aluga_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.aluga_pk_id_locacao_aluga_seq;
       public          postgres    false    4    236            a           0    0    aluga_pk_id_locacao_aluga_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.aluga_pk_id_locacao_aluga_seq OWNED BY public.aluga.pk_id_locacao_aluga;
          public          postgres    false    234            �            1259    19297    cargos    TABLE     �   CREATE TABLE public.cargos (
    pk_cod_cargos integer NOT NULL,
    nome_cargos character varying(100),
    salario_cargos money NOT NULL,
    fk_id_funcionarios integer NOT NULL
);
    DROP TABLE public.cargos;
       public         heap    postgres    false    4            �            1259    19296    cargos_fk_id_funcionarios_seq    SEQUENCE     �   CREATE SEQUENCE public.cargos_fk_id_funcionarios_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.cargos_fk_id_funcionarios_seq;
       public          postgres    false    4    230            b           0    0    cargos_fk_id_funcionarios_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.cargos_fk_id_funcionarios_seq OWNED BY public.cargos.fk_id_funcionarios;
          public          postgres    false    229            �            1259    19295    cargos_pk_cod_cargos_seq    SEQUENCE     �   CREATE SEQUENCE public.cargos_pk_cod_cargos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.cargos_pk_cod_cargos_seq;
       public          postgres    false    4    230            c           0    0    cargos_pk_cod_cargos_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.cargos_pk_cod_cargos_seq OWNED BY public.cargos.pk_cod_cargos;
          public          postgres    false    228            �            1259    19256    carros    TABLE     ^  CREATE TABLE public.carros (
    pk_placa_carros character varying(8) NOT NULL,
    disponibilidade_carros character varying(50) NOT NULL,
    ano_carros date NOT NULL,
    modelo_carros character varying(100) NOT NULL,
    marca_carros character varying(100) NOT NULL,
    fk_id_categorias integer NOT NULL,
    img_carros character varying(255)
);
    DROP TABLE public.carros;
       public         heap    postgres    false    4                       1259    20009    carros_fk_id_categorias_seq    SEQUENCE     �   CREATE SEQUENCE public.carros_fk_id_categorias_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.carros_fk_id_categorias_seq;
       public          postgres    false    218    4            d           0    0    carros_fk_id_categorias_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.carros_fk_id_categorias_seq OWNED BY public.carros.fk_id_categorias;
          public          postgres    false    259                       1259    20003    categorias_carros    TABLE     �   CREATE TABLE public.categorias_carros (
    pk_id_categorias integer NOT NULL,
    nome_categorias character varying(255) NOT NULL,
    valor_diario money
);
 %   DROP TABLE public.categorias_carros;
       public         heap    postgres    false    4                       1259    20002 &   categorias_carros_pk_id_categorias_seq    SEQUENCE     �   CREATE SEQUENCE public.categorias_carros_pk_id_categorias_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.categorias_carros_pk_id_categorias_seq;
       public          postgres    false    258    4            e           0    0 &   categorias_carros_pk_id_categorias_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.categorias_carros_pk_id_categorias_seq OWNED BY public.categorias_carros.pk_id_categorias;
          public          postgres    false    257            �            1259    19248    clientes_pf    TABLE     2  CREATE TABLE public.clientes_pf (
    pk_id_clientes_pf integer NOT NULL,
    nome_clientes_pf character varying(255) NOT NULL,
    sobrenome_clientes_pf character varying(255) NOT NULL,
    email_clientes_pf character varying(100) NOT NULL,
    celular_clientes_pf character varying(20) NOT NULL,
    endereco_clientes_pf character varying(255) NOT NULL,
    cidade_clientes_pf character varying(255) NOT NULL,
    estado_clientes_pf character varying(255) NOT NULL,
    senha_cliente_pf character varying(255) NOT NULL,
    fk_nivel_acesso integer NOT NULL
);
    DROP TABLE public.clientes_pf;
       public         heap    postgres    false    4            �            1259    19578    clientes_pf_fk_nivel_acesso_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_pf_fk_nivel_acesso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.clientes_pf_fk_nivel_acesso_seq;
       public          postgres    false    4    217            f           0    0    clientes_pf_fk_nivel_acesso_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.clientes_pf_fk_nivel_acesso_seq OWNED BY public.clientes_pf.fk_nivel_acesso;
          public          postgres    false    251            �            1259    19247 !   clientes_pf_pk_id_clientes_pf_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_pf_pk_id_clientes_pf_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.clientes_pf_pk_id_clientes_pf_seq;
       public          postgres    false    4    217            g           0    0 !   clientes_pf_pk_id_clientes_pf_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.clientes_pf_pk_id_clientes_pf_seq OWNED BY public.clientes_pf.pk_id_clientes_pf;
          public          postgres    false    216            �            1259    19240    clientes_pj    TABLE     l  CREATE TABLE public.clientes_pj (
    pk_cnpj_clientes_pj character varying(18) NOT NULL,
    telefone_clientes_pj character varying(20) NOT NULL,
    cep_clientes_pj character varying(10) NOT NULL,
    nome_clientes_pj character varying(255) NOT NULL,
    email_clientes_pj character varying(255) NOT NULL,
    senha_cliente_pj character varying(255) NOT NULL
);
    DROP TABLE public.clientes_pj;
       public         heap    postgres    false    4            �            1259    19561 
   devolucoes    TABLE     (  CREATE TABLE public.devolucoes (
    pk_id_devolucoes integer NOT NULL,
    data_devolucoes date NOT NULL,
    condicao_veiculo_devolucoes character varying(255),
    custos_adicionais_devolucoes money,
    fk_placa_carros character varying(8) NOT NULL,
    fk_id_clientes_pf integer NOT NULL
);
    DROP TABLE public.devolucoes;
       public         heap    postgres    false    4            �            1259    19560     devolucoes_fk_id_clientes_pf_seq    SEQUENCE     �   CREATE SEQUENCE public.devolucoes_fk_id_clientes_pf_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.devolucoes_fk_id_clientes_pf_seq;
       public          postgres    false    4    250            h           0    0     devolucoes_fk_id_clientes_pf_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.devolucoes_fk_id_clientes_pf_seq OWNED BY public.devolucoes.fk_id_clientes_pf;
          public          postgres    false    249            �            1259    19559    devolucoes_pk_id_devolucoes_seq    SEQUENCE     �   CREATE SEQUENCE public.devolucoes_pk_id_devolucoes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.devolucoes_pk_id_devolucoes_seq;
       public          postgres    false    4    250            i           0    0    devolucoes_pk_id_devolucoes_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.devolucoes_pk_id_devolucoes_seq OWNED BY public.devolucoes.pk_id_devolucoes;
          public          postgres    false    248            �            1259    19356    envia    TABLE     l   CREATE TABLE public.envia (
    fk_id_feedbacks integer NOT NULL,
    fk_id_clientes_pf integer NOT NULL
);
    DROP TABLE public.envia;
       public         heap    postgres    false    4            �            1259    19355    envia_fk_id_clientes_pf_seq    SEQUENCE     �   CREATE SEQUENCE public.envia_fk_id_clientes_pf_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.envia_fk_id_clientes_pf_seq;
       public          postgres    false    4    241            j           0    0    envia_fk_id_clientes_pf_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.envia_fk_id_clientes_pf_seq OWNED BY public.envia.fk_id_clientes_pf;
          public          postgres    false    240            �            1259    19354    envia_fk_id_feedbacks_seq    SEQUENCE     �   CREATE SEQUENCE public.envia_fk_id_feedbacks_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.envia_fk_id_feedbacks_seq;
       public          postgres    false    241    4            k           0    0    envia_fk_id_feedbacks_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.envia_fk_id_feedbacks_seq OWNED BY public.envia.fk_id_feedbacks;
          public          postgres    false    239            �            1259    19278 	   feedbacks    TABLE     �   CREATE TABLE public.feedbacks (
    pk_id_feedbacks integer NOT NULL,
    data_feedbacks date NOT NULL,
    avaliacao_feedbacks character varying(5) NOT NULL,
    comentario_feedbacks character varying(255) NOT NULL
);
    DROP TABLE public.feedbacks;
       public         heap    postgres    false    4            �            1259    19277    feedbacks_pk_id_feedbacks_seq    SEQUENCE     �   CREATE SEQUENCE public.feedbacks_pk_id_feedbacks_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.feedbacks_pk_id_feedbacks_seq;
       public          postgres    false    4    224            l           0    0    feedbacks_pk_id_feedbacks_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.feedbacks_pk_id_feedbacks_seq OWNED BY public.feedbacks.pk_id_feedbacks;
          public          postgres    false    223            �            1259    19306    funcionarios    TABLE       CREATE TABLE public.funcionarios (
    pk_id_funcionarios integer NOT NULL,
    nome_funcionarios character varying(255) NOT NULL,
    sobrenome_funcionarios character varying(255) NOT NULL,
    data_contratacao_funcionarios date NOT NULL,
    fk_cod_cargo integer NOT NULL
);
     DROP TABLE public.funcionarios;
       public         heap    postgres    false    4            �            1259    19305    funcionarios_fk_cod_cargo_seq    SEQUENCE     �   CREATE SEQUENCE public.funcionarios_fk_cod_cargo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.funcionarios_fk_cod_cargo_seq;
       public          postgres    false    4    233            m           0    0    funcionarios_fk_cod_cargo_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.funcionarios_fk_cod_cargo_seq OWNED BY public.funcionarios.fk_cod_cargo;
          public          postgres    false    232            �            1259    19304 #   funcionarios_pk_id_funcionarios_seq    SEQUENCE     �   CREATE SEQUENCE public.funcionarios_pk_id_funcionarios_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.funcionarios_pk_id_funcionarios_seq;
       public          postgres    false    233    4            n           0    0 #   funcionarios_pk_id_funcionarios_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.funcionarios_pk_id_funcionarios_seq OWNED BY public.funcionarios.pk_id_funcionarios;
          public          postgres    false    231            �            1259    19269    manutencoes    TABLE     �   CREATE TABLE public.manutencoes (
    pk_id_manutencoes integer NOT NULL,
    data_manutencoes date NOT NULL,
    tipo_manutencoes character varying(255) NOT NULL,
    custo_manutencoes money NOT NULL,
    descricao_manutencoes character varying(255)
);
    DROP TABLE public.manutencoes;
       public         heap    postgres    false    4            �            1259    19268 !   manutencoes_pk_id_manutencoes_seq    SEQUENCE     �   CREATE SEQUENCE public.manutencoes_pk_id_manutencoes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.manutencoes_pk_id_manutencoes_seq;
       public          postgres    false    222    4            o           0    0 !   manutencoes_pk_id_manutencoes_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.manutencoes_pk_id_manutencoes_seq OWNED BY public.manutencoes.pk_id_manutencoes;
          public          postgres    false    221            �            1259    19587    niveis_acesso    TABLE     m   CREATE TABLE public.niveis_acesso (
    pk_nivel_acesso integer NOT NULL,
    nivel character varying(20)
);
 !   DROP TABLE public.niveis_acesso;
       public         heap    postgres    false    4            �            1259    19586 !   niveis_acesso_pk_nivel_acesso_seq    SEQUENCE     �   CREATE SEQUENCE public.niveis_acesso_pk_nivel_acesso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.niveis_acesso_pk_nivel_acesso_seq;
       public          postgres    false    253    4            p           0    0 !   niveis_acesso_pk_nivel_acesso_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.niveis_acesso_pk_nivel_acesso_seq OWNED BY public.niveis_acesso.pk_nivel_acesso;
          public          postgres    false    252            �            1259    19262 
   pagamentos    TABLE     �   CREATE TABLE public.pagamentos (
    pk_id_pagamentos integer NOT NULL,
    forma_pagamentos character varying(255) NOT NULL,
    data_pagamentos date NOT NULL,
    status_pagamentos character varying(50) NOT NULL
);
    DROP TABLE public.pagamentos;
       public         heap    postgres    false    4            �            1259    19261    pagamentos_pk_id_pagamentos_seq    SEQUENCE     �   CREATE SEQUENCE public.pagamentos_pk_id_pagamentos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.pagamentos_pk_id_pagamentos_seq;
       public          postgres    false    220    4            q           0    0    pagamentos_pk_id_pagamentos_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.pagamentos_pk_id_pagamentos_seq OWNED BY public.pagamentos.pk_id_pagamentos;
          public          postgres    false    219            �            1259    19374    realiza    TABLE       CREATE TABLE public.realiza (
    comprovante_realiza character varying(255) NOT NULL,
    pk_id_comprovante integer NOT NULL,
    fk_id_clientes_pf integer NOT NULL,
    fk_cnpj_clientes_pj character varying(18) NOT NULL,
    fk_id_pagamentos integer NOT NULL
);
    DROP TABLE public.realiza;
       public         heap    postgres    false    4            �            1259    19372    realiza_fk_id_clientes_pf_seq    SEQUENCE     �   CREATE SEQUENCE public.realiza_fk_id_clientes_pf_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.realiza_fk_id_clientes_pf_seq;
       public          postgres    false    245    4            r           0    0    realiza_fk_id_clientes_pf_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.realiza_fk_id_clientes_pf_seq OWNED BY public.realiza.fk_id_clientes_pf;
          public          postgres    false    243            �            1259    19373    realiza_fk_id_pagamentos_seq    SEQUENCE     �   CREATE SEQUENCE public.realiza_fk_id_pagamentos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.realiza_fk_id_pagamentos_seq;
       public          postgres    false    4    245            s           0    0    realiza_fk_id_pagamentos_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.realiza_fk_id_pagamentos_seq OWNED BY public.realiza.fk_id_pagamentos;
          public          postgres    false    244            �            1259    19371    realiza_pk_id_comprovante_seq    SEQUENCE     �   CREATE SEQUENCE public.realiza_pk_id_comprovante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.realiza_pk_id_comprovante_seq;
       public          postgres    false    245    4            t           0    0    realiza_pk_id_comprovante_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.realiza_pk_id_comprovante_seq OWNED BY public.realiza.pk_id_comprovante;
          public          postgres    false    242            �            1259    19340    recebe    TABLE     z   CREATE TABLE public.recebe (
    fk_id_manutencoes integer NOT NULL,
    fk_placa_carros character varying(8) NOT NULL
);
    DROP TABLE public.recebe;
       public         heap    postgres    false    4            �            1259    19339    recebe_fk_id_manutencoes_seq    SEQUENCE     �   CREATE SEQUENCE public.recebe_fk_id_manutencoes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.recebe_fk_id_manutencoes_seq;
       public          postgres    false    238    4            u           0    0    recebe_fk_id_manutencoes_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.recebe_fk_id_manutencoes_seq OWNED BY public.recebe.fk_id_manutencoes;
          public          postgres    false    237            �            1259    19548    seguros    TABLE     7  CREATE TABLE public.seguros (
    pk_id_seguros integer NOT NULL,
    tipo_seguros character varying(25) NOT NULL,
    cobertura_seguros character varying(50) NOT NULL,
    seguradora_seguros character varying(70) NOT NULL,
    valor_franquia_seguros money,
    fk_placa_carros character varying(8) NOT NULL
);
    DROP TABLE public.seguros;
       public         heap    postgres    false    4            �            1259    19547    seguros_pk_id_seguros_seq    SEQUENCE     �   CREATE SEQUENCE public.seguros_pk_id_seguros_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.seguros_pk_id_seguros_seq;
       public          postgres    false    247    4            v           0    0    seguros_pk_id_seguros_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.seguros_pk_id_seguros_seq OWNED BY public.seguros.pk_id_seguros;
          public          postgres    false    246            �           2604    19608 %   administradores pk_id_administradores    DEFAULT     �   ALTER TABLE ONLY public.administradores ALTER COLUMN pk_id_administradores SET DEFAULT nextval('public.administradores_pk_id_administradores_seq'::regclass);
 T   ALTER TABLE public.administradores ALTER COLUMN pk_id_administradores DROP DEFAULT;
       public          postgres    false    254    256    256            �           2604    19609    administradores fk_nivel_acesso    DEFAULT     �   ALTER TABLE ONLY public.administradores ALTER COLUMN fk_nivel_acesso SET DEFAULT nextval('public.administradores_fk_nivel_acesso_seq'::regclass);
 N   ALTER TABLE public.administradores ALTER COLUMN fk_nivel_acesso DROP DEFAULT;
       public          postgres    false    256    255    256            ~           2604    19289    agencias pk_num_agencias    DEFAULT     �   ALTER TABLE ONLY public.agencias ALTER COLUMN pk_num_agencias SET DEFAULT nextval('public.agencias_pk_num_agencias_seq'::regclass);
 G   ALTER TABLE public.agencias ALTER COLUMN pk_num_agencias DROP DEFAULT;
       public          postgres    false    227    225    227                       2604    19290    agencias fk_id_funcionarios    DEFAULT     �   ALTER TABLE ONLY public.agencias ALTER COLUMN fk_id_funcionarios SET DEFAULT nextval('public.agencias_fk_id_funcionarios_seq'::regclass);
 J   ALTER TABLE public.agencias ALTER COLUMN fk_id_funcionarios DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    19320    aluga pk_id_locacao_aluga    DEFAULT     �   ALTER TABLE ONLY public.aluga ALTER COLUMN pk_id_locacao_aluga SET DEFAULT nextval('public.aluga_pk_id_locacao_aluga_seq'::regclass);
 H   ALTER TABLE public.aluga ALTER COLUMN pk_id_locacao_aluga DROP DEFAULT;
       public          postgres    false    236    234    236            �           2604    19321    aluga fk_id_clientes_pf    DEFAULT     �   ALTER TABLE ONLY public.aluga ALTER COLUMN fk_id_clientes_pf SET DEFAULT nextval('public.aluga_fk_id_clientes_pf_seq'::regclass);
 F   ALTER TABLE public.aluga ALTER COLUMN fk_id_clientes_pf DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    19300    cargos pk_cod_cargos    DEFAULT     |   ALTER TABLE ONLY public.cargos ALTER COLUMN pk_cod_cargos SET DEFAULT nextval('public.cargos_pk_cod_cargos_seq'::regclass);
 C   ALTER TABLE public.cargos ALTER COLUMN pk_cod_cargos DROP DEFAULT;
       public          postgres    false    230    228    230            �           2604    19301    cargos fk_id_funcionarios    DEFAULT     �   ALTER TABLE ONLY public.cargos ALTER COLUMN fk_id_funcionarios SET DEFAULT nextval('public.cargos_fk_id_funcionarios_seq'::regclass);
 H   ALTER TABLE public.cargos ALTER COLUMN fk_id_funcionarios DROP DEFAULT;
       public          postgres    false    229    230    230            z           2604    20010    carros fk_id_categorias    DEFAULT     �   ALTER TABLE ONLY public.carros ALTER COLUMN fk_id_categorias SET DEFAULT nextval('public.carros_fk_id_categorias_seq'::regclass);
 F   ALTER TABLE public.carros ALTER COLUMN fk_id_categorias DROP DEFAULT;
       public          postgres    false    259    218            �           2604    20006 "   categorias_carros pk_id_categorias    DEFAULT     �   ALTER TABLE ONLY public.categorias_carros ALTER COLUMN pk_id_categorias SET DEFAULT nextval('public.categorias_carros_pk_id_categorias_seq'::regclass);
 Q   ALTER TABLE public.categorias_carros ALTER COLUMN pk_id_categorias DROP DEFAULT;
       public          postgres    false    257    258    258            x           2604    19251    clientes_pf pk_id_clientes_pf    DEFAULT     �   ALTER TABLE ONLY public.clientes_pf ALTER COLUMN pk_id_clientes_pf SET DEFAULT nextval('public.clientes_pf_pk_id_clientes_pf_seq'::regclass);
 L   ALTER TABLE public.clientes_pf ALTER COLUMN pk_id_clientes_pf DROP DEFAULT;
       public          postgres    false    217    216    217            y           2604    19579    clientes_pf fk_nivel_acesso    DEFAULT     �   ALTER TABLE ONLY public.clientes_pf ALTER COLUMN fk_nivel_acesso SET DEFAULT nextval('public.clientes_pf_fk_nivel_acesso_seq'::regclass);
 J   ALTER TABLE public.clientes_pf ALTER COLUMN fk_nivel_acesso DROP DEFAULT;
       public          postgres    false    251    217            �           2604    19564    devolucoes pk_id_devolucoes    DEFAULT     �   ALTER TABLE ONLY public.devolucoes ALTER COLUMN pk_id_devolucoes SET DEFAULT nextval('public.devolucoes_pk_id_devolucoes_seq'::regclass);
 J   ALTER TABLE public.devolucoes ALTER COLUMN pk_id_devolucoes DROP DEFAULT;
       public          postgres    false    250    248    250            �           2604    19565    devolucoes fk_id_clientes_pf    DEFAULT     �   ALTER TABLE ONLY public.devolucoes ALTER COLUMN fk_id_clientes_pf SET DEFAULT nextval('public.devolucoes_fk_id_clientes_pf_seq'::regclass);
 K   ALTER TABLE public.devolucoes ALTER COLUMN fk_id_clientes_pf DROP DEFAULT;
       public          postgres    false    249    250    250            �           2604    19359    envia fk_id_feedbacks    DEFAULT     ~   ALTER TABLE ONLY public.envia ALTER COLUMN fk_id_feedbacks SET DEFAULT nextval('public.envia_fk_id_feedbacks_seq'::regclass);
 D   ALTER TABLE public.envia ALTER COLUMN fk_id_feedbacks DROP DEFAULT;
       public          postgres    false    239    241    241            �           2604    19360    envia fk_id_clientes_pf    DEFAULT     �   ALTER TABLE ONLY public.envia ALTER COLUMN fk_id_clientes_pf SET DEFAULT nextval('public.envia_fk_id_clientes_pf_seq'::regclass);
 F   ALTER TABLE public.envia ALTER COLUMN fk_id_clientes_pf DROP DEFAULT;
       public          postgres    false    241    240    241            }           2604    19281    feedbacks pk_id_feedbacks    DEFAULT     �   ALTER TABLE ONLY public.feedbacks ALTER COLUMN pk_id_feedbacks SET DEFAULT nextval('public.feedbacks_pk_id_feedbacks_seq'::regclass);
 H   ALTER TABLE public.feedbacks ALTER COLUMN pk_id_feedbacks DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    19309    funcionarios pk_id_funcionarios    DEFAULT     �   ALTER TABLE ONLY public.funcionarios ALTER COLUMN pk_id_funcionarios SET DEFAULT nextval('public.funcionarios_pk_id_funcionarios_seq'::regclass);
 N   ALTER TABLE public.funcionarios ALTER COLUMN pk_id_funcionarios DROP DEFAULT;
       public          postgres    false    231    233    233            �           2604    19310    funcionarios fk_cod_cargo    DEFAULT     �   ALTER TABLE ONLY public.funcionarios ALTER COLUMN fk_cod_cargo SET DEFAULT nextval('public.funcionarios_fk_cod_cargo_seq'::regclass);
 H   ALTER TABLE public.funcionarios ALTER COLUMN fk_cod_cargo DROP DEFAULT;
       public          postgres    false    232    233    233            |           2604    19272    manutencoes pk_id_manutencoes    DEFAULT     �   ALTER TABLE ONLY public.manutencoes ALTER COLUMN pk_id_manutencoes SET DEFAULT nextval('public.manutencoes_pk_id_manutencoes_seq'::regclass);
 L   ALTER TABLE public.manutencoes ALTER COLUMN pk_id_manutencoes DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    19590    niveis_acesso pk_nivel_acesso    DEFAULT     �   ALTER TABLE ONLY public.niveis_acesso ALTER COLUMN pk_nivel_acesso SET DEFAULT nextval('public.niveis_acesso_pk_nivel_acesso_seq'::regclass);
 L   ALTER TABLE public.niveis_acesso ALTER COLUMN pk_nivel_acesso DROP DEFAULT;
       public          postgres    false    252    253    253            {           2604    19265    pagamentos pk_id_pagamentos    DEFAULT     �   ALTER TABLE ONLY public.pagamentos ALTER COLUMN pk_id_pagamentos SET DEFAULT nextval('public.pagamentos_pk_id_pagamentos_seq'::regclass);
 J   ALTER TABLE public.pagamentos ALTER COLUMN pk_id_pagamentos DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    19377    realiza pk_id_comprovante    DEFAULT     �   ALTER TABLE ONLY public.realiza ALTER COLUMN pk_id_comprovante SET DEFAULT nextval('public.realiza_pk_id_comprovante_seq'::regclass);
 H   ALTER TABLE public.realiza ALTER COLUMN pk_id_comprovante DROP DEFAULT;
       public          postgres    false    242    245    245            �           2604    19378    realiza fk_id_clientes_pf    DEFAULT     �   ALTER TABLE ONLY public.realiza ALTER COLUMN fk_id_clientes_pf SET DEFAULT nextval('public.realiza_fk_id_clientes_pf_seq'::regclass);
 H   ALTER TABLE public.realiza ALTER COLUMN fk_id_clientes_pf DROP DEFAULT;
       public          postgres    false    243    245    245            �           2604    19379    realiza fk_id_pagamentos    DEFAULT     �   ALTER TABLE ONLY public.realiza ALTER COLUMN fk_id_pagamentos SET DEFAULT nextval('public.realiza_fk_id_pagamentos_seq'::regclass);
 G   ALTER TABLE public.realiza ALTER COLUMN fk_id_pagamentos DROP DEFAULT;
       public          postgres    false    244    245    245            �           2604    19343    recebe fk_id_manutencoes    DEFAULT     �   ALTER TABLE ONLY public.recebe ALTER COLUMN fk_id_manutencoes SET DEFAULT nextval('public.recebe_fk_id_manutencoes_seq'::regclass);
 G   ALTER TABLE public.recebe ALTER COLUMN fk_id_manutencoes DROP DEFAULT;
       public          postgres    false    238    237    238            �           2604    19551    seguros pk_id_seguros    DEFAULT     ~   ALTER TABLE ONLY public.seguros ALTER COLUMN pk_id_seguros SET DEFAULT nextval('public.seguros_pk_id_seguros_seq'::regclass);
 D   ALTER TABLE public.seguros ALTER COLUMN pk_id_seguros DROP DEFAULT;
       public          postgres    false    246    247    247            �           2606    19611 $   administradores administradores_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.administradores
    ADD CONSTRAINT administradores_pkey PRIMARY KEY (pk_id_administradores);
 N   ALTER TABLE ONLY public.administradores DROP CONSTRAINT administradores_pkey;
       public            postgres    false    256            �           2606    19294    agencias agencias_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.agencias
    ADD CONSTRAINT agencias_pkey PRIMARY KEY (pk_num_agencias);
 @   ALTER TABLE ONLY public.agencias DROP CONSTRAINT agencias_pkey;
       public            postgres    false    227            �           2606    19323    aluga aluga_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.aluga
    ADD CONSTRAINT aluga_pkey PRIMARY KEY (pk_id_locacao_aluga);
 :   ALTER TABLE ONLY public.aluga DROP CONSTRAINT aluga_pkey;
       public            postgres    false    236            �           2606    19303    cargos cargos_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT cargos_pkey PRIMARY KEY (pk_cod_cargos);
 <   ALTER TABLE ONLY public.cargos DROP CONSTRAINT cargos_pkey;
       public            postgres    false    230            �           2606    19260    carros carros_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.carros
    ADD CONSTRAINT carros_pkey PRIMARY KEY (pk_placa_carros);
 <   ALTER TABLE ONLY public.carros DROP CONSTRAINT carros_pkey;
       public            postgres    false    218            �           2606    20008 (   categorias_carros categorias_carros_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.categorias_carros
    ADD CONSTRAINT categorias_carros_pkey PRIMARY KEY (pk_id_categorias);
 R   ALTER TABLE ONLY public.categorias_carros DROP CONSTRAINT categorias_carros_pkey;
       public            postgres    false    258            �           2606    19255    clientes_pf clientes_pf_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.clientes_pf
    ADD CONSTRAINT clientes_pf_pkey PRIMARY KEY (pk_id_clientes_pf);
 F   ALTER TABLE ONLY public.clientes_pf DROP CONSTRAINT clientes_pf_pkey;
       public            postgres    false    217            �           2606    19526    clientes_pj clientes_pj_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.clientes_pj
    ADD CONSTRAINT clientes_pj_pkey PRIMARY KEY (pk_cnpj_clientes_pj);
 F   ALTER TABLE ONLY public.clientes_pj DROP CONSTRAINT clientes_pj_pkey;
       public            postgres    false    215            �           2606    19567    devolucoes devolucoes_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.devolucoes
    ADD CONSTRAINT devolucoes_pkey PRIMARY KEY (pk_id_devolucoes);
 D   ALTER TABLE ONLY public.devolucoes DROP CONSTRAINT devolucoes_pkey;
       public            postgres    false    250            �           2606    19283    feedbacks feedbacks_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (pk_id_feedbacks);
 B   ALTER TABLE ONLY public.feedbacks DROP CONSTRAINT feedbacks_pkey;
       public            postgres    false    224            �           2606    19314    funcionarios funcionarios_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (pk_id_funcionarios);
 H   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT funcionarios_pkey;
       public            postgres    false    233            �           2606    19276    manutencoes manutencoes_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.manutencoes
    ADD CONSTRAINT manutencoes_pkey PRIMARY KEY (pk_id_manutencoes);
 F   ALTER TABLE ONLY public.manutencoes DROP CONSTRAINT manutencoes_pkey;
       public            postgres    false    222            �           2606    19592     niveis_acesso niveis_acesso_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.niveis_acesso
    ADD CONSTRAINT niveis_acesso_pkey PRIMARY KEY (pk_nivel_acesso);
 J   ALTER TABLE ONLY public.niveis_acesso DROP CONSTRAINT niveis_acesso_pkey;
       public            postgres    false    253            �           2606    19267    pagamentos pagamentos_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.pagamentos
    ADD CONSTRAINT pagamentos_pkey PRIMARY KEY (pk_id_pagamentos);
 D   ALTER TABLE ONLY public.pagamentos DROP CONSTRAINT pagamentos_pkey;
       public            postgres    false    220            �           2606    19381    realiza realiza_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.realiza
    ADD CONSTRAINT realiza_pkey PRIMARY KEY (pk_id_comprovante);
 >   ALTER TABLE ONLY public.realiza DROP CONSTRAINT realiza_pkey;
       public            postgres    false    245            �           2606    19553    seguros seguros_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.seguros
    ADD CONSTRAINT seguros_pkey PRIMARY KEY (pk_id_seguros);
 >   ALTER TABLE ONLY public.seguros DROP CONSTRAINT seguros_pkey;
       public            postgres    false    247            �           2606    19612 4   administradores administradores_fk_nivel_acesso_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.administradores
    ADD CONSTRAINT administradores_fk_nivel_acesso_fkey FOREIGN KEY (fk_nivel_acesso) REFERENCES public.niveis_acesso(pk_nivel_acesso);
 ^   ALTER TABLE ONLY public.administradores DROP CONSTRAINT administradores_fk_nivel_acesso_fkey;
       public          postgres    false    256    4782    253            �           2606    19510 )   agencias agencias_fk_id_funcionarios_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.agencias
    ADD CONSTRAINT agencias_fk_id_funcionarios_fkey FOREIGN KEY (fk_id_funcionarios) REFERENCES public.funcionarios(pk_id_funcionarios);
 S   ALTER TABLE ONLY public.agencias DROP CONSTRAINT agencias_fk_id_funcionarios_fkey;
       public          postgres    false    4772    227    233            �           2606    19515 &   agencias agencias_fk_placa_carros_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.agencias
    ADD CONSTRAINT agencias_fk_placa_carros_fkey FOREIGN KEY (fk_placa_carros) REFERENCES public.carros(pk_placa_carros);
 P   ALTER TABLE ONLY public.agencias DROP CONSTRAINT agencias_fk_placa_carros_fkey;
       public          postgres    false    4760    227    218            �           2606    19537 $   aluga aluga_fk_cnpj_clientes_pj_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aluga
    ADD CONSTRAINT aluga_fk_cnpj_clientes_pj_fkey FOREIGN KEY (fk_cnpj_clientes_pj) REFERENCES public.clientes_pj(pk_cnpj_clientes_pj);
 N   ALTER TABLE ONLY public.aluga DROP CONSTRAINT aluga_fk_cnpj_clientes_pj_fkey;
       public          postgres    false    4756    215    236            �           2606    19324 "   aluga aluga_fk_id_clientes_pf_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aluga
    ADD CONSTRAINT aluga_fk_id_clientes_pf_fkey FOREIGN KEY (fk_id_clientes_pf) REFERENCES public.clientes_pf(pk_id_clientes_pf);
 L   ALTER TABLE ONLY public.aluga DROP CONSTRAINT aluga_fk_id_clientes_pf_fkey;
       public          postgres    false    4758    217    236            �           2606    19329     aluga aluga_fk_placa_carros_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aluga
    ADD CONSTRAINT aluga_fk_placa_carros_fkey FOREIGN KEY (fk_placa_carros) REFERENCES public.carros(pk_placa_carros);
 J   ALTER TABLE ONLY public.aluga DROP CONSTRAINT aluga_fk_placa_carros_fkey;
       public          postgres    false    236    4760    218            �           2606    19520 %   cargos cargos_fk_id_funcionarios_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT cargos_fk_id_funcionarios_fkey FOREIGN KEY (fk_id_funcionarios) REFERENCES public.funcionarios(pk_id_funcionarios);
 O   ALTER TABLE ONLY public.cargos DROP CONSTRAINT cargos_fk_id_funcionarios_fkey;
       public          postgres    false    233    230    4772            �           2606    20022 #   carros carros_fk_id_categorias_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.carros
    ADD CONSTRAINT carros_fk_id_categorias_fkey FOREIGN KEY (fk_id_categorias) REFERENCES public.categorias_carros(pk_id_categorias);
 M   ALTER TABLE ONLY public.carros DROP CONSTRAINT carros_fk_id_categorias_fkey;
       public          postgres    false    218    4786    258            �           2606    19598 ,   clientes_pf clientes_pf_fk_nivel_acesso_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clientes_pf
    ADD CONSTRAINT clientes_pf_fk_nivel_acesso_fkey FOREIGN KEY (fk_nivel_acesso) REFERENCES public.niveis_acesso(pk_nivel_acesso);
 V   ALTER TABLE ONLY public.clientes_pf DROP CONSTRAINT clientes_pf_fk_nivel_acesso_fkey;
       public          postgres    false    4782    253    217            �           2606    19573 ,   devolucoes devolucoes_fk_id_clientes_pf_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.devolucoes
    ADD CONSTRAINT devolucoes_fk_id_clientes_pf_fkey FOREIGN KEY (fk_id_clientes_pf) REFERENCES public.clientes_pf(pk_id_clientes_pf);
 V   ALTER TABLE ONLY public.devolucoes DROP CONSTRAINT devolucoes_fk_id_clientes_pf_fkey;
       public          postgres    false    4758    250    217            �           2606    19568 *   devolucoes devolucoes_fk_placa_carros_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.devolucoes
    ADD CONSTRAINT devolucoes_fk_placa_carros_fkey FOREIGN KEY (fk_placa_carros) REFERENCES public.carros(pk_placa_carros);
 T   ALTER TABLE ONLY public.devolucoes DROP CONSTRAINT devolucoes_fk_placa_carros_fkey;
       public          postgres    false    250    218    4760            �           2606    19366 "   envia envia_fk_id_clientes_pf_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.envia
    ADD CONSTRAINT envia_fk_id_clientes_pf_fkey FOREIGN KEY (fk_id_clientes_pf) REFERENCES public.clientes_pf(pk_id_clientes_pf);
 L   ALTER TABLE ONLY public.envia DROP CONSTRAINT envia_fk_id_clientes_pf_fkey;
       public          postgres    false    241    217    4758            �           2606    19361     envia envia_fk_id_feedbacks_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.envia
    ADD CONSTRAINT envia_fk_id_feedbacks_fkey FOREIGN KEY (fk_id_feedbacks) REFERENCES public.feedbacks(pk_id_feedbacks);
 J   ALTER TABLE ONLY public.envia DROP CONSTRAINT envia_fk_id_feedbacks_fkey;
       public          postgres    false    4766    224    241            �           2606    19542 (   realiza realiza_fk_cnpj_clientes_pj_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.realiza
    ADD CONSTRAINT realiza_fk_cnpj_clientes_pj_fkey FOREIGN KEY (fk_cnpj_clientes_pj) REFERENCES public.clientes_pj(pk_cnpj_clientes_pj);
 R   ALTER TABLE ONLY public.realiza DROP CONSTRAINT realiza_fk_cnpj_clientes_pj_fkey;
       public          postgres    false    245    215    4756            �           2606    19382 &   realiza realiza_fk_id_clientes_pf_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.realiza
    ADD CONSTRAINT realiza_fk_id_clientes_pf_fkey FOREIGN KEY (fk_id_clientes_pf) REFERENCES public.clientes_pf(pk_id_clientes_pf);
 P   ALTER TABLE ONLY public.realiza DROP CONSTRAINT realiza_fk_id_clientes_pf_fkey;
       public          postgres    false    4758    245    217            �           2606    19392 %   realiza realiza_fk_id_pagamentos_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.realiza
    ADD CONSTRAINT realiza_fk_id_pagamentos_fkey FOREIGN KEY (fk_id_pagamentos) REFERENCES public.pagamentos(pk_id_pagamentos);
 O   ALTER TABLE ONLY public.realiza DROP CONSTRAINT realiza_fk_id_pagamentos_fkey;
       public          postgres    false    4762    245    220            �           2606    19344 $   recebe recebe_fk_id_manutencoes_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recebe
    ADD CONSTRAINT recebe_fk_id_manutencoes_fkey FOREIGN KEY (fk_id_manutencoes) REFERENCES public.manutencoes(pk_id_manutencoes);
 N   ALTER TABLE ONLY public.recebe DROP CONSTRAINT recebe_fk_id_manutencoes_fkey;
       public          postgres    false    222    4764    238            �           2606    19349 "   recebe recebe_fk_placa_carros_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recebe
    ADD CONSTRAINT recebe_fk_placa_carros_fkey FOREIGN KEY (fk_placa_carros) REFERENCES public.carros(pk_placa_carros);
 L   ALTER TABLE ONLY public.recebe DROP CONSTRAINT recebe_fk_placa_carros_fkey;
       public          postgres    false    218    4760    238            �           2606    19554 $   seguros seguros_fk_placa_carros_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.seguros
    ADD CONSTRAINT seguros_fk_placa_carros_fkey FOREIGN KEY (fk_placa_carros) REFERENCES public.carros(pk_placa_carros);
 N   ALTER TABLE ONLY public.seguros DROP CONSTRAINT seguros_fk_placa_carros_fkey;
       public          postgres    false    4760    218    247           