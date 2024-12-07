; 模板定义
(deftemplate SymptomCount
    (slot pattern-name)
    (slot primary-count (default 0))
    (slot secondary-count (default 0))
    (slot lifestyle-count (default 0))
)

; 用于防止重复计数的模板
(deftemplate CountedSymptom
    (slot pattern-name)
    (slot symptom-name)
)

; 初始化计数器
(defrule initialize-counter
    (SubhealthPattern (pattern-name ?name))
    (not (SymptomCount (pattern-name ?name)))
    =>
    (printout t "Initializing counter for pattern: " ?name crlf)
    (assert (SymptomCount 
        (pattern-name ?name)
        (primary-count 0)
        (secondary-count 0)
        (lifestyle-count 0)))
)

; 计数主要症状
(defrule count-primary-symptom
    ?pattern <- (SubhealthPattern (pattern-name ?name)
                                 (primary-symptoms $?pri-symptoms))
    ?count <- (SymptomCount (pattern-name ?name)
                           (primary-count ?pc))
    ?symptom <- (SubhealthSymptom (symptom-name ?s&:(member$ ?s ?pri-symptoms))
                                 (severity ?sev&:(> ?sev 6)))
    (not (CountedSymptom (pattern-name ?name) (symptom-name ?s)))
    =>
    (assert (CountedSymptom (pattern-name ?name) (symptom-name ?s)))
    (modify ?count (primary-count (+ ?pc 1)))
    (printout t "Counted primary symptom " ?s " for " ?name crlf)
)

; 计数次要症状
(defrule count-secondary-symptom
    ?pattern <- (SubhealthPattern (pattern-name ?name)
                                 (secondary-symptoms $?sec-symptoms))
    ?count <- (SymptomCount (pattern-name ?name)
                           (secondary-count ?sc))
    ?symptom <- (SubhealthSymptom (symptom-name ?s&:(member$ ?s ?sec-symptoms))
                                 (severity ?sev&:(> ?sev 5)))
    (not (CountedSymptom (pattern-name ?name) (symptom-name ?s)))
    =>
    (assert (CountedSymptom (pattern-name ?name) (symptom-name ?s)))
    (modify ?count (secondary-count (+ ?sc 1)))
    (printout t "Counted secondary symptom " ?s " for " ?name crlf)
)

; 计数生活方式因素
(defrule count-lifestyle-symptom
    ?pattern <- (SubhealthPattern (pattern-name ?name)
                                 (lifestyle-factors $?lifestyle))
    ?count <- (SymptomCount (pattern-name ?name)
                           (lifestyle-count ?lc))
    ?symptom <- (SubhealthSymptom (symptom-name ?s&:(member$ ?s ?lifestyle))
                                 (severity ?sev&:(> ?sev 5)))
    (not (CountedSymptom (pattern-name ?name) (symptom-name ?s)))
    =>
    (assert (CountedSymptom (pattern-name ?name) (symptom-name ?s)))
    (modify ?count (lifestyle-count (+ ?lc 1)))
    (printout t "Counted lifestyle factor " ?s " for " ?name crlf)
)

; 生成匹配结果
(defrule generate-match
    (declare (salience -10))
    ?pattern <- (SubhealthPattern (pattern-name ?name)
                                 (recommended-herbs $?herbs))
    ?count <- (SymptomCount (pattern-name ?name)
                           (primary-count ?pc)
                           (secondary-count ?sc)
                           (lifestyle-count ?lc))
    (test (> (+ ?pc ?sc ?lc) 0))
    (not (MatchedPattern (pattern-name ?name)))
    =>
    (bind ?score (/ (+ (* ?pc 0.5) (* ?sc 0.3) (* ?lc 0.2)) 3.0))
    (printout t "Pattern " ?name " score: " ?score crlf)
    
    (if (> ?score 0.0)
        then
        (assert (MatchedPattern
            (pattern-name ?name)
            (match-score ?score)
            (recommended-herbs $?herbs))))
)


; 生成建议
(defrule generate-prescription
    (declare (salience -20))
    (MatchedPattern (pattern-name ?name)
                    (match-score ?score&:(>= ?score 0.7))
                    (recommended-herbs $?herbs))
    (not (chosen-herb))
    =>
    (printout t "Generating prescription for " ?name crlf)
    (foreach ?herb ?herbs
        (assert (chosen-herb 
            (herb-name ?herb)
            (amount "9g"))))
    
    (assert (preparation-method 
        (times-a-day 2)
        (after-meal-or-not 1)
        (preparation "煎服")))
)

; 查询定义
(defquery get-matched-patterns
    "获取所有匹配的亚健康模式"
    ?pattern <- (MatchedPattern (pattern-name ?name)
                               (match-score ?score)
                               (recommended-herbs $?herbs)))