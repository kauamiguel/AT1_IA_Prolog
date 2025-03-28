allDifferent([]).
allDifferent([H|T]) :- not(member(H,T)), allDifferent(T).

printList([]) :- write('\nEND.\n').
printList([H|T]) :- write('\n...\n'), write(H), printList(T).

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

jogo(tresoumais).
jogo(cacapalavras).
jogo(cubovermelho).
jogo(jogodaforca).
jogo(logica).

materia(biologia).
materia(geografia).
materia(historia).
materia(matematica).
materia(portugues).

suco(laranja).
suco(limao).
suco(maracuja).
suco(uva).
suco(morango).

mochila(azul).
mochila(amarela).
mochila(branca).
mochila(verde).
mochila(vermelha).

is_to_the_right(B, A, List) :-
    append(_, [A, B | _], List).

is_to_the_left(B, A, List) :-
    append(_, [B | Rest], List),
    member(A, Rest).

is_on_side(A, B, List) :-
    append(_, [A, B | _], List).
is_on_side(A, B, List) :-
    append(_, [B, A | _], List).

is_first_or_last(A, List) :-
    List = [A | _].
is_first_or_last(A, List) :-
    append(_, [A], List).

is_exactly_on_left(X, Y, List) :-
    append(Left, [X, Y | Right], List),
    \+ append(_, [X | _], Left),
    \+ append(_, [Y | _], Right).

model(Meninos) :-
    Meninos = [
        (Mochila_1, Nome_1, Mes_1, Jogo_1, Materia_1, Suco_1),
        (Mochila_2, Nome_2, Mes_2, Jogo_2, Materia_2, Suco_2),
        (Mochila_3, Nome_3, Mes_3, Jogo_3, Materia_3, Suco_3),
        (Mochila_4, Nome_4, Mes_4, Jogo_4, Materia_4, Suco_4),
        (Mochila_5, Nome_5, Mes_5, Jogo_5, Materia_5, Suco_5) ],

    	allDifferent([Mochila_1, Mochila_2, Mochila_3, Mochila_4, Mochila_5]),
     	mochila(Mochila_1), mochila(Mochila_2), mochila(Mochila_3), mochila(Mochila_4), mochila(Mochila_5),

    	allDifferent([Nome_1, Nome_2, Nome_3, Nome_4, Nome_5]),
    	nome(Nome_1), nome(Nome_2), nome(Nome_3), nome(Nome_4), nome(Nome_5),

    	allDifferent([Mes_1, Mes_2, Mes_3, Mes_4, Mes_5]),
    	mes(Mes_1), mes(Mes_2), mes(Mes_3), mes(Mes_4), mes(Mes_5),

    	allDifferent([Jogo_1, Jogo_2, Jogo_3, Jogo_4, Jogo_5]),
    	jogo(Jogo_1), jogo(Jogo_2), jogo(Jogo_3), jogo(Jogo_4), jogo(Jogo_5),

    	allDifferent([Materia_1, Materia_2, Materia_3, Materia_4, Materia_5]),
    	materia(Materia_1), materia(Materia_2), materia(Materia_3), materia(Materia_4), materia(Materia_5),

    	allDifferent([Suco_1, Suco_2, Suco_3, Suco_4, Suco_5]),
    	suco(Suco_1), suco(Suco_2), suco(Suco_3), suco(Suco_4), suco(Suco_5),

        (Suco_1 = limao), % Na primeira posição está quem gosta de suco de Limão.
        (Nome_1 = otavio), % Otávio está em uma das pontas.
        (Jogo_3 = jogodaforca), % Na terceira posição está o menino que gosta do Jogo da Forca.
        (Suco_3 = morango), % Na terceira posição está quem gosta de suco de Morango.
    	(Materia_3 = biologia), % O garoto que gosta de Biologia gosta de suco de Morango.
		(Suco_4 = uva), % Quem gosta de suco de Uva está exatamente à esquerda de quem gosta de Português.
        (Materia_5 = portugues), %  ^^^^
        (Nome_5 = lenin), % Lenin está na quinta posição.

    	% João gosta de história.
        (
            member((_,joao,_,_,historia,_), M)
        ),

    	% O menino que gosta de Matemática nasceu em dezembro.
        (
            member((_,_,dezembro,_,matematica,_), M)
        ),

    	% O dono da mochila Azul nasceu em janeiro.
        (
            member((azul,_,janeiro,_,_,_), M)
        ),

    	 % Quem gosta de Matemática gosta também de suco de Maracujá.
        (
            member((_,_,_,_,matematica,maracuja), M)
        ),

    	% Em uma das pontas está o menino que adora jogar Cubo Vermelho.
        (
        	is_first_or_last((_,_,_,cubovermelho,_,_), Meninos)
        ),

    	% O garoto que nasceu em setembro está ao lado de quem gosta de jogar Cubo Vermelho.
        (
        	is_on_side((_,_,setembro,_,_,_), (_,_,_,_,cubovermelho,_), Meninos)
        ),

    	 % O garoto que gosta do Jogo da Forca está ao lado do que gosta do 3 ou Mais.
        (
        	is_on_side((_,_,_,tresoumais,_,_),(_,_,_,jogodaforca,_,_), Meninos)
        ),

    	% Quem gosta do Jogo da Forca está ao lado do dono da mochila Vermelha
        (
        	is_on_side((_,_,_,jogodaforca,_,_),(vermelha,_,_,jogodaforca,_,_), Meninos)
        ),

    	% O menino que nasceu no mês de Setembro está ao lado de quem gosta de suco de Laranja.
        (
        	is_on_side((_,_,setembro,_,_,_),(_,_,_,_,_,laranja), Meninos)
        ),

    	% O garoto da mochila Azul está em algum lugar à esquerda de quem nasceu em maio.
        (
        	is_to_the_left((azul,_,setembro,_,_,_),(_,_,maio,_,_,_), Meninos)
        ),

    	% Will está ao lado do menino que gosta de Problemas de Lógica.
        (
        	is_on_side((_,will,_,_,_,_),(_,_,_,logica,_,_), Meninos)
        ),

    	% Quem gosta de suco de Uva gosta de Problemas de Lógica.
        (
        	member((_,_,_,logica,_,uva), Meninos)
        ),

    	% O garoto da mochila Branca está exatamente à esquerda de Will.
        (
        	is_exactly_on_left((branca,_,_,_,_,_),(_,will,_,_,_,_), Meninos)
        ),

    	% O menino que gosta de suco de Uva está em algum lugar à direita do garoto da mochila Azul.
        (
        	is_to_the_right((_,_,_,_,_,uva),(azul,_,_,_,_,_),Meninos)
        ),

    	% O menino que nasceu em janeiro está ao lado de quem nasceu em Setembro.
        (
        	is_on_side((_,_,janeiro,_,_,_),(_,_,setembro,_,_,_), Meninos)
        ),

    	% Quem curte Problemas de Lógica está ao lado do menino da mochila Amarela.
        (
        	is_on_side((_,_,_,logica,_,_),(amarela,_,_,_,_,_), Meninos)
        ).
main :-
    model(M), printList(M).
