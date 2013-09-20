;;am folosit Pretty Big 

;;functii pentru testare

(define add10
  (λ (x)
    (+ x 10)))

(define add20
  (λ (x)
    (+ x 20)))

(define add30
  (λ (x)
    (+ x 30)))


(define sub10
  (λ (x)
    (- x 10)))

(define sub20
  (λ (x)
    (- x 20)))

(define sub30
  (λ (x)
    (- x 30)))


(define pow2
  (λ (x)
    (* x x)))

(define pow3
  (λ (x)
    (* x x x)))

(define mul5
  (λ (x)
  (* x 5)))

(define mul10
  (λ (x)
  (* x 10)))

;;f este un symbol cu numele functiei ce va fi evaluata
;;x este numarul intreg si reprezinta argumentul functiei
;;am definit functia de tip curry pentru a putea fi folosita mai usor in functia urmatoare
;;ea practic va face evaluarea unei functii cu argumentul x
(define my-special-eval
  (λ (x)
    (λ (f)
      (eval (read (open-input-string (string-append "(" (symbol->string f) " " (number->string x) ")")))))))


;;x este numarul intreg pe care vom aplica setul de functii
;;L este lista de functii(ea poate avea orice lungime)
;;folosind directiva map voi aplica my-special-eval pe fiecare functie din lista
(define my-solution
  (λ (x L)
    (map (my-special-eval x) L)))


;;Testing...
(my-solution 100 '(add10 sub20 mul5))
(my-solution 100 '(add10 sub30 pow2 pow3 mul5 add20))
(my-solution 100 '(mul10))
(my-solution 100 '(add30 mul10))
(my-solution 100 '(add20 sub30 mul10 mul5 sub20 add10 pow2 sub10 pow3))


