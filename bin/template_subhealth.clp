(deftemplate SubhealthSymptom
    (slot category (type STRING)) ; fatigue, sleep, mood, physical, or lifestyle
    (slot symptom-name (type STRING))
    (slot severity (type INTEGER)) ; 0-10 scale from slider
)

(deftemplate SubhealthAssessment
    (slot category (type STRING))
    (slot total-score (type FLOAT))
    (multislot detected-patterns)
)

(deftemplate SubhealthPattern
    (slot pattern-name (type STRING))
    (slot confidence-score (type FLOAT))
    (multislot primary-symptoms)     ; 主要症状
    (multislot secondary-symptoms)   ; 次要症状
    (multislot lifestyle-factors)    ; 生活因素
    (multislot recommended-herbs)    ; 推荐草药
    (slot description (type STRING)) ; 模式描述
)

(deftemplate MatchedPattern
    (slot pattern-name (type STRING))
    (slot match-score (type FLOAT))
    (multislot matched-symptoms)
    (multislot recommended-herbs)
)