(define (ascending? s)
  (cond
    ((null? s) #t)                  ; 空列表是升序
    ((null? (cdr s)) #t)            ; 单个元素的列表是升序
    ((> (car s) (car (cdr s))) #f)  ; 如果前一个比后一个大，返回 False
    (else (ascending? (cdr s)))     ; 否则检查剩下的部分
  )
)

(define (my-filter pred s)
  (cond
    ((null? s) '())  ; 基本情况：空列表
    ((pred (car s)) (cons (car s) (my-filter pred (cdr s)))) ; 满足条件，保留
    (else (my-filter pred (cdr s))) ; 不满足条件，跳过
  )
)

(define (interleave lst1 lst2)
  (if (null? lst1)
      lst2
      (cons (car lst1) (interleave lst2 (cdr lst1))))
)

(define (no-repeats s)
  (if (null? s)
      '()
      (let ((val (car s)))
        (cons val 
              (no-repeats 
                (filter (lambda (x) (not (= x val))) (cdr s)))))
  )
)
