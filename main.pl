% Fatos
mochila(amarela). 
mochila(azul). 
mochila(branca). 
mochila(verde). 
mochila(vermelha).

nome(denis). 
nome(joao). 
nome(lenin). 
nome(otavio). 
nome(will).

mes(agosto). 
mes(dezembro). 
mes(janeiro). 
mes(maio). 
mes(setembro).

jogo('3 ou Mais'). 
jogo('Caça Palavras'). 
jogo('Cubo Vermelho'). 
jogo('Jogo da Forca'). 
jogo('Prob. de Logica').

materia(biologia). 
materia(geografia). 
materia(historia). 
materia(matematica). 
materia(portugues).

suco(laranja). 
suco(limao). 
suco(maracuja). 
suco(morango). 
suco(uva).


solucao(Meninos) :-
    Meninos = [
        menino(Mochila1, Nome1, Mes1, Jogo1, Materia1, Suco1),    
        menino(Mochila2, Nome2, Mes2, Jogo2, Materia2, Suco2),
        menino(Mochila3, Nome3, Mes3, Jogo3, Materia3, Suco3),  
        menino(Mochila4, Nome4, Mes4, Jogo4, Materia4, Suco4),
        menino(Mochila5, Nome5, Mes5, Jogo5, Materia5, Suco5)     
    ],

    % Posicoes que já sabemos:
    Suco1 = limao,               
    Suco3 = morango,             
    Nome5 = lenin,               
    Jogo3 = 'Jogo da Forca',

    %alldifferent([Mochila1, Mochila2, Mochila3, Mochila4, Mochila5]),
    %alldifferent([Nome1, Nome2, Nome3, Nome4, Nome5]),
    %alldifferent([Mes1, Mes2, Mes3, Mes4, Mes5]),
    %alldifferent([Jogo1, Jogo2, Jogo3, Jogo4, Jogo5]),
    %alldifferent([Materia1, Materia2, Materia3, Materia4, Materia5]),
    %alldifferent([limao, Suco2, morango, Suco4, Suco5]),

    gosta_biologia_e_morango(Meninos),
    otavio_esta_em_uma_das_pontas(Meninos),
    uva_a_esquerda_de_portugues(Meninos),
    gosta_logica_e_uva(Meninos),
    treoumais_esta_ao_lado_problogica(Meninos),
    will_ao_lado_de_logicaproblemas(Meninos),
    mochilabranca_esta_ao_lado_will(Meninos),
    forca_ao_lado_de_mochila_vermelha(Meninos),
    quem_gosta_de_matematica_gosta_de_maracuja(Meninos),
    joao_gosta_de_historia(Meninos),
    laranja_ultimaposicao_pois_sobrou(Meninos),
    matematica_dezembro(Meninos),
    geografia_primeiraposicao_pois_sobrou(Meninos),
    setembro_ao_lado_de_laranja(Meninos),
    denis_segundaposicao_pois_sobrou(Meninos),
    setembro_ao_lado_de_cubovermelho(Meninos),
    cubovermelho_esta_em_uma_das_pontas(Meninos),
    cacapalavras_primeiraposicao_pois_sobrou(Meninos),
    janeiro_ao_lado_de_setembro(Meninos),
    logica_ao_lado_de_amarela(Meninos),
    azul_com_janeiro(Meninos),
    uva_a_direita_de_azul(Meninos),

    azul_a_esquerda_de_maio(Meninos),

    verde_primeiraposicao_pois_sobrou(Meninos),
    agosto_primeiraposicao_pois_sobrou(Meninos),
    imprimir_lista(Meninos).


%O garoto que gosta de Biologia gosta de suco de Morango.
gosta_biologia_e_morango(Meninos) :-
    member(menino(_, _, _, _, biologia, morango), Meninos).

%Otávio está em uma das pontas.
otavio_esta_em_uma_das_pontas(Meninos) :-
    Meninos = [Primeiro | _], Primeiro = menino(_, otavio, _, _, _, _);
    last(Meninos, Ultimo), Ultimo = menino(_, otavio, _, _, _, _).

%João gosta de história.
joao_gosta_de_historia(Meninos) :-
    member(menino(_, joao, _, _, historia, _), Meninos).

%Em uma das pontas está o menino que adora jogar Cubo Vermelho.
cubovermelho_esta_em_uma_das_pontas(Meninos) :-
    Meninos = [Primeiro | _], Primeiro = menino(_, _, _, 'Cubo Vermelho', _, _);
    last(Meninos, Ultimo), Ultimo = menino(_, _, _,'Cubo Vermelho', _, _).

%Quem gosta de suco de Uva está exatamente à esquerda de quem gosta de Português.
uva_a_esquerda_de_portugues(Meninos) :-
    append(_, [menino(_, _, _, _, _, uva), menino(_, _, _, _, portugues, _) | _], Meninos).
    
%Quem gosta de suco de Uva gosta de Problemas de Lógica.
gosta_logica_e_uva(Meninos) :-
    member(menino(_, _, _, 'Prob. de Logica', _, uva), Meninos). 

treoumais_esta_ao_lado_problogica(Meninos) :-
    nth1(2, Meninos, menino(_, _, _, '3 ou Mais', _, _)).

% Will está ao lado do menino que gosta de Problemas de Lógica.
will_ao_lado_de_logicaproblemas(Meninos) :-
    nextto(menino(_, will, _, _, _, _), 
           menino(_, _, _, 'Prob. de Logica', _, _), 
           Meninos);
    nextto(menino(_, _, _, 'Prob. de Logica', _, _), 
           menino(_, will, _, _, _, _), 
           Meninos).    

% O garoto da mochila Branca está exatamente à esquerda de Will.
mochilabranca_esta_ao_lado_will(Meninos) :-
    nth1(2, Meninos, menino(branca,_, _, _, _, _)).
    %nextto(menino(branca, _, _, _, _, _), 
          % menino(_, will, _, _, _, _), 
           %Meninos).

forca_ao_lado_de_mochila_vermelha(Meninos) :-
    nextto(menino(_, _, _, 'Jogo da Forca', _, _), menino(vermelha, _, _, _, _, _), Meninos)
    ;
    nextto(menino(vermelha, _, _, _, _, _), menino(_, _, _, 'Jogo da Forca', _, _), Meninos).

quem_gosta_de_matematica_gosta_de_maracuja(Meninos) :-
    member(menino(_, _, _, _, matematica, maracuja), Meninos).  

% O menino que gosta de Matemática nasceu em dezembro.
matematica_dezembro(Meninos) :-
    member(menino(_, _, dezembro, _, matematica, _), Meninos).   

laranja_ultimaposicao_pois_sobrou(Meninos) :-
    nth1(5, Meninos, menino(_, _, _, _, _, laranja)).

geografia_primeiraposicao_pois_sobrou(Meninos) :-
    nth1(1, Meninos, menino(_, _, _, _, geografia, _)).

% O dono da mochila Azul nasceu em janeiro.
azul_com_janeiro(Meninos):-
    member(menino(azul, _, janeiro, _, _, _), Meninos).

% O menino que nasceu no mes de Setembro está ao lado de quem gosta de suco de Laranja.
setembro_ao_lado_de_laranja(Meninos) :-
    nextto(menino(_, _, setembro, _, _, _), menino(_, _, _, _, _, laranja), Meninos)
    ;
    nextto(menino(_, _, _, _, _, laranja), menino(_, _, setembro, _, _, _), Meninos).

% O garoto que nasceu em setembro está ao lado de quem gosta de jogar Cubo Vermelho.
setembro_ao_lado_de_cubovermelho(Meninos) :-
    nextto(menino(_, _, setembro, _, _, _), menino(_, _, _, 'Cubo Vermelho', _, _), Meninos)
    ;
    nextto(menino(_, _, _, 'Cubo Vermelho', _, _), menino(_, _, setembro, _, _, _), Meninos).
  
denis_segundaposicao_pois_sobrou(Meninos) :-
    nth1(2, Meninos, menino(_, denis, _, _, _, _)).

cacapalavras_primeiraposicao_pois_sobrou(Meninos) :-
    nth1(1, Meninos, menino(_, _, _, 'Caça Palavras', _, _)).    

% Quem curte Problemas de Lógica está ao lado do menino da mochila Amarela.
logica_ao_lado_de_amarela(Meninos) :-
    nextto(menino(_, _, _, 'Prob. de Logica', _, _), menino(amarela, _, _, _, _, _), Meninos)
    ;
    nextto(menino(amarela, _, _, _, _, _), menino(_, _, _, 'Prob. de Logica', _, _), Meninos).
    
% O menino que gosta de suco de Uva está em algum lugar à direita do garoto da mochila Azul.
uva_a_direita_de_azul(Meninos) :-
    append(_, [menino(azul, _, _, _, _, _), menino(_, _, _, _, _, uva) | _], Meninos).

% O garoto da mochila Azul está em algum lugar à esquerda de quem nasceu em maio.
azul_a_esquerda_de_maio(Meninos) :-
    nth1(5, Meninos, menino(_, _, maio, _, _, _)).

% O menino que nasceu em janeiro está ao lado de quem nasceu em Setembro.
janeiro_ao_lado_de_setembro(Meninos) :-
    nextto(menino(_, _, janeiro, _, _, _), menino(_, _, setembro, _, _, _), Meninos)
    ;
    nextto(menino(_, _, setembro, _, _, _), menino(_, _, janeiro, _, _, _), Meninos).

verde_primeiraposicao_pois_sobrou(Meninos) :-
    nth1(1, Meninos, menino(verde, _, _, _, _, _)).

agosto_primeiraposicao_pois_sobrou(Meninos) :-
    nth1(1, Meninos, menino(_, _, agosto, _, _, _)).    

% DEFINICAO DE ALLDIFERENT
alldifferent([]).
	alldifferent([H|T]):- 
    not(member(H,T)),
	alldifferent(T).

% Imprimir a lista
imprimir_lista([]).  
imprimir_lista([H|T]) :- 
    writeln(H),  
    imprimir_lista(T).

% Como testar:
% ?- solucao(Meninos).