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
    imprimr_lista(Meninos).

gosta_biologia_e_morango(Meninos) :-
    nth1(3, Meninos, menino(_, _, _, _, biologia, morango)).

otavio_esta_em_uma_das_pontas(Meninos) :-
    Meninos = [Primeiro | _], Primeiro = menino(_, otavio, _, _, _, _);
    last(Meninos, Ultimo), Ultimo = menino(_, otavio, _, _, _, _).

joao_gosta_de_historia(Meninos) :-
    member(menino(_, joao, _, _, historia, _), Meninos).

% Predicado para imprimir a lista
imprimr_lista([]).  
imprimr_lista([H|T]) :- 
    writeln(H),  
    imprimr_lista(T).

% Como testar:
% ?- solucao(Meninos).