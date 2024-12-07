; 1. Common Cold (Wind-Cold)
(assert (Disease
    (name "Common Cold (Wind-Cold)")
    (symptom-patterns "Headache" "Nasal Congestion" "Chills" "Cough")
    (affected-body-parts "Head and Face" "Respiratory System")
    (habits-impact "Staying Up Late" "Exposure to Cold")
    (pain-levels "Mild")
    (recommended-herbs "Jing Fang Bai Du San")
))

; 2. Common Cold (Wind-Heat)
(assert (Disease
    (name "Common Cold (Wind-Heat)")
    (symptom-patterns "Sore Throat" "Fever" "Cough" "Dry Throat")
    (affected-body-parts "Head and Face" "Respiratory System")
    (habits-impact "Spicy Food" "Lack of Sleep")
    (pain-levels "Mild")
    (recommended-herbs "Yin Qiao San" "Cong Chi Jie Geng Tang")
))

; 3. Summer Heat Common Cold
(assert (Disease
    (name "Summer Heat Common Cold")
    (symptom-patterns "Fever" "Chest Tightness" "Fatigue" "Sweating")
    (affected-body-parts "Head and Face" "Respiratory System")
    (habits-impact "Hot Weather" "Humid Environment")
    (pain-levels "Mild")
    (recommended-herbs "New Xiang Ru Yin")
))

; 4. Chronic Gastritis
(assert (Disease
    (name "Chronic Gastritis")
    (symptom-patterns "Stomach Pain" "Belching" "Bloating" "Nausea")
    (affected-body-parts "Digestive System")
    (habits-impact "Irregular Eating" "Overeating")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Chai Hu Shu Gan San")
))

; 5. Gastric Ulcer
(assert (Disease
    (name "Gastric Ulcer")
    (symptom-patterns "Stomach Pain" "Acid Reflux" "Vomiting" "Loss of Appetite")
    (affected-body-parts "Digestive System")
    (habits-impact "Excessive Drinking" "Mental Stress")
    (pain-levels "Moderate" "Severe")
    (recommended-herbs "Si Jun Zi Tang")
))
; 6. Hypertension
(assert (Disease
    (name "Hypertension")
    (symptom-patterns "Headache" "Dizziness" "Tinnitus")
    (affected-body-parts "Head and Face" "Circulatory System")
    (habits-impact "High Salt Diet" "Lack of Exercise")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Tian Ma Gou Teng Yin")
))

; 7. Diabetes
(assert (Disease
    (name "Diabetes")
    (symptom-patterns "Dry Mouth" "Frequent Urination" "Fatigue" "Blurred Vision")
    (affected-body-parts "Systemic Symptoms")
    (habits-impact "High Sugar Diet" "Lack of Exercise")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Xiao Ke Fang")
))

; 8. Bronchial Asthma
(assert (Disease
    (name "Bronchial Asthma")
    (symptom-patterns "Wheezing" "Chest Tightness" "Coughing")
    (affected-body-parts "Respiratory System")
    (habits-impact "Air Pollution" "Allergic Constitution")
    (pain-levels "Moderate" "Severe")
    (recommended-herbs "Ding Chuan Tang")
))

; 9. Chronic Bronchitis
(assert (Disease
    (name "Chronic Bronchitis")
    (symptom-patterns "Coughing" "Excessive Phlegm" "Chest Tightness")
    (affected-body-parts "Respiratory System")
    (habits-impact "Smoking" "Air Pollution")
    (pain-levels "Moderate")
    (recommended-herbs "San Ao Tang")
))

; 10. Wind-Cold Headache
(assert (Disease
    (name "Wind-Cold Headache")
    (symptom-patterns "Headache" "Aversion to Cold" "Dizziness")
    (affected-body-parts "Head and Face")
    (habits-impact "Cold Exposure" "Excessive Stress")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Chuan Xiong Cha Tiao San")
))

; 11. Rheumatic Headache
(assert (Disease
    (name "Rheumatic Headache")
    (symptom-patterns "Headache" "Heavy Head" "Chills")
    (affected-body-parts "Head and Face")
    (habits-impact "Humid Environment" "Cold Exposure")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Qiang Huo Sheng Shi Tang")
))

; 12. Liver Yang Headache
(assert (Disease
    (name "Liver Yang Headache")
    (symptom-patterns "Headache" "Dizziness" "Red Eyes")
    (affected-body-parts "Head and Face")
    (habits-impact "Emotional Fluctuations" "Staying Up Late")
    (pain-levels "Moderate" "Severe")
    (recommended-herbs "Tian Ma Gou Teng Yin")
))

; 13. Blood Deficiency Headache
(assert (Disease
    (name "Blood Deficiency Headache")
    (symptom-patterns "Headache" "Dizziness" "Pale Complexion")
    (affected-body-parts "Head and Face")
    (habits-impact "Malnutrition" "Excessive Blood Loss")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Jia Wei Si Wu Tang")
))

; 14. Phlegm Turbidity Headache
(assert (Disease
    (name "Phlegm Turbidity Headache")
    (symptom-patterns "Headache" "Heavy Head" "Chest Tightness")
    (affected-body-parts "Head and Face")
    (habits-impact "Humid Environment" "Greasy Diet")
    (pain-levels "Moderate")
    (recommended-herbs "Ban Xia Bai Zhu Tian Ma Tang")
))
; 15. Dizziness (Liver Yang Rising)
(assert (Disease
    (name "Dizziness (Liver Yang Rising)")
    (symptom-patterns "Dizziness" "Head Distension" "Tinnitus")
    (affected-body-parts "Head and Face")
    (habits-impact "Emotional Agitation" "Staying Up Late")
    (pain-levels "Moderate")
    (recommended-herbs "Tian Ma Gou Teng Yin")
))

; 16. Dizziness (Phlegm-Dampness)
(assert (Disease
    (name "Dizziness (Phlegm-Dampness)")
    (symptom-patterns "Dizziness" "Heavy Head" "Chest Tightness and Nausea")
    (affected-body-parts "Head and Face")
    (habits-impact "Greasy Diet" "Lack of Exercise")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Ban Xia Bai Zhu Tian Ma Tang")
))

; 17. Bronchitis (Wind-Heat)
(assert (Disease
    (name "Bronchitis (Wind-Heat)")
    (symptom-patterns "Coughing" "Yellow Thick Phlegm" "Fever")
    (affected-body-parts "Respiratory System")
    (habits-impact "Environmental Pollution" "Viral Infection")
    (pain-levels "Moderate")
    (recommended-herbs "Sang Ju Yin")
))

; 18. Pneumonia (Phlegm-Heat)
(assert (Disease
    (name "Pneumonia (Phlegm-Heat)")
    (symptom-patterns "Chest Pain" "Coughing" "Yellow Phlegm" "Fever")
    (affected-body-parts "Respiratory System")
    (habits-impact "Smoking" "Infection")
    (pain-levels "Moderate" "Severe")
    (recommended-herbs "Ma Xing Shi Gan Tang")
))

; 19. Diabetes (Qi-Yin Deficiency)
(assert (Disease
    (name "Diabetes (Qi-Yin Deficiency)")
    (symptom-patterns "Dry Mouth" "Frequent Urination" "Fatigue")
    (affected-body-parts "Systemic Symptoms")
    (habits-impact "High Sugar Diet" "Lack of Exercise")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Qi Wei Bai Zhu San")
))

; 20. Arthralgia Syndrome (Wind-Damp)
(assert (Disease
    (name "Arthralgia Syndrome (Wind-Damp)")
    (symptom-patterns "Joint Pain" "Swelling" "Numbness")
    (affected-body-parts "Musculoskeletal System")
    (habits-impact "Cold-Damp Environment")
    (pain-levels "Moderate")
    (recommended-herbs "Du Huo Ji Sheng Tang")
))

; 21. Nephritis (Edema)
(assert (Disease
    (name "Nephritis (Edema)")
    (symptom-patterns "Edema" "Fatigue" "Oliguria")
    (affected-body-parts "Urinary System")
    (habits-impact "Infection" "Chronic Fatigue")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Wu Ling San")
))

; 22. Nephrotic Syndrome
(assert (Disease
    (name "Nephrotic Syndrome")
    (symptom-patterns "Edema" "Proteinuria" "Fatigue")
    (affected-body-parts "Urinary System")
    (habits-impact "Infection" "Improper Diet")
    (pain-levels "Moderate")
    (recommended-herbs "Shi Pi Yin")
))


; 23. Acute Pancreatitis
(assert (Disease
    (name "Acute Pancreatitis")
    (symptom-patterns "Abdominal Pain" "Nausea" "Vomiting")
    (affected-body-parts "Digestive System")
    (habits-impact "Alcohol Abuse" "High-fat Diet")
    (pain-levels "Severe")
    (recommended-herbs "Da Huang Mu Dan Tang")
))

; 24. Chronic Bronchitis
(assert (Disease
    (name "Chronic Bronchitis")
    (symptom-patterns "Coughing" "Excessive Phlegm" "Wheezing")
    (affected-body-parts "Respiratory System")
    (habits-impact "Long-term Smoking" "Air Pollution")
    (pain-levels "Moderate")
    (recommended-herbs "Bu Fei Tang")
))

; 25. Rheumatoid Arthritis
(assert (Disease
    (name "Rheumatoid Arthritis")
    (symptom-patterns "Joint Pain and Swelling" "Morning Stiffness" "Fatigue")
    (affected-body-parts "Musculoskeletal System")
    (habits-impact "Cold-Damp Invasion")
    (pain-levels "Moderate" "Severe")
    (recommended-herbs "Si Miao Wan")
))

; 26. Anemia (Iron Deficiency)
(assert (Disease
    (name "Anemia (Iron Deficiency)")
    (symptom-patterns "Fatigue" "Dizziness" "Pale Complexion")
    (affected-body-parts "Systemic Symptoms")
    (habits-impact "Malnutrition")
    (pain-levels "Mild")
    (recommended-herbs "Ba Zhen Tang")
))

; 27. Hemorrhoids
(assert (Disease
    (name "Hemorrhoids")
    (symptom-patterns "Rectal Bleeding" "Pain and Swelling" "Prolapse")
    (affected-body-parts "Digestive System")
    (habits-impact "Prolonged Sitting" "Spicy Diet")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Di Yu San")
))

; 28. Endometriosis
(assert (Disease
    (name "Endometriosis")
    (symptom-patterns "Dysmenorrhea" "Heavy Menstruation" "Lower Abdominal Pain")
    (affected-body-parts "Reproductive System")
    (habits-impact "Cold Stimulation")
    (pain-levels "Moderate")
    (recommended-herbs "Ge Xia Zhu Yu Tang")
))

; 29. Female Infertility
(assert (Disease
    (name "Female Infertility")
    (symptom-patterns "Irregular Menstruation" "Dysmenorrhea" "Lower Abdominal Cold Pain")
    (affected-body-parts "Reproductive System")
    (habits-impact "Cold-Damp Environment")
    (pain-levels "Moderate")
    (recommended-herbs "Er Xian Tang")
))

; 30. Coronary Heart Disease
(assert (Disease
    (name "Coronary Heart Disease")
    (symptom-patterns "Chest Pain" "Shortness of Breath" "Palpitations")
    (affected-body-parts "Circulatory System")
    (habits-impact "High-fat Diet" "Lack of Exercise")
    (pain-levels "Moderate" "Severe")
    (recommended-herbs "Xue Fu Zhu Yu Tang")
))

; 31. Stroke
(assert (Disease
    (name "Stroke")
    (symptom-patterns "Hemiplegia" "Slurred Speech" "Facial Paralysis")
    (affected-body-parts "Head and Face" "Circulatory System")
    (habits-impact "Hypertension" "High-fat Diet" "Emotional Fluctuations")
    (pain-levels "Moderate" "Severe")
    (recommended-herbs "Zhen Fang Bai Wan Zi")
))

; 32. Epilepsy
(assert (Disease
    (name "Epilepsy")
    (symptom-patterns "Sudden Convulsions" "Loss of Consciousness" "Foaming at Mouth")
    (affected-body-parts "Nervous System")
    (habits-impact "Mental Stress" "Excessive Fatigue")
    (pain-levels "Severe")
    (recommended-herbs "Ding Xian Wan")
))

; 33. Gout
(assert (Disease
    (name "Gout")
    (symptom-patterns "Joint Redness, Swelling and Pain" "Limited Movement")
    (affected-body-parts "Musculoskeletal System")
    (habits-impact "High-purine Diet" "Excessive Alcohol")
    (pain-levels "Moderate" "Severe")
    (recommended-herbs "Si Miao Wan")
))

; 34. Chronic Nephritis
(assert (Disease
    (name "Chronic Nephritis")
    (symptom-patterns "Edema" "Oliguria" "Proteinuria")
    (affected-body-parts "Urinary System")
    (habits-impact "Infection" "Excessive Fatigue")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Ji Sheng Shen Qi Wan")
))

; 35. Jaundice
(assert (Disease
    (name "Jaundice")
    (symptom-patterns "Yellow Eyes" "Yellow Skin" "Yellow Urine")
    (affected-body-parts "Digestive System")
    (habits-impact "Hepatobiliary Disease" "Damp-Heat Environment")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Yin Chen Hao Tang")
))

; 36. Pulmonary Tuberculosis
(assert (Disease
    (name "Pulmonary Tuberculosis")
    (symptom-patterns "Coughing" "Night Sweats" "Low Fever")
    (affected-body-parts "Respiratory System")
    (habits-impact "Low Immunity" "Malnutrition")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Bao Zhen Tang")
))

; 37. Hemorrhoids (Internal)
(assert (Disease
    (name "Hemorrhoids (Internal)")
    (symptom-patterns "Rectal Bleeding" "Prolapse" "Pain")
    (affected-body-parts "Digestive System")
    (habits-impact "Prolonged Sitting" "Spicy Diet")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Di Yu San")
))

; 38. Menstrual Disorders
(assert (Disease
    (name "Menstrual Disorders")
    (symptom-patterns "Irregular Periods" "Heavy or Light Flow" "Dysmenorrhea")
    (affected-body-parts "Reproductive System")
    (habits-impact "Emotional Changes" "Cold-damp Invasion")
    (pain-levels "Moderate")
    (recommended-herbs "Xiao Yao Wan")
))

; 39. Mammary Hyperplasia
(assert (Disease
    (name "Mammary Hyperplasia")
    (symptom-patterns "Breast Pain and Swelling" "Palpable Nodules")
    (affected-body-parts "Reproductive System")
    (habits-impact "Emotional Stress" "Endocrine Disorders")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Xiao Yao San")
))

; 40. Cholecystitis
(assert (Disease
    (name "Cholecystitis")
    (symptom-patterns "Right Upper Abdominal Pain" "Nausea" "Fever")
    (affected-body-parts "Digestive System")
    (habits-impact "High-fat Diet" "Gallstones")
    (pain-levels "Moderate" "Severe")
    (recommended-herbs "Jin Ling Zi San")
))


; 41. Constipation
(assert (Disease
    (name "Constipation")
    (symptom-patterns "Difficult Defecation" "Bloating" "Dry Mouth")
    (affected-body-parts "Digestive System")
    (habits-impact "Insufficient Fiber" "Sedentary Lifestyle")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Ma Zi Ren Wan")
))

; 42. Diarrhea
(assert (Disease
    (name "Diarrhea")
    (symptom-patterns "Loose Stools" "Abdominal Pain" "Nausea")
    (affected-body-parts "Digestive System")
    (habits-impact "Unclean Food" "Cold-damp Environment")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Huo Xiang Zheng Qi San")
))

; 43. Gastritis (Acute)
(assert (Disease
    (name "Gastritis (Acute)")
    (symptom-patterns "Stomach Pain" "Nausea" "Vomiting")
    (affected-body-parts "Digestive System")
    (habits-impact "Overeating" "Excessive Alcohol")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Huang Lian Wen Dan Tang")
))

; 44. Rhinitis
(assert (Disease
    (name "Rhinitis")
    (symptom-patterns "Nasal Congestion" "Runny Nose" "Headache")
    (affected-body-parts "Head and Face")
    (habits-impact "Allergic Constitution" "Air Pollution")
    (pain-levels "Mild")
    (recommended-herbs "Xin Yi Qing Fei Tang")
))

; 45. Asthma
(assert (Disease
    (name "Asthma")
    (symptom-patterns "Wheezing" "Coughing" "Chest Tightness")
    (affected-body-parts "Respiratory System")
    (habits-impact "Allergic Constitution" "Air Pollution")
    (pain-levels "Moderate")
    (recommended-herbs "Ding Chuan Tang")
))

; 46. Pediatric Diarrhea
(assert (Disease
    (name "Pediatric Diarrhea")
    (symptom-patterns "Loose Stools" "Abdominal Pain" "Loss of Appetite")
    (affected-body-parts "Digestive System")
    (habits-impact "Unclean Food" "Damp-heat Environment")
    (pain-levels "Mild")
    (recommended-herbs "Ge Gen Huang Qin Huang Lian Tang")
))

; 47. Mumps
(assert (Disease
    (name "Mumps")
    (symptom-patterns "Parotid Swelling and Pain" "Fever" "Fatigue")
    (affected-body-parts "Head and Face")
    (habits-impact "Viral Infection")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Chai Hu Ge Gen Tang")
))

; 48. Night Sweats
(assert (Disease
    (name "Night Sweats")
    (symptom-patterns "Night Sweating" "Fatigue" "Tidal Fever")
    (affected-body-parts "Systemic Symptoms")
    (habits-impact "Yin Deficiency Constitution" "Excessive Fatigue")
    (pain-levels "Mild")
    (recommended-herbs "Dang Gui Liu Huang Tang")
))

; 49. Dysmenorrhea
(assert (Disease
    (name "Dysmenorrhea")
    (symptom-patterns "Menstrual Cramps" "Lower Back Pain" "Abnormal Flow")
    (affected-body-parts "Reproductive System")
    (habits-impact "Cold Stimulation")
    (pain-levels "Moderate")
    (recommended-herbs "Shao Fu Zhu Yu Tang")
))

; 50. Influenza
(assert (Disease
    (name "Influenza")
    (symptom-patterns "Fever" "Sore Throat" "Fatigue" "Headache")
    (affected-body-parts "Respiratory System")
    (habits-impact "Viral Infection" "Low Immunity")
    (pain-levels "Mild" "Moderate")
    (recommended-herbs "Yin Qiao San")
))

