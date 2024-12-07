; 气虚证
(assert (SubhealthPattern 
    (pattern-name "气虚证")
    (primary-symptoms 
        "fatigue.physical"    ; 体力疲劳
        "physical.shortness"  ; 气短乏力
    )
    (secondary-symptoms 
        "fatigue.mental"      ; 精神疲惫
        "physical.coldHands"  ; 手脚不温
        "physical.digestion"  ; 消化不良
        "sleep.checkbox.dream"     ; 多梦
        "sleep.checkbox.irregular" ; 作息不规律
    )
    (lifestyle-factors 
        "lifestyle.exercise.low"  ; 运动不足
        "lifestyle.work.high"     ; 工作压力大
    )
    (recommended-herbs "黄芪" "党参" "白术" "当归")
    (description "气虚导致的全身乏力，气短懒言，精神疲惫")
))

; 阳虚证
(assert (SubhealthPattern 
    (pattern-name "阳虚证")
    (primary-symptoms 
        "physical.coldHands"  ; 手足发冷
        "physical.coldness"   ; 畏寒怕冷
    )
    (secondary-symptoms 
        "physical.fatigue"    ; 疲劳
        "sleep.quality"       ; 睡眠质量差
        "physical.digestion"  ; 消化功能差
        "sleep.checkbox.dream" ; 多梦
    )
    (lifestyle-factors 
        "lifestyle.exercise.low"  ; 缺乏运动
        "lifestyle.diet.poor"     ; 饮食不规律
    )
    (recommended-herbs "肉桂" "干姜" "附子" "党参")
    (description "阳气不足导致的畏寒肢冷，精神疲惫")
))

; 肝气郁结
(assert (SubhealthPattern 
    (pattern-name "肝气郁结")
    (primary-symptoms 
        "mood.anxiety"       ; 焦虑
        "mood.irritability"  ; 易怒
    )
    (secondary-symptoms 
        "sleep.difficulty"   ; 入睡困难
        "physical.digestion" ; 消化不适
        "sleep.checkbox.irregular" ; 作息不规律
        "sleep.checkbox.dream"     ; 多梦
    )
    (lifestyle-factors 
        "lifestyle.work.high"    ; 工作压力大
        "lifestyle.stress.high"  ; 压力大
    )
    (recommended-herbs "柴胡" "香附" "白芍" "甘草")
    (description "情志不畅导致的烦躁易怒，失眠多梦")
))

; 心脾两虚
(assert (SubhealthPattern 
    (pattern-name "心脾两虚")
    (primary-symptoms 
        "fatigue.mental"     ; 精神疲惫
        "mood.anxiety"       ; 焦虑不安
    )
    (secondary-symptoms 
        "sleep.quality"       ; 睡眠质量差
        "physical.digestion"  ; 消化不良
        "fatigue.physical"    ; 体力不支
        "sleep.checkbox.dream"     ; 多梦
        "sleep.checkbox.irregular" ; 作息不规律
    )
    (lifestyle-factors 
        "lifestyle.diet.poor"   ; 饮食不规律
        "lifestyle.work.high"   ; 工作压力大
    )
    (recommended-herbs "党参" "黄芪" "甘草" "当归" "茯苓")
    (description "心神不宁，脾失健运，倦怠乏力")
))

; 痰湿证
(assert (SubhealthPattern 
    (pattern-name "痰湿证")
    (primary-symptoms 
        "physical.digestion"   ; 消化不良
        "fatigue.physical"     ; 体力疲乏
    )
    (secondary-symptoms 
        "physical.heaviness"   ; 身重困倦
        "mood.foggy"          ; 精神恍惚
        "sleep.checkbox.snore" ; 打鼾
    )
    (lifestyle-factors 
        "lifestyle.diet.poor"    ; 饮食不规律
        "lifestyle.exercise.low" ; 运动不足
    )
    (recommended-herbs "半夏" "陈皮" "茯苓" "甘草")
    (description "痰湿内阻导致的胸闷困重，倦怠嗜睡")
))

; 血虚证
(assert (SubhealthPattern 
    (pattern-name "血虚证")
    (primary-symptoms 
        "fatigue.physical"    ; 体力疲乏
        "mood.depression"     ; 情绪低落
    )
    (secondary-symptoms 
        "sleep.difficulty"    ; 入睡困难
        "physical.dizziness"  ; 头晕目眩
        "sleep.checkbox.dream" ; 多梦
    )
    (lifestyle-factors 
        "lifestyle.diet.poor"  ; 饮食不规律
    )
    (recommended-herbs "当归" "白芍" "熟地黄" "川芎")
    (description "血虚导致的头晕目眩，面色萎黄，失眠多梦")
))

; 阴虚证
(assert (SubhealthPattern 
    (pattern-name "阴虚证")
    (primary-symptoms 
        "physical.dryness"    ; 口干咽燥
        "fatigue.physical"    ; 体力疲乏
    )
    (secondary-symptoms 
        "sleep.quality"       ; 睡眠质量差
        "mood.anxiety"        ; 焦虑不安
        "sleep.checkbox.dream" ; 多梦
    )
    (lifestyle-factors 
        "lifestyle.work.high"   ; 工作压力大
    )
    (recommended-herbs "麦冬" "玄参" "沙参" "生地黄")
    (description "阴虚导致的口干咽燥，心烦失眠")
))

; 脾胃虚弱
(assert (SubhealthPattern 
    (pattern-name "脾胃虚弱")
    (primary-symptoms 
        "physical.digestion"   ; 消化不良
        "fatigue.mental"       ; 精神疲惫
    )
    (secondary-symptoms 
        "fatigue.physical"     ; 体力不支
        "physical.appetite"    ; 食欲不振
        "sleep.checkbox.irregular" ; 作息不规律
    )
    (lifestyle-factors 
        "lifestyle.diet.poor"    ; 饮食不规律
        "lifestyle.work.high"    ; 工作压力大
    )
    (recommended-herbs "党参" "白术" "茯苓" "甘草")
    (description "脾胃功能减退，消化吸收不良，疲倦乏力")
))

; 肝郁脾虚
(assert (SubhealthPattern 
    (pattern-name "肝郁脾虚")
    (primary-symptoms 
        "mood.anxiety"         ; 情志不畅
        "physical.digestion"   ; 消化不良
    )
    (secondary-symptoms 
        "fatigue.physical"     ; 体力疲乏
        "sleep.quality"        ; 睡眠质量差
        "sleep.checkbox.irregular" ; 作息不规律
        "sleep.checkbox.dream"     ; 多梦
    )
    (lifestyle-factors 
        "lifestyle.work.high"    ; 工作压力大
        "lifestyle.diet.poor"    ; 饮食不规律
    )
    (recommended-herbs "柴胡" "白芍" "党参" "白术")
    (description "肝郁脾虚导致的情志抑郁，消化不良，失眠多梦")
))