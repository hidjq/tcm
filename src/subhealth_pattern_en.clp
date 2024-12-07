; Qi Deficiency Pattern
(assert (SubhealthPattern 
    (pattern-name "Qi Deficiency")
    (primary-symptoms 
        "fatigue.physical"    ; Physical fatigue
        "physical.shortness"  ; Shortness of breath
    )
    (secondary-symptoms 
        "fatigue.mental"      ; Mental fatigue
        "physical.coldHands"  ; Cold extremities
        "physical.digestion"  ; Poor digestion
        "sleep.checkbox.dream"     ; Frequent dreams
        "sleep.checkbox.irregular" ; Irregular sleep
    )
    (lifestyle-factors 
        "lifestyle.exercise.low"  ; Lack of exercise
        "lifestyle.work.high"     ; High work pressure
    )
    (recommended-herbs "Astragalus" "Codonopsis" "Atractylodes" "Angelica")
    (description "General fatigue, shortness of breath, and low energy")
))

; Yang Deficiency Pattern
(assert (SubhealthPattern 
    (pattern-name "Yang Deficiency")
    (primary-symptoms 
        "physical.coldHands"  ; Cold hands and feet
        "physical.coldness"   ; Aversion to cold
    )
    (secondary-symptoms 
        "physical.fatigue"    ; Fatigue
        "sleep.quality"       ; Poor sleep quality
        "physical.digestion"  ; Poor digestion
        "sleep.checkbox.dream" ; Frequent dreams
    )
    (lifestyle-factors 
        "lifestyle.exercise.low"  ; Lack of exercise
        "lifestyle.diet.poor"     ; Poor diet
    )
    (recommended-herbs "Cinnamon" "Dried Ginger" "Aconite" "Codonopsis")
    (description "Cold sensitivity, fatigue, and digestive issues")
))

; Liver Qi Stagnation
(assert (SubhealthPattern 
    (pattern-name "Liver Qi Stagnation")
    (primary-symptoms 
        "mood.anxiety"       ; Anxiety
        "mood.irritability"  ; Irritability
    )
    (secondary-symptoms 
        "sleep.difficulty"   ; Difficulty falling asleep
        "physical.digestion" ; Digestive discomfort
        "sleep.checkbox.irregular" ; Irregular sleep
        "sleep.checkbox.dream"     ; Frequent dreams
    )
    (lifestyle-factors 
        "lifestyle.work.high"    ; High work pressure
        "lifestyle.stress.high"  ; High stress levels
    )
    (recommended-herbs "Bupleurum" "Cyperus" "White Peony" "Licorice")
    (description "Emotional strain, irritability, and sleep disturbances")
))

; Heart and Spleen Deficiency
(assert (SubhealthPattern 
    (pattern-name "Heart and Spleen Deficiency")
    (primary-symptoms 
        "fatigue.mental"     ; Mental fatigue
        "mood.anxiety"       ; Anxiety
    )
    (secondary-symptoms 
        "sleep.quality"       ; Poor sleep quality
        "physical.digestion"  ; Poor digestion
        "fatigue.physical"    ; Physical fatigue
        "sleep.checkbox.dream"     ; Frequent dreams
        "sleep.checkbox.irregular" ; Irregular sleep
    )
    (lifestyle-factors 
        "lifestyle.diet.poor"   ; Poor diet
        "lifestyle.work.high"   ; High work pressure
    )
    (recommended-herbs  "Codonopsis" "Astragalus" "Licorice" "Angelica" "Poria")
    (description "Mental fatigue, anxiety, and digestive issues")
))

; Phlegm-Dampness Pattern
(assert (SubhealthPattern 
    (pattern-name "Phlegm-Dampness")
    (primary-symptoms 
        "physical.digestion"   ; Digestive issues
        "fatigue.physical"     ; Physical fatigue
    )
    (secondary-symptoms 
        "physical.heaviness"   ; Heavy sensation
        "mood.foggy"          ; Mental fogginess
        "sleep.checkbox.snore" ; Snoring
    )
    (lifestyle-factors 
        "lifestyle.diet.poor"    ; Poor diet
        "lifestyle.exercise.low" ; Lack of exercise
    )
    (recommended-herbs "Pinellia" "Citrus Peel" "Poria" "Licorice")
    (description "Heaviness, digestive issues, and mental fogginess")
))

; Blood Deficiency Pattern
(assert (SubhealthPattern 
    (pattern-name "Blood Deficiency")
    (primary-symptoms 
        "fatigue.physical"    ; Physical fatigue
        "mood.depression"     ; Depression
    )
    (secondary-symptoms 
        "sleep.difficulty"    ; Sleep difficulties
        "physical.dizziness"  ; Dizziness
        "sleep.checkbox.dream" ; Frequent dreams
    )
    (lifestyle-factors 
        "lifestyle.diet.poor"  ; Poor diet
    )
    (recommended-herbs "Angelica" "White Peony" "Rehmannia" "Ligusticum")
    (description "Dizziness, fatigue, and emotional instability")
))

; Yin Deficiency Pattern
(assert (SubhealthPattern 
    (pattern-name "Yin Deficiency")
    (primary-symptoms 
        "physical.dryness"    ; Dryness
        "fatigue.physical"    ; Physical fatigue
    )
    (secondary-symptoms 
        "sleep.quality"       ; Poor sleep quality
        "mood.anxiety"        ; Anxiety
        "sleep.checkbox.dream" ; Frequent dreams
    )
    (lifestyle-factors 
        "lifestyle.work.high"   ; High work pressure
    )
    (recommended-herbs "Ophiopogon" "Scrophularia" "Glehnia" "Fresh Rehmannia")
    (description "Dryness, restlessness, and sleep issues")
))

; Spleen and Stomach Weakness
(assert (SubhealthPattern 
    (pattern-name "Spleen and Stomach Weakness")
    (primary-symptoms 
        "physical.digestion"   ; Digestive issues
        "fatigue.mental"       ; Mental fatigue
    )
    (secondary-symptoms 
        "fatigue.physical"     ; Physical fatigue
        "physical.appetite"    ; Poor appetite
        "sleep.checkbox.irregular" ; Irregular sleep
    )
    (lifestyle-factors 
        "lifestyle.diet.poor"    ; Poor diet
        "lifestyle.work.high"    ; High work pressure
    )
    (recommended-herbs "Codonopsis" "Atractylodes" "Poria" "Licorice")
    (description "Digestive weakness, fatigue, and poor appetite")
))

; Liver Depression with Spleen Deficiency
(assert (SubhealthPattern 
    (pattern-name "Liver Depression with Spleen Deficiency")
    (primary-symptoms 
        "mood.anxiety"         ; Emotional issues
        "physical.digestion"   ; Digestive issues
    )
    (secondary-symptoms 
        "fatigue.physical"     ; Physical fatigue
        "sleep.quality"        ; Poor sleep quality
        "sleep.checkbox.irregular" ; Irregular sleep
        "sleep.checkbox.dream"     ; Frequent dreams
    )
    (lifestyle-factors 
        "lifestyle.work.high"    ; High work pressure
        "lifestyle.diet.poor"    ; Poor diet
    )
    (recommended-herbs "Bupleurum" "White Peony" "Codonopsis" "Atractylodes")
    (description "Emotional stress with digestive issues and fatigue")
))