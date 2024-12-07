; 1. Common Cold (Wind-Cold)
(assert (Disease
    (name "风寒感冒")
    (symptom-patterns "头痛" "鼻塞" "畏寒" "咳嗽")
    (affected-body-parts "头部和面部" "呼吸系统")
    (habits-impact "熬夜" "着凉")
    (pain-levels "轻微")
    (recommended-herbs "荆防败毒散")
))

; 2. Common Cold (Wind-Heat)
(assert (Disease
    (name "风热感冒")
    (symptom-patterns "咽喉疼痛" "发热" "咳嗽" "咽干")
    (affected-body-parts "头部和面部" "呼吸系统")
    (habits-impact "饮食辛辣" "睡眠不足")
    (pain-levels "轻微")
    (recommended-herbs "银翘散" "葱豉桔梗汤")
))

; 3. Summer Heat Common Cold
(assert (Disease
    (name "暑湿感冒")
    (symptom-patterns "发热" "胸闷" "乏力" "多汗")
    (affected-body-parts "头部和面部" "呼吸系统")
    (habits-impact "高温天气" "湿热环境")
    (pain-levels "轻微")
    (recommended-herbs "新家香薷饮")
))

; 4. Chronic Gastritis
(assert (Disease
    (name "慢性胃炎")
    (symptom-patterns "胃痛" "嗳气" "腹胀" "恶心")
    (affected-body-parts "消化系统")
    (habits-impact "饮食不规律" "暴饮暴食")
    (pain-levels "轻微" "中等")
    (recommended-herbs "柴胡疏肝散")
))

; 5. Gastric Ulcer
(assert (Disease
    (name "胃溃疡")
    (symptom-patterns "胃痛" "反酸" "呕吐" "食欲下降")
    (affected-body-parts "消化系统")
    (habits-impact "过度饮酒" "精神压力大")
    (pain-levels "中等" "严重")
    (recommended-herbs "四君子汤")
))

; 6. Hypertension
(assert (Disease
    (name "高血压")
    (symptom-patterns "头痛" "眩晕" "耳鸣")
    (affected-body-parts "头部和面部" "循环系统")
    (habits-impact "饮食高盐" "缺乏运动")
    (pain-levels "轻微" "中等")
    (recommended-herbs "天麻钩藤饮")
))

; 7. Diabetes
(assert (Disease
    (name "糖尿病")
    (symptom-patterns "口干" "多尿" "乏力" "视力模糊")
    (affected-body-parts "全身症状")
    (habits-impact "高糖饮食" "缺乏运动")
    (pain-levels "轻微" "中等")
    (recommended-herbs "消渴方")
))

; 8. Bronchial Asthma
(assert (Disease
    (name "支气管哮喘")
    (symptom-patterns "气喘" "胸闷" "咳嗽")
    (affected-body-parts "呼吸系统")
    (habits-impact "空气污染" "过敏体质")
    (pain-levels "中等" "严重")
    (recommended-herbs "定喘汤")
))

; 9. Chronic Bronchitis
(assert (Disease
    (name "慢性支气管炎")
    (symptom-patterns "咳嗽" "痰多" "胸闷")
    (affected-body-parts "呼吸系统")
    (habits-impact "吸烟" "空气污染")
    (pain-levels "中等")
    (recommended-herbs "三拗汤")
))

; 10. Wind-Cold Headache
(assert (Disease
    (name "风寒头痛")
    (symptom-patterns "头痛" "畏寒" "头晕")
    (affected-body-parts "头部和面部")
    (habits-impact "受寒" "压力过大")
    (pain-levels "轻微" "中等")
    (recommended-herbs "川芎茶调散")
))

; 11. Rheumatic Headache
(assert (Disease
    (name "风湿头痛")
    (symptom-patterns "头痛" "头重" "恶寒")
    (affected-body-parts "头部和面部")
    (habits-impact "潮湿环境" "受凉")
    (pain-levels "轻微" "中等")
    (recommended-herbs "羌活胜湿汤")
))

; 12. Liver Yang Headache
(assert (Disease
    (name "肝阳头痛")
    (symptom-patterns "头痛" "眩晕" "目赤")
    (affected-body-parts "头部和面部")
    (habits-impact "情绪波动" "熬夜")
    (pain-levels "中等" "严重")
    (recommended-herbs "天麻钩藤饮")
))

; 13. Blood Deficiency Headache
(assert (Disease
    (name "血虚头痛")
    (symptom-patterns "头痛" "头晕" "面色苍白")
    (affected-body-parts "头部和面部")
    (habits-impact "营养不足" "失血过多")
    (pain-levels "轻微" "中等")
    (recommended-herbs "加味四物汤")
))

; 14. Phlegm Turbidity Headache
(assert (Disease
    (name "痰浊头痛")
    (symptom-patterns "头痛" "头重如裹" "胸闷")
    (affected-body-parts "头部和面部")
    (habits-impact "高湿环境" "饮食油腻")
    (pain-levels "中等")
    (recommended-herbs "半夏白术天麻汤")
))

; 15. Dizziness (Liver Yang Rising)
(assert (Disease
    (name "眩晕（肝阳上亢）")
    (symptom-patterns "眩晕" "头胀痛" "耳鸣")
    (affected-body-parts "头部和面部")
    (habits-impact "情绪激动" "熬夜")
    (pain-levels "中等")
    (recommended-herbs "天麻钩藤饮")
))

; 16. Dizziness (Phlegm-Dampness)
(assert (Disease
    (name "眩晕（痰湿内盛）")
    (symptom-patterns "眩晕" "头重如裹" "胸闷恶心")
    (affected-body-parts "头部和面部")
    (habits-impact "饮食油腻" "缺乏运动")
    (pain-levels "轻微" "中等")
    (recommended-herbs "半夏白术天麻汤")
))

; 17. Bronchitis (Wind-Heat)
(assert (Disease
    (name "支气管炎（风热犯肺）")
    (symptom-patterns "咳嗽" "痰黄粘稠" "发热")
    (affected-body-parts "呼吸系统")
    (habits-impact "环境污染" "病毒感染")
    (pain-levels "中等")
    (recommended-herbs "桑菊饮")
))

; 18. Pneumonia (Phlegm-Heat)
(assert (Disease
    (name "肺炎（痰热壅肺）")
    (symptom-patterns "胸痛" "咳嗽" "黄痰" "发热")
    (affected-body-parts "呼吸系统")
    (habits-impact "吸烟" "感染")
    (pain-levels "中等" "严重")
    (recommended-herbs "麻杏石甘汤")
))

; 19. Diabetes (Qi-Yin Deficiency)
(assert (Disease
    (name "糖尿病（气阴两虚）")
    (symptom-patterns "口干" "多尿" "乏力")
    (affected-body-parts "全身症状")
    (habits-impact "高糖饮食" "缺乏运动")
    (pain-levels "轻微" "中等")
    (recommended-herbs "七味白术散")
))

; 20. Arthralgia Syndrome (Wind-Damp)
(assert (Disease
    (name "痹证（风湿痹阻）")
    (symptom-patterns "关节痛" "肿胀" "麻木")
    (affected-body-parts "肌肉骨骼系统")
    (habits-impact "寒湿环境")
    (pain-levels "中等")
    (recommended-herbs "独活寄生汤")
))

; 21. Nephritis (Edema)
(assert (Disease
    (name "肾炎（水肿）")
    (symptom-patterns "水肿" "乏力" "尿少")
    (affected-body-parts "泌尿系统")
    (habits-impact "感染" "长期疲劳")
    (pain-levels "轻微" "中等")
    (recommended-herbs "五苓散")
))

; 22. Nephrotic Syndrome
(assert (Disease
    (name "肾病综合症")
    (symptom-patterns "浮肿" "蛋白尿" "乏力")
    (affected-body-parts "泌尿系统")
    (habits-impact "感染" "饮食不当")
    (pain-levels "中等")
    (recommended-herbs "实脾饮")
))

; 23. Acute Pancreatitis
(assert (Disease
    (name "急性胰腺炎")
    (symptom-patterns "腹痛" "恶心" "呕吐")
    (affected-body-parts "消化系统")
    (habits-impact "酗酒" "高脂饮食")
    (pain-levels "严重")
    (recommended-herbs "大黄牡丹汤")
))

; 24. Chronic Bronchitis
(assert (Disease
    (name "慢性支气管炎")
    (symptom-patterns "咳嗽" "痰多" "气喘")
    (affected-body-parts "呼吸系统")
    (habits-impact "长期吸烟" "空气污染")
    (pain-levels "中等")
    (recommended-herbs "补肺汤")
))

; 25. Rheumatoid Arthritis
(assert (Disease
    (name "类风湿性关节炎")
    (symptom-patterns "关节肿痛" "晨僵" "乏力")
    (affected-body-parts "肌肉骨骼系统")
    (habits-impact "寒湿侵袭")
    (pain-levels "中等" "严重")
    (recommended-herbs "四妙丸")
))

; 26. Anemia (Iron Deficiency)
(assert (Disease
    (name "贫血（缺铁性）")
    (symptom-patterns "乏力" "头晕" "面色苍白")
    (affected-body-parts "全身症状")
    (habits-impact "营养不足")
    (pain-levels "轻微")
    (recommended-herbs "八珍汤")
))

; 27. Hemorrhoids
(assert (Disease
    (name "痔疮")
    (symptom-patterns "便血" "肿痛" "脱出")
    (affected-body-parts "消化系统")
    (habits-impact "久坐" "饮食辛辣")
    (pain-levels "轻微" "中等")
    (recommended-herbs "地榆散")
))

; 28. Endometriosis
(assert (Disease
    (name "子宫内膜异位症")
    (symptom-patterns "痛经" "经量多" "小腹胀痛")
    (affected-body-parts "生殖系统")
    (habits-impact "寒冷刺激")
    (pain-levels "中等")
    (recommended-herbs "膈下逐瘀汤")
))

; 29. Female Infertility
(assert (Disease
    (name "不孕不育（女性）")
    (symptom-patterns "经期紊乱" "痛经" "小腹寒痛")
    (affected-body-parts "生殖系统")
    (habits-impact "寒湿环境")
    (pain-levels "中等")
    (recommended-herbs "二仙汤")
))

; 30. Coronary Heart Disease
(assert (Disease
    (name "冠心病")
    (symptom-patterns "胸痛" "气短" "心悸")
    (affected-body-parts "循环系统")
    (habits-impact "高脂饮食" "缺乏运动")
    (pain-levels "中等" "严重")
    (recommended-herbs "血府逐瘀汤")
))

; 31. Stroke
(assert (Disease
    (name "中风")
    (symptom-patterns "半身不遂" "言语不清" "口眼歪斜")
    (affected-body-parts "头部和面部" "循环系统")
    (habits-impact "高血压" "高脂饮食" "情绪波动")
    (pain-levels "中等" "严重")
    (recommended-herbs "真方白丸子")
))

; 32. Epilepsy
(assert (Disease
    (name "癫痫")
    (symptom-patterns "突发抽搐" "意识丧失" "口吐白沫")
    (affected-body-parts "神经系统")
    (habits-impact "精神压力" "过度疲劳")
    (pain-levels "严重")
    (recommended-herbs "定痫丸")
))

; 33. Gout
(assert (Disease
    (name "痛风")
    (symptom-patterns "关节红肿热痛" "活动受限")
    (affected-body-parts "肌肉骨骼系统")
    (habits-impact "高嘌呤饮食" "饮酒过量")
    (pain-levels "中等" "严重")
    (recommended-herbs "四妙丸")
))

; 34. Chronic Nephritis
(assert (Disease
    (name "慢性肾炎")
    (symptom-patterns "浮肿" "尿少" "蛋白尿")
    (affected-body-parts "泌尿系统")
    (habits-impact "感染" "过度劳累")
    (pain-levels "轻微" "中等")
    (recommended-herbs "济生肾气丸")
))

; 35. Jaundice
(assert (Disease
    (name "黄疸")
    (symptom-patterns "目黄" "身黄" "尿黄")
    (affected-body-parts "消化系统")
    (habits-impact "肝胆疾病" "湿热环境")
    (pain-levels "轻微" "中等")
    (recommended-herbs "茵陈蒿汤")
))

; 36. Pulmonary Tuberculosis
(assert (Disease
    (name "肺结核")
    (symptom-patterns "咳嗽" "盗汗" "低热")
    (affected-body-parts "呼吸系统")
    (habits-impact "免疫低下" "营养不良")
    (pain-levels "轻微" "中等")
    (recommended-herbs "保真汤")
))

; 37. Hemorrhoids (Internal)
(assert (Disease
    (name "痔疮（内痔）")
    (symptom-patterns "便血" "脱出" "疼痛")
    (affected-body-parts "消化系统")
    (habits-impact "久坐" "饮食辛辣")
    (pain-levels "轻微" "中等")
    (recommended-herbs "地榆散")
))

; 38. Menstrual Disorders
(assert (Disease
    (name "月经不调")
    (symptom-patterns "经期紊乱" "量多或量少" "痛经")
    (affected-body-parts "生殖系统")
    (habits-impact "情绪波动" "寒湿侵袭")
    (pain-levels "中等")
    (recommended-herbs "逍遥丸")
))

; 39. Mammary Hyperplasia
(assert (Disease
    (name "乳腺增生")
    (symptom-patterns "乳房胀痛" "触及结节")
    (affected-body-parts "生殖系统")
    (habits-impact "情绪紧张" "内分泌失调")
    (pain-levels "轻微" "中等")
    (recommended-herbs "逍遥散")
))

; 40. Cholecystitis
(assert (Disease
    (name "胆囊炎")
    (symptom-patterns "右上腹痛" "恶心" "发热")
    (affected-body-parts "消化系统")
    (habits-impact "高脂饮食" "胆结石")
    (pain-levels "中等" "严重")
    (recommended-herbs "金铃子散")
))

; 41. Constipation
(assert (Disease
    (name "便秘")
    (symptom-patterns "排便困难" "腹胀" "口干")
    (affected-body-parts "消化系统")
    (habits-impact "饮食纤维不足" "久坐不动")
    (pain-levels "轻微" "中等")
    (recommended-herbs "麻子仁丸")
))

; 42. Diarrhea
(assert (Disease
    (name "腹泻")
    (symptom-patterns "稀便" "腹痛" "恶心")
    (affected-body-parts "消化系统")
    (habits-impact "饮食不洁" "寒湿环境")
    (pain-levels "轻微" "中等")
    (recommended-herbs "藿香正气散")
))

; 43. Gastritis (Acute)
(assert (Disease
    (name "胃炎（急性）")
    (symptom-patterns "胃痛" "恶心" "呕吐")
    (affected-body-parts "消化系统")
    (habits-impact "暴饮暴食" "饮酒过量")
    (pain-levels "轻微" "中等")
    (recommended-herbs "黄连温胆汤")
))

; 44. Rhinitis
(assert (Disease
    (name "鼻炎")
    (symptom-patterns "鼻塞" "流涕" "头痛")
    (affected-body-parts "头部和面部")
    (habits-impact "过敏体质" "空气污染")
    (pain-levels "轻微")
    (recommended-herbs "辛夷清肺汤")
))

; 45. Asthma
(assert (Disease
    (name "哮喘")
    (symptom-patterns "气喘" "咳嗽" "胸闷")
    (affected-body-parts "呼吸系统")
    (habits-impact "过敏体质" "空气污染")
    (pain-levels "中等")
    (recommended-herbs "定喘汤")
))

; 46. Pediatric Diarrhea
(assert (Disease
    (name "小儿腹泻")
    (symptom-patterns "稀便" "腹痛" "食欲不振")
    (affected-body-parts "消化系统")
    (habits-impact "饮食不洁" "湿热环境")
    (pain-levels "轻微")
    (recommended-herbs "葛根黄芩黄连汤")
))

; 47. Mumps
(assert (Disease
    (name "流行性腮腺炎")
    (symptom-patterns "腮腺肿痛" "发热" "乏力")
    (affected-body-parts "头部和面部")
    (habits-impact "病毒感染")
    (pain-levels "轻微" "中等")
    (recommended-herbs "柴胡葛根汤")
))

; 48. Night Sweats
(assert (Disease
    (name "盗汗")
    (symptom-patterns "夜间多汗" "乏力" "潮热")
    (affected-body-parts "全身症状")
    (habits-impact "阴虚体质" "过度疲劳")
    (pain-levels "轻微")
    (recommended-herbs "当归六黄汤")
))

; 49. Dysmenorrhea
(assert (Disease
    (name "痛经")
    (symptom-patterns "经期腹痛" "腰酸" "经量异常")
    (affected-body-parts "生殖系统")
    (habits-impact "寒冷刺激")
    (pain-levels "中等")
    (recommended-herbs "少腹逐瘀汤")
))

; 50. Influenza
(assert (Disease
    (name "流感")
    (symptom-patterns "发热" "咽痛" "乏力" "头痛")
    (affected-body-parts "呼吸系统")
    (habits-impact "病毒感染" "免疫力低下")
    (pain-levels "轻微" "中等")
    (recommended-herbs "银翘散")
))
