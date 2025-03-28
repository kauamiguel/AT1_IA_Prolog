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

% Posicoes que já sabemos:
    % Na terceira posição está quem gosta de suco de Morango.
    % Lenin está na quinta posição.
    % Na primeira posição está quem gosta de suco de Limão.
    % Na terceira posição está o menino que gosta DO Jogo da Forca
solucao(Meninos) :-
    Meninos = [
        menino(Mochila1, Nome1, Mes1, Jogo1, Materia1, limao),    
        menino(Mochila2, Nome2, Mes2, Jogo2, Materia2, Suco2),
        menino(Mochila3, Nome3, Mes3, 'Jogo da Forca', Materia3, morango),  
        menino(Mochila4, Nome4, Mes4, Jogo4, Materia4, Suco4),
        menino(Mochila5, lenin, Mes5, Jogo5, Materia5, Suco5)     
    ],
    gosta_biologia_e_morango(Meninos),
    otavio_esta_em_uma_das_pontas(Meninos),
    uva_a_esquerda_de_portugues(Meninos),
    gosta_logica_e_uva(Meninos),
    treoumais_esta_ao_lado_problogica(Meninos),
    will_ao_lado_de_logicaproblemas(Meninos),
    mochilabranca_esta_ao_lado_will(Meninos),
    forca_ao_lado_de_mochila_vermelha(Meninos),
    % matematica_gosta_de_maracuja(Meninos),
    imprimr_lista(Meninos).

gosta_biologia_e_morango(Meninos) :-
    nth1(3, Meninos, menino(_, _, _, _, biologia, morango)).

otavio_esta_em_uma_das_pontas(Meninos) :-
    Meninos = [Primeiro | _], Primeiro = menino(_, otavio, _, _, _, _);
    last(Meninos, Ultimo), Ultimo = menino(_, otavio, _, _, _, _).

joao_gosta_de_historia(Meninos) :-
    member(menino(_, joao, _, _, historia, _), Meninos).

cubovermelho_esta_em_uma_das_pontas(Meninos) :-
    Meninos = [Primeiro | _], Primeiro = menino(_, _, _, 'Cubo Vermelho', _, _);
    last(Meninos, Ultimo), Ultimo = menino(_, _, _,'Cubo Vermelho', _, _).

uva_a_esquerda_de_portugues(Meninos) :-
    append(Left, [menino(_, _, _, _, _, uva), menino(_, _, _, _, portugues, _) | Right], Meninos).

gosta_logica_e_uva(Meninos) :-
     nth1(4, Meninos, menino(_, _, _, 'Prob. de Logica', _, uva)).

treoumais_esta_ao_lado_problogica(Meninos) :-
    nth1(2, Meninos, menino(_, _, _, '3 ou Mais', _, _)).

will_ao_lado_de_logicaproblemas(Meninos) :-
    nextto(menino(_, will, _, _, _, _), 
           menino(_, _, _, 'Prob. de Logica', _, _), 
           Meninos);
    nextto(menino(_, _, _, 'Prob. de Logica', _, _), 
           menino(_, will, _, _, _, _), 
           Meninos).    

mochilabranca_esta_ao_lado_will(Meninos) :-
    nth1(2, Meninos, menino(branca,_, _, _, _, _)).

forca_ao_lado_de_mochila_vermelha(Meninos) :-
    nextto(menino(_, _, _, 'Jogo da Forca', _, _), menino(vermelha, _, _, _, _, _), Meninos)
    ;
    nextto(menino(vermelha, _, _, _, _, _), menino(_, _, _, 'Jogo da Forca', _, _), Meninos).

matematica_gosta_de_maracuja(Meninos) :-
    member(menino(maracuja, _, _, _, matematica, _), Meninos). 

matematica_dezembro(Meninos) :-
    member(menino(_, _, dezembro, _, matematica, _), Meninos).     

% Predicado para imprimir a lista
imprimr_lista([]).  
imprimr_lista([H|T]) :- 
    writeln(H),  
    imprimr_lista(T).

% Como testar:
% ?- solucao(Meninos).