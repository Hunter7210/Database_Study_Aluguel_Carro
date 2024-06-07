PGDMP  $    +                |            db_locadora_carros_heitor    16.2    16.2 1    i           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            j           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            k           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            l           1262    19231    db_locadora_carros_heitor    DATABASE     �   CREATE DATABASE db_locadora_carros_heitor WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
 )   DROP DATABASE db_locadora_carros_heitor;
                postgres    false            `          0    19587    niveis_acesso 
   TABLE DATA           ?   COPY public.niveis_acesso (pk_nivel_acesso, nivel) FROM stdin;
    public          postgres    false    253   v/       c          0    19605    administradores 
   TABLE DATA           }   COPY public.administradores (pk_id_administradores, cpf_administradores, fk_nivel_acesso, senha_administradores) FROM stdin;
    public          postgres    false    256   �/       e          0    20003    categorias_carros 
   TABLE DATA           \   COPY public.categorias_carros (pk_id_categorias, nome_categorias, valor_diario) FROM stdin;
    public          postgres    false    258   0       =          0    19256    carros 
   TABLE DATA           �   COPY public.carros (pk_placa_carros, disponibilidade_carros, ano_carros, modelo_carros, marca_carros, fk_id_categorias, img_carros) FROM stdin;
    public          postgres    false    218   �0       L          0    19306    funcionarios 
   TABLE DATA           �   COPY public.funcionarios (pk_id_funcionarios, nome_funcionarios, sobrenome_funcionarios, data_contratacao_funcionarios, fk_cod_cargo) FROM stdin;
    public          postgres    false    233   ^1       F          0    19286    agencias 
   TABLE DATA           �   COPY public.agencias (pk_num_agencias, contato_agencias, endereco_agencias, cidade_agencias, uf_agencias, fk_id_funcionarios, fk_placa_carros) FROM stdin;
    public          postgres    false    227   �1       <          0    19248    clientes_pf 
   TABLE DATA           �   COPY public.clientes_pf (pk_id_clientes_pf, nome_clientes_pf, sobrenome_clientes_pf, email_clientes_pf, celular_clientes_pf, endereco_clientes_pf, cidade_clientes_pf, estado_clientes_pf, senha_cliente_pf, fk_nivel_acesso) FROM stdin;
    public          postgres    false    217   �2       :          0    19240    clientes_pj 
   TABLE DATA           �   COPY public.clientes_pj (pk_cnpj_clientes_pj, telefone_clientes_pj, cep_clientes_pj, nome_clientes_pj, email_clientes_pj, senha_cliente_pj) FROM stdin;
    public          postgres    false    215   14       O          0    19317    aluga 
   TABLE DATA           �   COPY public.aluga (pk_id_locacao_aluga, valor_total_aluga, data_entrega_aluga, data_retirada_aluga, fk_id_clientes_pf, fk_placa_carros, fk_cnpj_clientes_pj) FROM stdin;
    public          postgres    false    236   �4       I          0    19297    cargos 
   TABLE DATA           `   COPY public.cargos (pk_cod_cargos, nome_cargos, salario_cargos, fk_id_funcionarios) FROM stdin;
    public          postgres    false    230   r5       ]          0    19561 
   devolucoes 
   TABLE DATA           �   COPY public.devolucoes (pk_id_devolucoes, data_devolucoes, condicao_veiculo_devolucoes, custos_adicionais_devolucoes, fk_placa_carros, fk_id_clientes_pf) FROM stdin;
    public          postgres    false    250   �5       C          0    19278 	   feedbacks 
   TABLE DATA           o   COPY public.feedbacks (pk_id_feedbacks, data_feedbacks, avaliacao_feedbacks, comentario_feedbacks) FROM stdin;
    public          postgres    false    224   6       T          0    19356    envia 
   TABLE DATA           C   COPY public.envia (fk_id_feedbacks, fk_id_clientes_pf) FROM stdin;
    public          postgres    false    241   �6       A          0    19269    manutencoes 
   TABLE DATA           �   COPY public.manutencoes (pk_id_manutencoes, data_manutencoes, tipo_manutencoes, custo_manutencoes, descricao_manutencoes) FROM stdin;
    public          postgres    false    222   �6       ?          0    19262 
   pagamentos 
   TABLE DATA           l   COPY public.pagamentos (pk_id_pagamentos, forma_pagamentos, data_pagamentos, status_pagamentos) FROM stdin;
    public          postgres    false    220   �7       X          0    19374    realiza 
   TABLE DATA           �   COPY public.realiza (comprovante_realiza, pk_id_comprovante, fk_id_clientes_pf, fk_cnpj_clientes_pj, fk_id_pagamentos) FROM stdin;
    public          postgres    false    245   *8       Q          0    19340    recebe 
   TABLE DATA           D   COPY public.recebe (fk_id_manutencoes, fk_placa_carros) FROM stdin;
    public          postgres    false    238   �8       Z          0    19548    seguros 
   TABLE DATA           �   COPY public.seguros (pk_id_seguros, tipo_seguros, cobertura_seguros, seguradora_seguros, valor_franquia_seguros, fk_placa_carros) FROM stdin;
    public          postgres    false    247   �8       m           0    0 #   administradores_fk_nivel_acesso_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.administradores_fk_nivel_acesso_seq', 1, false);
          public          postgres    false    255            n           0    0 )   administradores_pk_id_administradores_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.administradores_pk_id_administradores_seq', 3, true);
          public          postgres    false    254            o           0    0    agencias_fk_id_funcionarios_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.agencias_fk_id_funcionarios_seq', 1, false);
          public          postgres    false    226            p           0    0    agencias_pk_num_agencias_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.agencias_pk_num_agencias_seq', 5, true);
          public          postgres    false    225            q           0    0    aluga_fk_id_clientes_pf_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.aluga_fk_id_clientes_pf_seq', 1, false);
          public          postgres    false    235            r           0    0    aluga_pk_id_locacao_aluga_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.aluga_pk_id_locacao_aluga_seq', 10, true);
          public          postgres    false    234            s           0    0    cargos_fk_id_funcionarios_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.cargos_fk_id_funcionarios_seq', 30, true);
          public          postgres    false    229            t           0    0    cargos_pk_cod_cargos_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.cargos_pk_cod_cargos_seq', 35, true);
          public          postgres    false    228            u           0    0    carros_fk_id_categorias_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.carros_fk_id_categorias_seq', 5, true);
          public          postgres    false    259            v           0    0 &   categorias_carros_pk_id_categorias_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.categorias_carros_pk_id_categorias_seq', 1, false);
          public          postgres    false    257            w           0    0    clientes_pf_fk_nivel_acesso_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.clientes_pf_fk_nivel_acesso_seq', 5, true);
          public          postgres    false    251            x           0    0 !   clientes_pf_pk_id_clientes_pf_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.clientes_pf_pk_id_clientes_pf_seq', 6, true);
          public          postgres    false    216            y           0    0     devolucoes_fk_id_clientes_pf_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.devolucoes_fk_id_clientes_pf_seq', 1, false);
          public          postgres    false    249            z           0    0    devolucoes_pk_id_devolucoes_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.devolucoes_pk_id_devolucoes_seq', 1, false);
          public          postgres    false    248            {           0    0    envia_fk_id_clientes_pf_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.envia_fk_id_clientes_pf_seq', 1, false);
          public          postgres    false    240            |           0    0    envia_fk_id_feedbacks_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.envia_fk_id_feedbacks_seq', 1, false);
          public          postgres    false    239            }           0    0    feedbacks_pk_id_feedbacks_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.feedbacks_pk_id_feedbacks_seq', 5, true);
          public          postgres    false    223            ~           0    0    funcionarios_fk_cod_cargo_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.funcionarios_fk_cod_cargo_seq', 1, false);
          public          postgres    false    232                       0    0 #   funcionarios_pk_id_funcionarios_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.funcionarios_pk_id_funcionarios_seq', 10, true);
          public          postgres    false    231            �           0    0 !   manutencoes_pk_id_manutencoes_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.manutencoes_pk_id_manutencoes_seq', 5, true);
          public          postgres    false    221            �           0    0 !   niveis_acesso_pk_nivel_acesso_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.niveis_acesso_pk_nivel_acesso_seq', 3, true);
          public          postgres    false    252            �           0    0    pagamentos_pk_id_pagamentos_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.pagamentos_pk_id_pagamentos_seq', 5, true);
          public          postgres    false    219            �           0    0    realiza_fk_id_clientes_pf_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.realiza_fk_id_clientes_pf_seq', 1, false);
          public          postgres    false    243            �           0    0    realiza_fk_id_pagamentos_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.realiza_fk_id_pagamentos_seq', 1, false);
          public          postgres    false    244            �           0    0    realiza_pk_id_comprovante_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.realiza_pk_id_comprovante_seq', 5, true);
          public          postgres    false    242            �           0    0    recebe_fk_id_manutencoes_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.recebe_fk_id_manutencoes_seq', 1, false);
          public          postgres    false    237            �           0    0    seguros_pk_id_seguros_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.seguros_pk_id_seguros_seq', 1, false);
          public          postgres    false    246            `   6   x�3�tL����,.)JL�/�2�-.=��(3_�9?�4�˘�7?%"���� ��r      c   L   x�M�;
�@�x�.�ݳ���F&��D0,Y[�1�R���u�p�=Z�X��u�@�I[�g�|w=�o      e   Y   x�3��H,I�����2�1�9��J@L��ԔËALSN�Ĥ����T��gxbz~�i�雙�Y��Xpd&g��81z\\\ SS�      =   �   x�e�Mn�0���w!�s�_v%ᯔ��K6VbK�/��H�N=E/V"��F��of��j<�Πо%���+��A��#c$|ӕ��S�>w_�_�ߑU����!���`��=\�� oT[RҁYo�s䯌�w�lpJ��� �	����P%MC>d	�<�yV>��s4�]���>9�$��������u������1���X      L   �   x�}�1�0E���NC��!H]Y"�!R!R�\��p1��������~߄.c��	��z(N!ǀ��>�j���F����cx��sbK�N���Х�gV_�zT�y(��x���Z���rH�Ҭ��K!*�%����D      F   �   x�e�;n�@����*f���Ï΀;$N�Ц���5�J#h��,%���I���0����a��t����,2IJ���e���g�EYͳj�j%�L���,�A�~11\����nw{��W���n@z�WN�gnh\���I�E��>ͯsB5�8�o����~{'R$���ʝ3�r���Ȳ��#���OM���F���W�      <   H  x�u�Kn�0��p
/�D0�d��JRj��fJ��
�ԁ>r���Y U,,����v!nJ�!a�q����Y^r&jf�ǙNƁ�Qׅ�A�ĳ=H�$Fb���4�R��p`Ŕ@q�0/+��{a�vZ{ejS�~o�$ؔ���R�6G�Y�wWV]a��-�ķ}X�R�H*~�z'l�>�A���8�R^j��=�^+�M�,�k��?2�>lQ��������z�I���jI�%;)i�7�����v1;U��N�����4rF�=���G{+|�F�6�y�^��ǉg]�w*�6���c��B�eM�c!b�螯�a$��      :   �   x�]�I�0Dѵ}
.@��Ȏ)�`c�%6����1C���%Ճ��o�;"A��Uiº�j�4��A�<-a���YB��4�C����m�����e�ul������l�ZVX�֊�b�`[�ZNX�ֺI�)��l�jya���u��/sNgQ      O   �   x�e�9
�@����)R�F�x)��	�����fP��_��^I��f(�7,��(�v�5G}J��.,�O�̰$�����X�(뢬����:F
i9��q��%68n�G�iY�)��iO�(x��&.H�ⅾ-� �7�      I   o   x�5�1
�0 �9y�����Xtwg� i���[���|k�$�;��UD��k�c�����jd�ޭǇk���$���q��C�6s�l`��n�;X�P+��E!��#Q      ]      x������ � �      C   �   x�E�M
�0����)� V�{ ��&5�NI��F�9z1����Y|�2nP~P<ܶ'ϼ4����������$m,\%�(�J�D���KJ(�:&\��6�(�u��������5e��x�)ogD��i/c      T   !   x�3�4�2�4�2�4�2�4�2�4����� '�      A   �   x�]�1�0E��%is P1��⪑Ҥ4)���M����o?[2%Tyr.v|��N|z[��q%�^�M�o����i�*z�0��W�k��w���Pd��k{GcX8y�>�ǈs�:e�Kv�Ƶؑ�)S�D���7��jZ5�kv���Zl��1Dc[�h�1����W~      ?   �   x�M���0@��^ �v�	�

�S|�I�,^Q�^��I�>f����f���O�Z ��� ᭘ SyP-vBY�Ky�xH$���!�+	=�pR�畴}ea�OpUǮ���r'��?vt�c~0�2�      X   _   x�U�;
�@��:9�'����Q�5l,,uE��#,.5�1)oǙ�e��F��4�~lr����OL/�Q��V$�WDmV$�W$��e��P*�      Q   >   x����0��T����v�q*2����X�}P�yI&f���
�kH�&�
<      Z      x������ � �     