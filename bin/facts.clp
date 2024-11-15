; 1. 风寒感冒
(assert (Disease
    (name "风寒感冒")
    (symptom-patterns "头痛" "鼻塞" "畏寒" "咳嗽")
    (affected-body-parts "头部和面部" "呼吸系统")
    (habits-impact "熬夜" "着凉")
    (pain-levels "轻微")
    (recommended-herbs "荆芥" "防风" "桂枝")
))

; 2. 风热感冒
(assert (Disease
    (name "风热感冒")
    (symptom-patterns "咽喉疼痛" "发热" "咳嗽" "咽干")
    (affected-body-parts "头部和面部" "呼吸系统")
    (habits-impact "饮食辛辣" "睡眠不足")
    (pain-levels "轻微")
    (recommended-herbs "金银花" "连翘" "薄荷")
))

; 3. 暑湿感冒
(assert (Disease
    (name "暑湿感冒")
    (symptom-patterns "发热" "胸闷" "乏力" "多汗")
    (affected-body-parts "头部和面部" "呼吸系统")
    (habits-impact "高温天气" "湿热环境")
    (pain-levels "轻微")
    (recommended-herbs "香薷" "藿香" "佩兰")
))

; 4. 慢性胃炎
(assert (Disease
    (name "慢性胃炎")
    (symptom-patterns "胃痛" "嗳气" "腹胀" "恶心")
    (affected-body-parts "消化系统")
    (habits-impact "饮食不规律" "暴饮暴食")
    (pain-levels "轻微" "中等")
    (recommended-herbs "黄连" "陈皮" "半夏")
))

; 5. 胃溃疡
(assert (Disease
    (name "胃溃疡")
    (symptom-patterns "胃痛" "反酸" "呕吐" "食欲下降")
    (affected-body-parts "消化系统")
    (habits-impact "过度饮酒" "精神压力大")
    (pain-levels "中等" "严重")
    (recommended-herbs "黄芪" "白术" "蒲公英")
))

; 6. 高血压
(assert (Disease
    (name "高血压")
    (symptom-patterns "头痛" "眩晕" "耳鸣")
    (affected-body-parts "头部和面部" "循环系统")
    (habits-impact "饮食高盐" "缺乏运动")
    (pain-levels "轻微" "中等")
    (recommended-herbs "天麻" "钩藤" "决明子")
))

; 7. 糖尿病
(assert (Disease
    (name "糖尿病")
    (symptom-patterns "口干" "多尿" "乏力" "视力模糊")
    (affected-body-parts "全身症状")
    (habits-impact "高糖饮食" "缺乏运动")
    (pain-levels "轻微" "中等")
    (recommended-herbs "黄连" "天花粉" "葛根")
))

; 8. 支气管哮喘
(assert (Disease
    (name "支气管哮喘")
    (symptom-patterns "气喘" "胸闷" "咳嗽")
    (affected-body-parts "呼吸系统")
    (habits-impact "空气污染" "过敏体质")
    (pain-levels "中等" "严重")
    (recommended-herbs "射干" "麻黄" "苏子")
))

; 9. 慢性支气管炎
(assert (Disease
    (name "慢性支气管炎")
    (symptom-patterns "咳嗽" "痰多" "胸闷")
    (affected-body-parts "呼吸系统")
    (habits-impact "吸烟" "空气污染")
    (pain-levels "中等")
    (recommended-herbs "川贝母" "杏仁" "甘草")
))

; 10. 风寒头痛
(assert (Disease
    (name "风寒头痛")
    (symptom-patterns "头痛" "畏寒" "头晕")
    (affected-body-parts "头部和面部")
    (habits-impact "受寒" "压力过大")
    (pain-levels "轻微" "中等")
    (recommended-herbs "川芎" "白芷")
))

; 11. 风湿头痛
(assert (Disease
    (name "风湿头痛")
    (symptom-patterns "头痛" "头重" "恶寒")
    (affected-body-parts "头部和面部")
    (habits-impact "潮湿环境" "受凉")
    (pain-levels "轻微" "中等")
    (recommended-herbs "羌活" "独活" "防风")
))

; 12. 肝阳头痛
(assert (Disease
    (name "肝阳头痛")
    (symptom-patterns "头痛" "眩晕" "目赤")
    (affected-body-parts "头部和面部")
    (habits-impact "情绪波动" "熬夜")
    (pain-levels "中等" "严重")
    (recommended-herbs "天麻" "钩藤" "菊花")
))

; 13. 血虚头痛
(assert (Disease
    (name "血虚头痛")
    (symptom-patterns "头痛" "头晕" "面色苍白")
    (affected-body-parts "头部和面部")
    (habits-impact "营养不足" "失血过多")
    (pain-levels "轻微" "中等")
    (recommended-herbs "当归" "熟地" "白芍")
))

; 14. 痰浊头痛
(assert (Disease
    (name "痰浊头痛")
    (symptom-patterns "头痛" "头重如裹" "胸闷")
    (affected-body-parts "头部和面部")
    (habits-impact "高湿环境" "饮食油腻")
    (pain-levels "中等")
    (recommended-herbs "半夏" "陈皮" "天麻")
))

; 15. 眩晕（肝阳上亢）
(assert (Disease
    (name "眩晕（肝阳上亢）")
    (symptom-patterns "眩晕" "头胀痛" "耳鸣")
    (affected-body-parts "头部和面部")
    (habits-impact "情绪激动" "熬夜")
    (pain-levels "中等")
    (recommended-herbs "天麻" "钩藤" "菊花")
))

; 16. 眩晕（痰湿内盛）
(assert (Disease
    (name "眩晕（痰湿内盛）")
    (symptom-patterns "眩晕" "头重如裹" "胸闷恶心")
    (affected-body-parts "头部和面部")
    (habits-impact "饮食油腻" "缺乏运动")
    (pain-levels "轻微" "中等")
    (recommended-herbs "半夏" "陈皮" "茯苓")
))

; 17. 支气管炎（风热犯肺）
(assert (Disease
    (name "支气管炎（风热犯肺）")
    (symptom-patterns "咳嗽" "痰黄粘稠" "发热")
    (affected-body-parts "呼吸系统")
    (habits-impact "环境污染" "病毒感染")
    (pain-levels "中等")
    (recommended-herbs "桑白皮" "杏仁" "甘草")
))

; 18. 肺炎（痰热壅肺）
(assert (Disease
    (name "肺炎（痰热壅肺）")
    (symptom-patterns "胸痛" "咳嗽" "黄痰" "发热")
    (affected-body-parts "呼吸系统")
    (habits-impact "吸烟" "感染")
    (pain-levels "中等" "严重")
    (recommended-herbs "麻黄" "杏仁" "石膏")
))

; 19. 糖尿病（气阴两虚）
(assert (Disease
    (name "糖尿病（气阴两虚）")
    (symptom-patterns "口干" "多尿" "乏力")
    (affected-body-parts "全身症状")
    (habits-impact "高糖饮食" "缺乏运动")
    (pain-levels "轻微" "中等")
    (recommended-herbs "黄芪" "人参" "麦冬")
))

; 20. 痹证（风湿痹阻）
(assert (Disease
    (name "痹证（风湿痹阻）")
    (symptom-patterns "关节痛" "肿胀" "麻木")
    (affected-body-parts "肌肉骨骼系统")
    (habits-impact "寒湿环境")
    (pain-levels "中等")
    (recommended-herbs "羌活" "独活" "防风")
))
; 21. 肾炎（水肿）
(assert (Disease
    (name "肾炎（水肿）")
    (symptom-patterns "水肿" "乏力" "尿少")
    (affected-body-parts "泌尿系统")
    (habits-impact "感染" "长期疲劳")
    (pain-levels "轻微" "中等")
    (recommended-herbs "茯苓" "泽泻" "车前子")
))

; 22. 肾病综合症
(assert (Disease
    (name "肾病综合症")
    (symptom-patterns "浮肿" "蛋白尿" "乏力")
    (affected-body-parts "泌尿系统")
    (habits-impact "感染" "饮食不当")
    (pain-levels "中等")
    (recommended-herbs "黄芪" "茯苓" "白术")
))

; 23. 急性胰腺炎
(assert (Disease
    (name "急性胰腺炎")
    (symptom-patterns "腹痛" "恶心" "呕吐")
    (affected-body-parts "消化系统")
    (habits-impact "酗酒" "高脂饮食")
    (pain-levels "严重")
    (recommended-herbs "大黄" "芒硝" "郁金")
))

; 24. 慢性支气管炎
(assert (Disease
    (name "慢性支气管炎")
    (symptom-patterns "咳嗽" "痰多" "气喘")
    (affected-body-parts "呼吸系统")
    (habits-impact "长期吸烟" "空气污染")
    (pain-levels "中等")
    (recommended-herbs "川贝母" "桑白皮" "甘草")
))

; 25. 类风湿性关节炎
(assert (Disease
    (name "类风湿性关节炎")
    (symptom-patterns "关节肿痛" "晨僵" "乏力")
    (affected-body-parts "肌肉骨骼系统")
    (habits-impact "寒湿侵袭")
    (pain-levels "中等" "严重")
    (recommended-herbs "独活" "川芎" "当归")
))

; 26. 贫血（缺铁性）
(assert (Disease
    (name "贫血（缺铁性）")
    (symptom-patterns "乏力" "头晕" "面色苍白")
    (affected-body-parts "全身症状")
    (habits-impact "营养不足")
    (pain-levels "轻微")
    (recommended-herbs "当归" "熟地" "白芍")
))

; 27. 痔疮
(assert (Disease
    (name "痔疮")
    (symptom-patterns "便血" "肿痛" "脱出")
    (affected-body-parts "消化系统")
    (habits-impact "久坐" "饮食辛辣")
    (pain-levels "轻微" "中等")
    (recommended-herbs "地榆" "槐花" "黄柏")
))

; 28. 子宫内膜异位症
(assert (Disease
    (name "子宫内膜异位症")
    (symptom-patterns "痛经" "经量多" "小腹胀痛")
    (affected-body-parts "生殖系统")
    (habits-impact "寒冷刺激")
    (pain-levels "中等")
    (recommended-herbs "当归" "川芎" "益母草")
))

; 29. 不孕不育（女性）
(assert (Disease
    (name "不孕不育（女性）")
    (symptom-patterns "经期紊乱" "痛经" "小腹寒痛")
    (affected-body-parts "生殖系统")
    (habits-impact "寒湿环境")
    (pain-levels "中等")
    (recommended-herbs "当归" "艾叶" "菟丝子")
))

; 30. 冠心病
(assert (Disease
    (name "冠心病")
    (symptom-patterns "胸痛" "气短" "心悸")
    (affected-body-parts "循环系统")
    (habits-impact "高脂饮食" "缺乏运动")
    (pain-levels "中等" "严重")
    (recommended-herbs "丹参" "川芎" "赤芍")
))
; 31. 中风
(assert (Disease
    (name "中风")
    (symptom-patterns "半身不遂" "言语不清" "口眼歪斜")
    (affected-body-parts "头部和面部" "循环系统")
    (habits-impact "高血压" "高脂饮食" "情绪波动")
    (pain-levels "中等" "严重")
    (recommended-herbs "天麻" "钩藤" "川芎")
))

; 32. 癫痫
(assert (Disease
    (name "癫痫")
    (symptom-patterns "突发抽搐" "意识丧失" "口吐白沫")
    (affected-body-parts "神经系统")
    (habits-impact "精神压力" "过度疲劳")
    (pain-levels "严重")
    (recommended-herbs "天麻" "茯苓" "胆星")
))

; 33. 痛风
(assert (Disease
    (name "痛风")
    (symptom-patterns "关节红肿热痛" "活动受限")
    (affected-body-parts "肌肉骨骼系统")
    (habits-impact "高嘌呤饮食" "饮酒过量")
    (pain-levels "中等" "严重")
    (recommended-herbs "防己" "牛膝" "薏苡仁")
))

; 34. 慢性肾炎
(assert (Disease
    (name "慢性肾炎")
    (symptom-patterns "浮肿" "尿少" "蛋白尿")
    (affected-body-parts "泌尿系统")
    (habits-impact "感染" "过度劳累")
    (pain-levels "轻微" "中等")
    (recommended-herbs "泽泻" "黄芪" "茯苓")
))

; 35. 黄疸
(assert (Disease
    (name "黄疸")
    (symptom-patterns "目黄" "身黄" "尿黄")
    (affected-body-parts "消化系统")
    (habits-impact "肝胆疾病" "湿热环境")
    (pain-levels "轻微" "中等")
    (recommended-herbs "茵陈" "栀子" "黄柏")
))

; 36. 肺结核
(assert (Disease
    (name "肺结核")
    (symptom-patterns "咳嗽" "盗汗" "低热")
    (affected-body-parts "呼吸系统")
    (habits-impact "免疫低下" "营养不良")
    (pain-levels "轻微" "中等")
    (recommended-herbs "百合" "沙参" "川贝母")
))

; 37. 痔疮（内痔）
(assert (Disease
    (name "痔疮（内痔）")
    (symptom-patterns "便血" "脱出" "疼痛")
    (affected-body-parts "消化系统")
    (habits-impact "久坐" "饮食辛辣")
    (pain-levels "轻微" "中等")
    (recommended-herbs "槐角" "地榆" "枳壳")
))

; 38. 月经不调
(assert (Disease
    (name "月经不调")
    (symptom-patterns "经期紊乱" "量多或量少" "痛经")
    (affected-body-parts "生殖系统")
    (habits-impact "情绪波动" "寒湿侵袭")
    (pain-levels "中等")
    (recommended-herbs "当归" "川芎" "益母草")
))

; 39. 乳腺增生
(assert (Disease
    (name "乳腺增生")
    (symptom-patterns "乳房胀痛" "触及结节")
    (affected-body-parts "生殖系统")
    (habits-impact "情绪紧张" "内分泌失调")
    (pain-levels "轻微" "中等")
    (recommended-herbs "王不留行" "丹参" "益母草")
))

; 40. 胆囊炎
(assert (Disease
    (name "胆囊炎")
    (symptom-patterns "右上腹痛" "恶心" "发热")
    (affected-body-parts "消化系统")
    (habits-impact "高脂饮食" "胆结石")
    (pain-levels "中等" "严重")
    (recommended-herbs "柴胡" "郁金" "茵陈")
))

; 41. 便秘
(assert (Disease
    (name "便秘")
    (symptom-patterns "排便困难" "腹胀" "口干")
    (affected-body-parts "消化系统")
    (habits-impact "饮食纤维不足" "久坐不动")
    (pain-levels "轻微" "中等")
    (recommended-herbs "火麻仁" "大黄" "瓜蒌")
))

; 42. 腹泻
(assert (Disease
    (name "腹泻")
    (symptom-patterns "稀便" "腹痛" "恶心")
    (affected-body-parts "消化系统")
    (habits-impact "饮食不洁" "寒湿环境")
    (pain-levels "轻微" "中等")
    (recommended-herbs "藿香" "佩兰" "白术")
))

; 43. 胃炎（急性）
(assert (Disease
    (name "胃炎（急性）")
    (symptom-patterns "胃痛" "恶心" "呕吐")
    (affected-body-parts "消化系统")
    (habits-impact "暴饮暴食" "饮酒过量")
    (pain-levels "轻微" "中等")
    (recommended-herbs "黄连" "半夏" "茯苓")
))

; 44. 鼻炎
(assert (Disease
    (name "鼻炎")
    (symptom-patterns "鼻塞" "流涕" "头痛")
    (affected-body-parts "头部和面部")
    (habits-impact "过敏体质" "空气污染")
    (pain-levels "轻微")
    (recommended-herbs "苍耳子" "辛夷" "薄荷")
))

; 45. 哮喘
(assert (Disease
    (name "哮喘")
    (symptom-patterns "气喘" "咳嗽" "胸闷")
    (affected-body-parts "呼吸系统")
    (habits-impact "过敏体质" "空气污染")
    (pain-levels "中等")
    (recommended-herbs "麻黄" "杏仁" "苏子")
))

; 46. 小儿腹泻
(assert (Disease
    (name "小儿腹泻")
    (symptom-patterns "稀便" "腹痛" "食欲不振")
    (affected-body-parts "消化系统")
    (habits-impact "饮食不洁" "湿热环境")
    (pain-levels "轻微")
    (recommended-herbs "葛根" "白术" "茯苓")
))

; 47. 流行性腮腺炎
(assert (Disease
    (name "流行性腮腺炎")
    (symptom-patterns "腮腺肿痛" "发热" "乏力")
    (affected-body-parts "头部和面部")
    (habits-impact "病毒感染")
    (pain-levels "轻微" "中等")
    (recommended-herbs "柴胡" "连翘" "蒲公英")
))

; 48. 盗汗
(assert (Disease
    (name "盗汗")
    (symptom-patterns "夜间多汗" "乏力" "潮热")
    (affected-body-parts "全身症状")
    (habits-impact "阴虚体质" "过度疲劳")
    (pain-levels "轻微")
    (recommended-herbs "麦冬" "沙参" "百合")
))

; 49. 痛经
(assert (Disease
    (name "痛经")
    (symptom-patterns "经期腹痛" "腰酸" "经量异常")
    (affected-body-parts "生殖系统")
    (habits-impact "寒冷刺激")
    (pain-levels "中等")
    (recommended-herbs "艾叶" "当归" "益母草")
))

; 50. 流感
(assert (Disease
    (name "流感")
    (symptom-patterns "发热" "咽痛" "乏力" "头痛")
    (affected-body-parts "呼吸系统")
    (habits-impact "病毒感染" "免疫力低下")
    (pain-levels "轻微" "中等")
    (recommended-herbs "金银花" "连翘" "板蓝根")
))

