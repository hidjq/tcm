(deftemplate goal
	(slot name)
	(slot status)
)
(deftemplate goal-hierarchy
	(slot parent)
	(slot child)
)
(assert (goal (name filter-body-parts) (status active)))
(assert (goal (name calculate-similarity) (status nil)))
(assert (goal (name filter-with-basic-info)(status nil)))
(assert (goal (name filter-with-user-input) (status nil)))

(assert (goal-hierarchy (parent calculate-similarity) (child filter-body-parts)))

(defrule activate-parent
	?goal <- (goal (name ?name)(status nil))
	(goal-hierarchy (parent ?parent&:(eq ?parent ?name)) (child ?child))
	(goal (name ?child-name&:(eq ?child-name ?child)) (status complete))
=>
	(modify ?goal (status active))
)
(defrule filter-body-parts
	;?goal <- (goal (name filter-body-parts)(status active))
	(Disease 
		(name ?disease) 
		(affected-body-parts $?affected-body-parts) 
		(symptom-patterns $?symptom-patterns))
	(Symptom 
		(body-part ?body-part) 
		(selected-symptoms 
			$?selected-symptoms&:(neq (length$ ?selected-symptoms) 0)))
	(test(member$ ?body-part $?affected-body-parts))
	(not (Match(disease-name ?disease)))
=>
	(assert 
		(Match(disease-name ?disease)
		(symptom-matches ?symptom-patterns)))
	;(modify ?goal (status complete))
)

(defrule calculate-similarity
	(declare (salience -10))
	;?goal <- (goal (name calculate-similarity)(status active))
	?match <- (Match (disease-name ?disease-name))
	(Disease 
		(name ?disease&:(eq ?disease ?disease-name)) 
		(symptom-patterns $?symptom-patterns)
	)
	?Symptom <- (Symptom 
					(body-part ?body-part)
					(selected-symptoms 
						$?selected-symptoms&:(neq (length$ ?selected-symptoms) 0)))
=>	
	
	(bind ?intersection (intersection$ ?symptom-patterns ?selected-symptoms))
	(bind ?count (length$ ?intersection))
	(assert (similarity (body-part ?body-part)(disease ?disease)(score ?count)))
)
(defrule initialize-disease-score
    (Disease (name ?disease-name)) ; 匹配每一个疾病
    (not (DiseaseScore (disease ?disease-name))) ; 确保还没有初始化分数
    =>
    (assert (DiseaseScore 
    			(disease ?disease-name) 
    			(total-score 0))) ; 初始化总分为 0
)

; 累加与疾病相关的分数
(defrule accumulate-disease-score
    ?sim <- (similarity 
    			(disease ?disease-name) 
    			(score ?score)) ; 匹配每一个 similarity fact
    ?ds <- (DiseaseScore 
    		(disease ?disease-name) 
    		(total-score ?current-score)) ; 获取当前分数
    =>
    (retract ?ds) ; 移除旧的总分 fact
    (assert (DiseaseScore 
    			(disease ?disease-name) 
    			(total-score (+ ?current-score ?score)))) ; 累加分数
    (retract ?sim) ; 可选：如果需要避免重复处理，可以移除已处理的 similarity fact
)

(defrule generate-user-habits
    (Basic-information
        (height ?height&:(> ?height 0)) ; 身高
        (weight ?weight&:(> ?weight 0)) ; 体重
        (diet ?diet) ; 晚餐
        (exercise ?exercise)
        (smoking ?smoking) ; 吸烟情况
        (alcohol ?alcohol) ; 饮酒情况
        (allergic ?allergic) ; 过敏
        (stay-up ?stay-up)
    )
    =>
    ; 计算 BMI 并判断肥胖情况
    (bind ?bmi (/ (* ?weight 10000.0) (* ?height ?height)))
    (bind ?obesity 
        (if (< ?bmi 18.5) then "偏瘦"
        else 
            (if (< ?bmi 24.9) then "正常"
            else 
                (if (< ?bmi 29.9) then "肥胖"
                else "Obese"))))
    
    ; 判断是否缺乏睡眠
    (bind ?lack-in-sleep (if (< ?sleep-hours 7) then "睡眠不足" else "睡眠正常"))
    
    ; 判断营养状况
    (bind ?meals (+ ?breakfast ?lunch ?dinner))
    (bind ?nutrition (if (neq ?meals 3) then "营养不足" else "营养正常"))

    ; 生成 user-habits Fact
    (assert (user-habits
    	(habits ?obesity ?lack-in-sleep ?diet ?smoking ?exercise ?alcohol ?allergic ?stay-up)
    ))
    (printout t "Generated user-habits fact with BMI: " ?bmi crlf)
)


(defrule match-disease-by-habits
	?user <- (user-habits (habits $?user-habits)) ; 获取用户的习惯列表
    ?disease <- (Disease (name ?disease-name) (habits-impact $?disease-habits)) ; 获取疾病的习惯影响列表
    =>
    ; 计算重合的习惯数
    (bind ?matching-habits (intersection$ ?user-habits ?disease-habits))
    (bind ?matching-count (length$ ?matching-habits))
    (assert (similarity-basic (disease-basic ?disease-name)(score-basic ?matching-count)))
    
)


(defrule match-disease-by-habits-2
	?sim <- (similarity-basic (disease-basic ?disease-name) (score-basic ?matching-count)) ; 匹配每一个 similarity fact
	?ds <- (DiseaseScore (disease ?disease-name) (total-score ?current-score)) ; 获取当前分数
    =>
    ; 计算分数贡献并累加
    (bind ?score-contribution (* ?matching-count 0.3))
    (printout t "score-distribution: " ?score-contribution crlf)
    (retract ?ds) ; 移除旧的 DiseaseScore
    (assert (DiseaseScore (disease ?disease-name) 
                          (total-score (+ ?current-score ?score-contribution)))) ; 更新分数
    (retract ?sim)
)




(defrule initialize-highest-score
	(Disease)
	=>
	(assert (HighestDiseaseScore (disease-highest nil) (score-highest -1)))
)

(defrule update-highest-score
    ?ds <- (DiseaseScore (disease ?disease) (total-score ?score)) ; 获取当前疾病分数
    ?highest <- (HighestDiseaseScore (disease-highest ?current-disease) (score-highest ?current-score)) ; 获取当前最高分数
    (test (> ?score ?current-score)) ; 如果当前疾病分数大于最高分数
    =>
    (retract ?highest) ; 移除旧的最高分 fact
    (assert (HighestDiseaseScore (disease-highest ?disease) (score-highest ?score))) ; 更新最高分
)


; Match highest scored disease with its prescription, then herbs
(defrule match-disease-prescription
    (HighestDiseaseScore (disease-highest ?disease))
    (Disease (name ?disease) (recommended-herbs $?prescriptions))
    (Prescription (name ?presc-name&:(member$ ?presc-name $?prescriptions)) 
                 (herbs-name $?herbs)
                 (amount $?amounts))
    =>
    (foreach ?herb $?herbs
        (bind ?idx (member$ ?herb $?herbs))
        (bind ?amt (nth$ ?idx $?amounts))
        (assert (chosen-herb 
            (herb-name ?herb)
            (amount ?amt)))))

; Get preparation method for each chosen herb
(defrule get-herb-preparation
    (chosen-herb (herb-name ?herb-name))
    (Herb (name ?herb-name) (preparation ?prep))
    (not (preparation-method))
    =>
    (assert (preparation-method 
        (times-a-day 2)
        (after-meal-or-not 1)
        (preparation ?prep))))

; Print complete prescription details
(defrule print-prescription-details
    (HighestDiseaseScore (disease-highest ?disease) (score-highest ?score))
    (Disease (name ?disease) (recommended-herbs $?prescriptions))
    (Prescription (name ?presc-name&:(member$ ?presc-name $?prescriptions)) 
                 (herbs-name $?herbs)
                 (amount $?amounts))
    (preparation-method (times-a-day ?times) 
                       (after-meal-or-not ?after) 
                       (preparation ?prep))
    =>
    (printout t "=== Prescription Details ===" crlf)
    (printout t "Disease: " ?disease crlf)
    (printout t "Match Score: " ?score crlf)
    (printout t "Prescription Name: " ?presc-name crlf)
    (printout t crlf "Recommended Herbs:")
    (foreach ?herb $?herbs
        (bind ?idx (member$ ?herb $?herbs))
        (bind ?amt (nth$ ?idx $?amounts))
        (printout t crlf "- " ?herb " " ?amt " grams"))
    (printout t crlf crlf "Usage Instructions:")
    (printout t crlf "- Take " ?times " times per day")
    (if ?after then
        (printout t crlf "- Take after meals")
    else
        (printout t crlf "- Take before meals"))
    (printout t crlf "- Preparation: " ?prep crlf))

    
(defquery get-highest-disease
    ?fact <- (HighestDiseaseScore (disease-highest ?disease-highest) (score-highest ?score-highest)))

(defquery get-chosen-herbs
    (chosen-herb (herb-name ?herb-name) (amount ?amount)))

(defquery get-preparation-method
    (preparation-method (times-a-day ?times-a-day) 
                       (after-meal-or-not ?after-meal-or-not) 
                       (preparation ?preparation)))