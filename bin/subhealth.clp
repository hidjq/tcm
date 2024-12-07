; 修改症状评分模板，添加复选框计数
(deftemplate SymptomScore
    (slot pattern-name)
    (slot total-score (default 0.0))
    (slot primary-count (default 0))
    (slot secondary-count (default 0))
    (slot lifestyle-count (default 0))
    (slot checkbox-count (default 0))  ; 新增复选框计数
)
; 用于防止重复计数的模板
(deftemplate CountedSymptom
    (slot pattern-name)
    (slot symptom-name)
)

; 初始化每个模式的评分
(defrule initialize-scores
    (SubhealthPattern (pattern-name ?name))
    (not (SymptomScore (pattern-name ?name)))
    =>
    (assert (SymptomScore 
        (pattern-name ?name)
        (total-score 0.0)
        (primary-count 0)
        (secondary-count 0)
        (lifestyle-count 0)))
)

; 评估主要症状
(defrule evaluate-primary-symptoms
    ?pattern <- (SubhealthPattern 
                    (pattern-name ?name)
                    (primary-symptoms $?pri-symptoms))
    ?score <- (SymptomScore 
                    (pattern-name ?name)
                    (total-score ?curr-score)
                    (primary-count ?pc))
    ?symptom <- (SubhealthSymptom 
                    (symptom-name ?s&:(member$ ?s ?pri-symptoms))
                    (severity ?sev))
    (not (CountedSymptom (pattern-name ?name) (symptom-name ?s)))
    =>
    (bind ?weight (/ ?sev 10.0))  ; 将严重程度转换为0-1的权重
    (bind ?contribution (* ?weight 0.5))  ; 主要症状权重0.5
    (assert (CountedSymptom (pattern-name ?name) (symptom-name ?s)))
    (modify ?score 
        (total-score (+ ?curr-score ?contribution))
        (primary-count (+ ?pc 1)))
)

; 评估次要症状
(defrule evaluate-secondary-symptoms
    ?pattern <- (SubhealthPattern 
                    (pattern-name ?name)
                    (secondary-symptoms $?sec-symptoms))
    ?score <- (SymptomScore 
                    (pattern-name ?name)
                    (total-score ?curr-score)
                    (secondary-count ?sc))
    ?symptom <- (SubhealthSymptom 
                    (symptom-name ?s&:(member$ ?s ?sec-symptoms))
                    (severity ?sev))
    (not (CountedSymptom (pattern-name ?name) (symptom-name ?s)))
    =>
    (bind ?weight (/ ?sev 10.0))
    (bind ?contribution (* ?weight 0.3))  ; 次要症状权重0.3
    (assert (CountedSymptom (pattern-name ?name) (symptom-name ?s)))
    (modify ?score 
        (total-score (+ ?curr-score ?contribution))
        (secondary-count (+ ?sc 1)))
)

; 评估生活方式因素
(defrule evaluate-lifestyle-factors
    ?pattern <- (SubhealthPattern 
                    (pattern-name ?name)
                    (lifestyle-factors $?lifestyle))
    ?score <- (SymptomScore 
                    (pattern-name ?name)
                    (total-score ?curr-score)
                    (lifestyle-count ?lc))
    ?symptom <- (SubhealthSymptom 
                    (symptom-name ?s&:(member$ ?s ?lifestyle))
                    (severity ?sev))
    (not (CountedSymptom (pattern-name ?name) (symptom-name ?s)))
    =>
    (bind ?weight (/ ?sev 10.0))
    (bind ?contribution (* ?weight 0.2))  ; 生活方式因素权重0.2
    (assert (CountedSymptom (pattern-name ?name) (symptom-name ?s)))
    (modify ?score 
        (total-score (+ ?curr-score ?contribution))
        (lifestyle-count (+ ?lc 1)))
)


; 评估复选框症状
(defrule evaluate-checkbox-symptoms
    ?pattern <- (SubhealthPattern 
                    (pattern-name ?name)
                    (secondary-symptoms $?sec-symptoms))
    ?score <- (SymptomScore 
                    (pattern-name ?name)
                    (total-score ?curr-score)
                    (checkbox-count ?cc))
    ?symptom <- (SubhealthSymptom 
                    (symptom-name ?s&:(str-index "sleep.checkbox" ?s))
                    (severity ?sev))
    (not (CountedSymptom (pattern-name ?name) (symptom-name ?s)))
    =>
    (bind ?contribution 0.15)  ; 复选框症状的固定权重
    (assert (CountedSymptom (pattern-name ?name) (symptom-name ?s)))
    (modify ?score 
        (total-score (+ ?curr-score ?contribution))
        (checkbox-count (+ ?cc 1)))
)

; 修改最终匹配结果生成规则
(defrule generate-pattern-match
    (declare (salience -10))
    ?pattern <- (SubhealthPattern 
                    (pattern-name ?name)
                    (recommended-herbs $?herbs))
    ?score <- (SymptomScore 
                    (pattern-name ?name)
                    (total-score ?total&:(> ?total 0.0))
                    (primary-count ?pc)
                    (secondary-count ?sc)
                    (lifestyle-count ?lc)
                    (checkbox-count ?cc))
    (test (or (> ?pc 0) (> ?sc 0)))  ; 至少要有一个主要或次要症状
    =>
    ; 计算匹配度得分，考虑所有类型的症状
    (bind ?symptom-coverage (/ (+ ?pc ?sc ?lc ?cc) 6.0))  ; 调整分母以包含复选框症状
    (bind ?final-score (* ?total ?symptom-coverage))
    
    (assert (MatchedPattern
        (pattern-name ?name)
        (match-score ?final-score)
        (recommended-herbs $?herbs)))
    (printout t "Pattern: " ?name " Score: " ?final-score 
              " (Primary: " ?pc ", Secondary: " ?sc ", Lifestyle: " ?lc 
              ", Checkbox: " ?cc ")" crlf)
)
; 查询定义
(defquery get-matched-patterns
    "获取所有匹配的亚健康模式"
    ?pattern <- (MatchedPattern 
                    (pattern-name ?name)
                    (match-score ?score)
                    (recommended-herbs $?herbs)))