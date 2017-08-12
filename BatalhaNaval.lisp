;Anderson Miyada
;Claudio Roberto Costa
;Cristiano Vicente
;Jorge Takano Jr.
;
;Trabalho P.O.
;Prof. Rodolfo Chiaramonte



;Define o tabuleiro
(setf tabuleiro '( 0  0  0  0  0  0  0 11  0  0
                   0  0  0  0  0  0  0  0  0  0
                   0 11  0  0  0 15  0  0 17 17
                   0  0  0  0  0 15  0  0  0  0
                   0 12  0  0  0 15  0 11  0 18
                   0 12  0 14  0 15  0  0  0 18
                   0  0  0 14  0  0  0  0  0  0
                   0  0 14 14 14  0 16 16 16  0
                   0  0  0  0  0  0  0  0  0  0
                  13 13 13  0  0  0  0 11  0  0))
                  

;Define as letras para as linhas da coordenada
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

;Define os contadores
(setf cont2 0) 
(setf cont3 0) 
(setf cont4 0)
(setf cont5 0)
(setf cont6 0) 
(setf cont7 0)
(setf cont8 0)
(setf contAfundado 0)
(setf contAgua 0)
(setf nivel 20) ; Nivel = número de vezes que pode se acertar a água antes de perder

;Deine a função para trocar o valor da coordenada para 9 indicando que ja foi atirado nesse local
(defun atirar (letra numero) (setf (nth (+ (* (eval letra) 10) numero) tabuleiro) 9))

;Define a função para verificar o valor da coordenada
(defun coordenada (letra numero) (nth (+ (* (eval letra) 10) numero) tabuleiro))

;Define a função para jogar
(defun jogar (letra numero) (if (= contAfundado 11) ; CONDIÇÃO - se todos os 11 objetos foram afundados, mostra mensagem de vitória
    (format nil "CONGRATULATIONS!!! - Parabens voce ganhou!!!")
    
    (if (= contAgua nivel) ; CONDIÇÃO - se o contAgua atingir o número de vezes que acertou a água, mostra mensagem de derrota
        (format nil "GAME OVER!!! - Voce perdeu jogue novamente.")
        
        (if (= (coordenada letra numero) 9) ; CONDIÇÃO - traz o valor da coordenada, se = 9, mostra mensagem
            (format nil "Voce ja atirou aqui.")
            
            (if (= (- (coordenada letra numero) 10) 1) ; CONDIÇÃO - traz o valor da coordenada, se = 1, atira no id 11, contAfundado e mostra mensagem
                (progn
                    (atirar letra numero)                                
                    (setf contAfundado (+ contAfundado 1))
                    (format nil "Voce afundou um Submarino"))
                    
                (if (= (- (coordenada letra numero) 10) 2) ; CONDIÇÃO - traz o valor da coordenada, se = 2, atira no id 12 e cont(N)
                    (progn
                        (atirar letra numero)
                        (setf cont2 (+ cont2 1))
                        (if (< cont2 2) ; CONDIÇÃO - se cont(N) < número de partes, mensagem de acerto, se não, afundado (contAfundado)
                            (format nil "Voce acertou uma parte de Navio de 2 Canos")
                            (progn
                                (setf contAfundado (+ contAfundado 1))
                                (format nil "Voce afundou um Navio de 2 Canos")))) 
                                
                    (if (= (- (coordenada letra numero) 10) 3) ; CONDIÇÃO - traz o valor da coordenada, se = 3, atira no id 13 e cont(N)
                        (progn
                        (atirar letra numero) 
                            (setf cont3 (+ cont3 1))
                            (if (< cont3 3) ; CONDIÇÃO - se cont(N) < número de partes, mensagem de acerto, se não, afundado (contAfundado)
                                (format nil "Voce acertou uma parte de Navio de 3 Canos")
                                (progn
                                    (setf contAfundado (+ contAfundado 1))
                                    (format nil "Voce afundou um Navio de 3 Canos"))))
                                    
                        (if (= (- (coordenada letra numero) 10) 4) ; CONDIÇÃO - traz o valor da coordenada, se = 4, atira no id 14 e cont(N)
                            (progn
                            (atirar letra numero) 
                                (setf cont4 (+ cont4 1))
                                (if (< cont4 5) ; CONDIÇÃO - se cont(N) < número de partes, mensagem de acerto, se não, afundado (contAfundado)
                                    (format nil "Voce acertou uma parte de Porta Avioes")
                                    (progn
                                        (setf contAfundado (+ contAfundado 1))
                                        (format nil "Voce afundou um Porta Avioes"))))
                                        
                            (if (= (- (coordenada letra numero) 10) 5) ; CONDIÇÃO - traz o valor da coordenada, se = 5, atira no id 15 e cont(N)
                                (progn
                                    (atirar letra numero)
                                    (setf cont5 (+ cont5 1))
                                    (if (< cont5 4) ; CONDIÇÃO - se cont(N) < número de partes, mensagem de acerto, se não, afundado (contAfundado)
                                        (format nil "Voce acertou uma parte de Navio de 4 Canos")
                                        (progn
                                            (setf contAfundado (+ contAfundado 1))
                                            (format nil "Voce afundou um Navio de 4 Canos"))))
                                            
                                (if (= (- (coordenada letra numero) 10) 6) ; CONDIÇÃO - traz o valor da coordenada, se = 6, atira no id 16 e cont(N)
                                    (progn
                                        (atirar letra numero)
                                        (setf cont6 (+ cont6 1))
                                        (if (< cont6 3) ; CONDIÇÃO - se cont(N) < número de partes, mensagem de acerto, se não, afundado (contAfundado)
                                            (format nil "Voce acertou uma parte de Navio de 3 Canos")
                                            (progn
                                                (setf contAfundado (+ contAfundado 1))
                                                (format nil "Voce afundou um Navio de 3 Canos"))))
                                                
                                    (if (= (- (coordenada letra numero) 10) 7) ; CONDIÇÃO - traz o valor da coordenada, se = 7, atira no id 17 e cont(N)
                                        (progn 
                                            (atirar letra numero)
                                            (setf cont7 (+ cont7 1))
                                            (if (< cont7 2) ; CONDIÇÃO - se cont(N) < número de partes, mensagem de acerto, se não, afundado (contAfundado)
                                                (format nil "Voce acertou uma parte de Navio de 2 Canos")
                                                (progn
                                                    (setf contAfundado (+ contAfundado 1))
                                                    (format nil "Voce afundou um Navio de 2 Canos"))))
                                                    
                                        (if (= (- (coordenada letra numero) 10) 8) ; CONDIÇÃO - traz o valor da coordenada, se = 8, atira no id 18 e cont(N)
                                            (progn 
                                                (atirar letra numero)
                                                (setf cont8 (+ cont8 1))
                                                (if (< cont8 2) ; CONDIÇÃO - se cont(N) < número de partes, mensagem de acerto, se não, afundado (contAfundado)
                                                    (format nil "Voce acertou uma parte de Navio de 2 Canos")
                                                    (progn
                                                        (setf contAfundado (+ contAfundado 1))
                                                        (format nil "Voce afundou um Navio de 2 Canos"))))  
                                                        
                                            (progn ; CONDIÇÃO - caso a coordenada for 0, tiro na água, contAgua e mostra mensagem
												(atirar letra numero)
                                                (setf contAgua (+ contAgua 1))
                                                (format nil "Voce atirou na Agua")))))))))))))))
                 
                                                                            
; Cógido completo Batalha Naval, igual ao de cima sem comentários, CTRL+C/V para execução
(when t
    (setf tabuleiro '(0 0 0 0 0 0 0 11 0 0 0 0 0 0 0 0 0 0 0 0 0 11 0 0 0 15 0 0 17 17 0 0 0 0 0 15 0 0 0 0 0 12 0 0 0 15 0 11 0 18 0 
                      12 0 14 0 15 0 0 0 18 0 0 0 14 0 0 0 0 0 0 0 0 14 14 14 0 16 16 16 0 0 0 0 0 0 0 0 0 0 0 13 13 13 0 0 0 0 11 0 0))
    (setf a 0) (setf b 1) (setf c 2) (setf d 3) (setf e 4) (setf f 5) (setf g 6) (setf h 7) (setf i 8) (setf j 9) (setf nivel 20)
    (setf cont2 0) (setf cont3 0) (setf cont4 0) (setf cont5 0) (setf cont6 0) (setf cont7 0) (setf cont8 0) (setf contAfundado 0) (setf contAgua 0) 
    (defun coordenada (letra numero) (nth (+ (* (eval letra) 10) numero) tabuleiro))
    (defun atirar (letra numero) (setf (nth (+ (* (eval letra) 10) numero) tabuleiro) 9))
    (defun jogar (letra numero) (if (= contAfundado 11)
                                    (format nil "CONGRATULATIONS!!! - Parabens voce ganhou!!!")
                                    (if (= contAgua nivel)
                                        (format nil "GAME OVER!!! - Voce perdeu jogue novamente.")
                                        (if (= (coordenada letra numero) 9)
                                            (format nil "Voce ja atirou aqui.")
                                            (if (= (- (coordenada letra numero) 10) 1)
                                                (progn
                                                    (atirar letra numero)                                
                                                    (setf contAfundado (+ contAfundado 1))
                                                    (format nil "Voce afundou um Submarino"))
                                                (if (= (- (coordenada letra numero) 10) 2)
                                                    (progn
                                                        (atirar letra numero)
                                                        (setf cont2 (+ cont2 1))
                                                        (if (< cont2 2)
                                                            (format nil "Voce acertou uma parte de Navio de 2 Canos")
                                                            (progn
                                                                (setf contAfundado (+ contAfundado 1))
                                                                (format nil "Voce afundou um Navio de 2 Canos")))) 
                                                    (if (= (- (coordenada letra numero) 10) 3)
                                                        (progn
                                                        (atirar letra numero) 
                                                            (setf cont3 (+ cont3 1))
                                                            (if (< cont3 3)
                                                                (format nil "Voce acertou uma parte de Navio de 3 Canos")
                                                                (progn
                                                                    (setf contAfundado (+ contAfundado 1))
                                                                    (format nil "Voce afundou um Navio de 3 Canos"))))
                                                        (if (= (- (coordenada letra numero) 10) 4)    
                                                            (progn
                                                            (atirar letra numero) 
                                                                (setf cont4 (+ cont4 1))
                                                                (if (< cont4 5)
                                                                    (format nil "Voce acertou uma parte de Porta Avioes")
                                                                    (progn
                                                                        (setf contAfundado (+ contAfundado 1))
                                                                        (format nil "Voce afundou um Porta Avioes"))))
                                                            (if (= (- (coordenada letra numero) 10) 5)
                                                                (progn
                                                                    (atirar letra numero)
                                                                    (setf cont5 (+ cont5 1))
                                                                    (if (< cont5 4)
                                                                        (format nil "Voce acertou uma parte de Navio de 4 Canos")
                                                                        (progn
                                                                            (setf contAfundado (+ contAfundado 1))
                                                                            (format nil "Voce afundou um Navio de 4 Canos"))))
                                                                (if (= (- (coordenada letra numero) 10) 6)
                                                                    (progn
                                                                        (atirar letra numero)
                                                                        (setf cont6 (+ cont6 1))
                                                                        (if (< cont6 3)
                                                                            (format nil "Voce acertou uma parte de Navio de 3 Canos")
                                                                            (progn
                                                                                (setf contAfundado (+ contAfundado 1))
                                                                                (format nil "Voce afundou um Navio de 3 Canos"))))
                                                                    (if (= (- (coordenada letra numero) 10) 7)
                                                                        (progn 
                                                                            (atirar letra numero)
                                                                            (setf cont7 (+ cont7 1))
                                                                            (if (< cont7 2)
                                                                                (format nil "Voce acertou uma parte de Navio de 2 Canos")
                                                                                (progn
                                                                                    (setf contAfundado (+ contAfundado 1))
                                                                                    (format nil "Voce afundou um Navio de 2 Canos"))))
                                                                        (if (= (- (coordenada letra numero) 10) 8)
                                                                            (progn 
                                                                                (atirar letra numero)
                                                                                (setf cont8 (+ cont8 1))
                                                                                (if (< cont8 2)
                                                                                    (format nil "Voce acertou uma parte de Navio de 2 Canos")
                                                                                    (progn
                                                                                        (setf contAfundado (+ contAfundado 1))
                                                                                        (format nil "Voce afundou um Navio de 2 Canos"))))  
                                                                            (progn
																				(atirar letra numero)
                                                                                (setf contAgua (+ contAgua 1))
                                                                                (format nil "Voce atirou na Agua")))))))))))))))                                                                     

