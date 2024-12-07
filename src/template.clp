(deftemplate Disease
    (slot name) ; 疾病名称
    (multislot symptom-patterns) ; 中医症状模式（如风寒、湿热）
    (multislot affected-body-parts) ; 受影响的身体部位（如头部、消化系统）
    (multislot habits-impact) ; 影响疾病的相关习惯（如熬夜、饮食不规律）
    (multislot pain-levels) ; 疾病相关的疼痛程度（如轻微、中等、严重）
    (multislot recommended-herbs) ; 推荐使用的处方
)

(deftemplate Herb
    (slot name) ; 草药名称
    (multislot targeted-body-parts) ; 草药作用部位（如头部、循环系统）
    (multislot contraindications) ; 禁忌症（不适用的情况）
    (slot function) ; 草药的功能（如补气、清热）
    (slot preparation) ; 使用方法（如煎服、泡茶）
)

(deftemplate Prescription
	(slot name) 
	(multislot herbs-name)
	(multislot amount)
)

(deftemplate Symptom
    (slot body-part (default nil)) ; 症状所在的身体部位（如头部、消化系统）
    (slot user-input (default nil)) ; 用户输入的症状描述（自由文本）
    (slot pain-level (default nil)) ; 疼痛程度（轻微、中等、严重）
    (multislot selected-symptoms (default nil)) ; 用户选择的常见症状（如头痛、胃痛）
)
(deftemplate similarity
	(slot body-part)
	(slot score)
	(slot disease)
)
(deftemplate similarity-basic
	(slot score-basic)
	(slot disease-basic)
)
(deftemplate user-habits
	(multislot habits)
)
(deftemplate Basic-information
    (slot height (default 0)) ; 身高，单位 cm
    (slot weight (default 0)) ; 体重，单位 kg
    (slot long-sit (default 0))
    (slot smoking)
    (slot exercise)
    (slot diet)
    (slot allergic)
    (slot alcohol)
    (slot age (default 0)) ; 年龄
    (slot sleep-hours (default 8)) ; 平均睡眠时长，单位小时
    (slot stay-up (default 0)) ; 是否熬夜（1：是，0：否）
    (slot sleep-pattern (default 0)) ; 夜间睡眠模式（如醒来次数、睡眠时间段）
    (multislot pre-existing-conditions (default nil)) ; 既往病史
)

(deftemplate Match
    (slot disease-name) ; 匹配的疾病名称
    (multislot symptom-matches) ; 匹配到的症状列表
    (multislot recommended-herbs) ; 为匹配的疾病推荐的草药
)
(deftemplate Diagnosis
    (multislot matched-diseases) ; 符合的疾病列表（包含名称和评分）
    (multislot matched-herbs) ; 推荐草药列表
    (slot overall-score (default 0)) ; 综合评分
)

(deftemplate language
	(slot language)
)
(deftemplate DiseaseScore
	(slot disease)
	(slot total-score)
)
(deftemplate HighestDiseaseScore
	(slot disease-highest)
	(slot score-highest)
)


(deftemplate chosen-herb
	(slot herb-name)
	(slot amount)
)

(deftemplate preparation-method
	(slot times-a-day)
	(slot after-meal-or-not)
	(slot preparation)
)


