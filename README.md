# Batalha Naval em Lisp
Batalha Naval implementado emLisp.

# A descrição do problema;
Este trabalho trata da criação de uma aplicação, utilizando-se uma linguagem de três propostas de paradigmas diferentes (Funcional, Lógico e Orientado a Aspecto), para este trabalho foi proposto à criação do jogo de tabuleiro “Batalha Naval”. Para solução deste problema foi escolhido a linguagem Lisp de paradigma Funcional.

# O porquê da escolha do paradigma;
Foi escolhido o paradigma funcional para solução deste problema, o jogo Batalha Naval é dado sobre uma matriz 10x10, onde consideramos toda a matriz como uma lista única, assim dentre os outros paradigmas, o funcional da linguagem Lisp foi o que mais se adequou a ideia de criar a matriz em forma de lista, pois o Lisp (List Processing) tem sua estrutura de dados fundamental são representados como listas, assim permitindo fácil manipulação do tabuleiro em forma de lista.

# Este código define o tabuleiro de acordo com a Figura 2.
```
(setf tabuleiro '( 0  0  0  0  0  0  0  11 0  0
                   0  0  0  0  0  0  0  0  0  0
                   0  11 0  0  0  15 0  0  17 17
                   0  0  0  0  0  15 0  0  0  0
                   0  12 0  0  0  15 0  11 0  18
                   0  12 0  14 0  15 0  0  0  18
                   0  0  0  14 0  0  0  0  0  0
                   0  0  14 14 14 0  16 16 16 0
                   0  0  0  0  0  0  0  0  0  0
                   13 13 13 0  0  0  0  11 0  0))
```
Define as linhas e colunas para as coordenadas
```
(setf a 0)
(setf b 1)
(setf c 2)
(setf d 3)
(setf e 4)
(setf f 5)
(setf g 6)
(setf h 7)
(setf i 8)
(setf j 9)
```

Cada objeto possui seu identificador na lista, que são;
- 0 = Água
- 11 = Submarino (Qtde: 4, Espaço: 1)
- 12 = Navio de 2 Canos (Qtde: 1, Espaço: 2)
- 13 = Navio de 3 Canos (Qtde: 1, Espaço: 3)
- 14 = Porta Aviões (Qtde: 1, Espaço: 5)
- 15 = Navio de 4 Canos  (Qtde: 1, Espaço: 4)
- 16 = Navio de 3 Canos (Qtde: 1, Espaço: 3)
- 17 = Navio de 2 Canos (Qtde: 1, Espaço: 2)
- 18 = Navio de 2 Canos (Qtde: 1, Espaço: 2)

*Nota: Quantidade é referente ao Id, que no Id: 11 tem se 4 objetos, os outros são separados por serem compostos de mais de 1 espaço no tabuleiro.*

# Função ATIRAR:
`(defun atirar (letra numero) (setf (nth (+ (* (eval letra) 10) numero) tabuleiro) 9))`

Esta função representa o “tiro” dado na coordenada escolhida pelo jogador, ela troca o valor da coordenada para 9, definindo que já foi jogado “atirado” na coordenada escolhida, como visto no exemplo seguinte.
```
[2]> (coordenada a 1)
0
[3]> (jogar a 1)
"Voce atirou na Agua"
[4]> (coordenada a 1)
9
```

# Função COORDENADA
`(defun coordenada (letra numero) (nth (+ (* (eval letra) 10) numero) tabuleiro))`

Função que retorna o valor da coordenada (como visto no exemplo acima), usado para identificar os objetos que estão nela e verificar se já foi jogada em tal coordenada de acordo com o id retornado.

Contadores
```(setf cont2 0) 
(setf cont3 0) 
(setf cont4 0)
(setf cont5 0)
(setf cont6 0) 
(setf cont7 0) 
(setf cont8 0) 
(setf contAfundado 0) 
(setf contAgua 0)
```

Os contadores são usados para identificar quando um id foi destruído, ou seja, todas as suas posições foram atingidas, o id 1 não tem contador por ter apena uma posição assim quando sua única posição for atingida ele será eliminado e o `contAfundado` será incrementado, cada `cont(n)` conta o número de espaços que seu id ocupa, quando atingir o máximo o seu id é considerado como “afundado” eliminado incrementando o `contAfundado` quando este atingir o valor de 11 elementos “afundados” o jogo será encerrado o e jogador vence. Para o `contAgua` é incrementado todo “tiro” na água ou seja jogadas erradas, o jogador pode errar até 20 vezes, ao atingi-lo 20x o jogo é encerrado com “GAME OVER”, o jogador perde.
Nota: o valor máximo do `contAgua` é definido pelo nivel, este pode ser alterado no código `(setf nivel 20)` deixando assim o jogo mais difícil ou mais fácil.

# Função JOGAR
```(defun jogar (letra numero)
    (if (= contAfundado 11)
        (format nil "CONGRATULATIONS!!! - Parabens voce ganhou!!!")
    (if (= contAgua nivel)
        (format nil "GAME OVER!!! - Voce perdeu jogue novamente.")
    (if (= (coordenada letra numero) 9)
        (format nil "Voce ja atirou aqui.")
    ...
```

Função que recebe uma letra e uma posição `[2]> (jogar a 1)` no código exemplo acima estão as condições regras que definem a vitória pelo número de afundados `contAfundado`, derrota pelo `contAgua` definida pelo nível pelo e verificação de coordenada já jogada “atirado”.

Condição que “afunda” o submarino, id 1, de 1 espaço, verifica a coordenada composto pela função atirar que troca a coordenada para 9 marcando-o como afundado e o `contAfundado` que conta que mais um objeto foi afundado e por final imprimindo a mensagem referente.
```
...
(if (= (- (coordenada letra numero) 10) 1)
    (progn
        (atirar letra numero)                                
        (setf contAfundado (+ contAfundado 1))
        (format nil "Voce afundou um Submarino"))
...
```
Esta condição funciona como a anterior, com ressalto que esta é para objetos de 2 ou mais espaços no tabuleiro, este possui o contador `cont(n)`  para verificar se já foram acertados todas as posições do id n referente, por final imprimindo a mensagem se foi acertado parte ou completamente afundado o objeto.
```
...
(if (= (- (coordenada letra numero) 10) 2)
    (progn
        (atirar letra numero)
        (setf cont2 (+ cont2 1))
            (if (< cont2 2)
                (format nil "Voce acertou uma parte de Navio de....")
                (progn
                    (setf contAfundado (+ contAfundado 1))
                    (format nil "Voce afundou um Navio de 2 Canos"))))
...
```
Caso a jogada não atenda nenhuma das condições de acerto a um objeto, ou seja, “um tiro na água”, então a função atirar marca como já jogado a coordenada, incrementa se o contAgua e imprime a mensagem referente.
```
...
(progn
    (atirar letra numero)
    (setf contAgua (+ contAgua 1))
    (format nil "Voce atirou na Agua"))
...
```

Principal desenvolvimento:
[Jorge Takano Junior](https://github.com/takanoxn)
Colaboradores:
[Anderson Miyada](https://github.com/AndersonMiyada),
[Claudio Roberto Costa](https://github.com/claudiocosta),
[Cristiano Vicente](https://github.com/CristSky)
