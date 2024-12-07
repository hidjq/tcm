package tcm;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import jess.*;
import tcm.i18n.*;

public class SimpleSymptomInputUI extends JFrame {
	private final I18nManager i18n = I18nManager.getInstance();
	
    private JPanel contentPanel;
    private HashMap<String, JTextField> userInputText = new HashMap<>();
    private HashMap<String, ArrayList<JCheckBox>> userInputOptions = new HashMap<>();

    public SimpleSymptomInputUI() {
        contentPanel = new JPanel();
        contentPanel.setLayout(new BoxLayout(contentPanel, BoxLayout.Y_AXIS));

        // Add symptom input sections for body parts
//        addSymptomInputSection(contentPanel, "Head and Face", new String[]{"Headache", "Dizziness", "Vertigo", "Tinnitus", "Nasal Congestion", "Toothache", "Sore Throat"});
//        addSymptomInputSection(contentPanel, "Respiratory System", new String[]{"Cough", "Shortness of Breath", "Difficulty Breathing", "Chest Tightness"});
//        addSymptomInputSection(contentPanel, "Digestive System", new String[]{"Stomach Pain", "Abdominal Pain", "Diarrhea", "Constipation", "Vomiting"});
//        addSymptomInputSection(contentPanel, "Urinary System", new String[]{"Frequent Urination", "Painful Urination", "Blood in Urine", "Difficulty Urinating"});
//        addSymptomInputSection(contentPanel, "Reproductive System", new String[]{"Menstrual Pain", "Irregular Menstruation", "Abnormal Vaginal Discharge"});
//        addSymptomInputSection(contentPanel, "Musculoskeletal System", new String[]{"Joint Pain", "Lower Back Pain", "Neck Pain", "Limb Soreness"});
//        addSymptomInputSection(contentPanel, "Circulatory System", new String[]{"Chest Pain", "Palpitations", "Swelling", "Stroke Symptoms"});
//        addSymptomInputSection(contentPanel, "Skin and Bruising", new String[]{"Rash", "Itching", "Purpura", "Bruising"});
//        addSymptomInputSection(contentPanel, "General Symptoms", new String[]{"Fever", "Fatigue", "Night Sweats", "Weakness", "Chills"});
        addSymptomInputSection(contentPanel, 
                i18n.getString("symptoms.head"),
                new String[]{
                    i18n.getString("symptoms.head.headache"),
                    i18n.getString("symptoms.head.dizziness"),
                    i18n.getString("symptoms.head.vertigo"),
                    i18n.getString("symptoms.head.tinnitus"),
                    i18n.getString("symptoms.head.nasal"),
                    i18n.getString("symptoms.head.toothache"),
                    i18n.getString("symptoms.head.sore_throat")
                }
            );

            addSymptomInputSection(contentPanel, 
                i18n.getString("symptoms.respiratory"),
                new String[]{
                    i18n.getString("symptoms.respiratory.cough"),
                    i18n.getString("symptoms.respiratory.breath_short"),
                    i18n.getString("symptoms.respiratory.breath_difficult"),
                    i18n.getString("symptoms.respiratory.chest_tight")
                }
            );

            addSymptomInputSection(contentPanel, 
                i18n.getString("symptoms.digestive"),
                new String[]{
                    i18n.getString("symptoms.digestive.stomach_pain"),
                    i18n.getString("symptoms.digestive.abdominal_pain"),
                    i18n.getString("symptoms.digestive.diarrhea"),
                    i18n.getString("symptoms.digestive.constipation"),
                    i18n.getString("symptoms.digestive.vomiting")
                }
            );

            addSymptomInputSection(contentPanel, 
                i18n.getString("symptoms.urinary"),
                new String[]{
                    i18n.getString("symptoms.urinary.frequent"),
                    i18n.getString("symptoms.urinary.pain"),
                    i18n.getString("symptoms.urinary.blood"),
                    i18n.getString("symptoms.urinary.difficult")
                }
            );

            addSymptomInputSection(contentPanel, 
                i18n.getString("symptoms.reproductive"),
                new String[]{
                    i18n.getString("symptoms.reproductive.menstrual_pain"),
                    i18n.getString("symptoms.reproductive.irregular"),
                    i18n.getString("symptoms.reproductive.discharge")
                }
            );

            addSymptomInputSection(contentPanel, 
                i18n.getString("symptoms.musculoskeletal"),
                new String[]{
                    i18n.getString("symptoms.musculoskeletal.joint"),
                    i18n.getString("symptoms.musculoskeletal.back"),
                    i18n.getString("symptoms.musculoskeletal.neck"),
                    i18n.getString("symptoms.musculoskeletal.limb")
                }
            );

            addSymptomInputSection(contentPanel, 
                i18n.getString("symptoms.circulatory"),
                new String[]{
                    i18n.getString("symptoms.circulatory.chest_pain"),
                    i18n.getString("symptoms.circulatory.palpitations"),
                    i18n.getString("symptoms.circulatory.swelling"),
                    i18n.getString("symptoms.circulatory.stroke")
                }
            );

            addSymptomInputSection(contentPanel, 
                i18n.getString("symptoms.skin"),
                new String[]{
                    i18n.getString("symptoms.skin.rash"),
                    i18n.getString("symptoms.skin.itching"),
                    i18n.getString("symptoms.skin.purpura"),
                    i18n.getString("symptoms.skin.bruising")
                }
            );

            addSymptomInputSection(contentPanel, 
                i18n.getString("symptoms.general"),
                new String[]{
                    i18n.getString("symptoms.general.fever"),
                    i18n.getString("symptoms.general.fatigue"),
                    i18n.getString("symptoms.general.sweating"),
                    i18n.getString("symptoms.general.weakness"),
                    i18n.getString("symptoms.general.chills")
                }
            );
        // Submit button
        JButton submitButton = new JButton(i18n.getString("button.submit"));
        submitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    displayUserInput();
                } catch (JessException e1) {
                    e1.printStackTrace();
                }
            }
        });
        contentPanel.add(submitButton);
    }

    private void addSymptomInputSection(JPanel panel, String bodyPart, String[] commonSymptoms) {
        JPanel inputPanel = new JPanel();
        inputPanel.setLayout(new BoxLayout(inputPanel, BoxLayout.Y_AXIS));
        inputPanel.setBorder(BorderFactory.createTitledBorder(bodyPart));

        // Custom symptom description input
        JLabel label = new JLabel(bodyPart);
//        JTextField textField = new JTextField(20);
        JPanel textInputPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        textInputPanel.add(label);
//        textInputPanel.add(textField);
        inputPanel.add(textInputPanel);
//        userInputText.put(bodyPart, textField);

        // Common symptoms checkboxes
        JPanel checkboxPanel = new JPanel();
        checkboxPanel.setLayout(new FlowLayout(FlowLayout.LEFT));
        ArrayList<JCheckBox> checkBoxes = new ArrayList<>();
        for (String symptom : commonSymptoms) {
            JCheckBox checkBox = new JCheckBox(symptom);
            checkboxPanel.add(checkBox);
            checkBoxes.add(checkBox);
        }
        userInputOptions.put(bodyPart, checkBoxes);
        inputPanel.add(checkboxPanel);

        panel.add(inputPanel);
    }

    private void displayUserInput() throws JessException {
        Rete engine = new Rete();
        String langSuffix = i18n.getFileSuffix();
        engine.batch("src/template.clp");
        engine.batch("src/prescription"+langSuffix+".clp");
        engine.batch("src/facts" + langSuffix + ".clp");
        engine.batch("src/herb" + langSuffix + ".clp");
        engine.batch("rules" + langSuffix + ".clp");
        for (String bodyPart : userInputOptions.keySet()) {
            Fact input = new Fact("Symptom", engine);
//            JTextField textField = userInputText.get(bodyPart);
            input.setSlotValue("body-part", new Value(bodyPart, RU.STRING));
//            input.setSlotValue("user-input", new Value(textField.getText(), RU.STRING));

            ArrayList<JCheckBox> checkBoxes = userInputOptions.get(bodyPart);
            ArrayList<String> selectedSymptoms = new ArrayList<>();
            for (JCheckBox checkBox : checkBoxes) {
                if (checkBox.isSelected()) {
                	System.out.println(checkBox.getText());
                	System.out.println("WHaiufhnuaigo");
                    selectedSymptoms.add(checkBox.getText());
                }
            }
            ValueVector symptomVector = new ValueVector();
            for (String symptom : selectedSymptoms) {
            	System.out.println(symptom);
                symptomVector.add(new Value(symptom, RU.STRING));
            }
            input.setSlotValue("selected-symptoms", new Value(symptomVector, RU.LIST));
            engine.assertFact(input);
        }
        Fact userinfo = new Fact("Basic-information", engine);
        try {
        	for(String groupKey : UserInfoInput.userLifestyleChoices.keySet()) {
            	ButtonGroup group = UserInfoInput.userLifestyleChoices.get(groupKey);
                for (java.util.Enumeration<AbstractButton> buttons = group.getElements(); buttons.hasMoreElements();) {
                    AbstractButton button = buttons.nextElement();
                    if (button.isSelected()) {
                         userinfo.setSlotValue(groupKey, new Value(button.getText()));
                    }
                }
            }
            for (String key : UserInfoInput.userbasic.keySet()) {
                System.out.println(key);
                System.out.println(UserInfoInput.userbasic.get(key).getText());
                if (key.equals(i18n.getString("key.stayup"))) {
                	if (UserInfoInput.userbasic.get(key).getText().equals(i18n.getString("basic.sleep.stayup"))) {
                		System.out.println(i18n.getString("value.stayup"));
                        userinfo.setSlotValue(key, new Value(i18n.getString("value.stayup"), RU.STRING));
                    } else {
                        userinfo.setSlotValue(key, new Value("Not Staying Up Late", RU.STRING));
                    }
                } else {
                    userinfo.setSlotValue(key, new Value(Float.parseFloat(UserInfoInput.userbasic.get(key).getText()), RU.FLOAT));
                }
            }
            for (String meal : UserInfoInput.userbasicOptions.keySet()) {
                if (UserInfoInput.userbasicOptions.get(meal).isSelected()) {
                    userinfo.setSlotValue(meal, new Value(1, RU.INTEGER));
                } else {
                    userinfo.setSlotValue(meal, new Value(0, RU.INTEGER));
                }
            }
            engine.assertFact(userinfo);
        } catch (JessException e) {
            e.printStackTrace();
        }
        engine.run();
        engine.eval("(facts)");
        
        processResults(engine);
    }
    private void processResults(Rete engine) throws JessException {
        Context context = engine.getGlobalContext();

        // 获取最高分的疾病
        QueryResult diseaseFact = engine.runQueryStar("get-highest-disease", new ValueVector());
        
        if (diseaseFact.next()) {
            String disease = diseaseFact.get("disease-highest").stringValue(context);//getslotValue("disease-highest");
            double score = diseaseFact.get("score-highest").floatValue(context);
            System.out.println(disease);
            // 获取处方详情
            ArrayList<String> herbs = new ArrayList<>();
            ArrayList<String> amounts = new ArrayList<>();
            
            QueryResult herbsFacts = engine.runQueryStar("get-chosen-herbs", new ValueVector());
            while (herbsFacts.next()) {
                herbs.add(herbsFacts.get("herb-name").stringValue(context));
                amounts.add(herbsFacts.get("amount").stringValue(context));
            }
            
            // 获取用药方法
            QueryResult prepFact = engine.runQueryStar("get-preparation-method", new ValueVector());
            if (prepFact.next()) {
                String preparation = prepFact.get("preparation").stringValue(context);
                int timesPerDay = (int)prepFact.get("times-a-day").floatValue(context);
                boolean afterMeal = prepFact.get("after-meal-or-not").intValue(context) == 1;
                
                // 创建并显示结果界面
                HerbRecommendationUI recommendationUI = new HerbRecommendationUI(
                    disease,
                    score,
                    herbs,
                    amounts,
                    preparation,
                    timesPerDay,
                    afterMeal
                );
                recommendationUI.setVisible(true);
            } else {
                // 如果没有找到制备方法，显示错误消息
                JOptionPane.showMessageDialog(this,
                    i18n.getString("error.no.preparation"),
                    i18n.getString("error.title"),
                    JOptionPane.ERROR_MESSAGE);
            }
        } else {
            // 如果没有找到诊断结果，显示错误消息
            JOptionPane.showMessageDialog(this,
                i18n.getString("error.no.diagnosis"),
                i18n.getString("error.title"),
                JOptionPane.ERROR_MESSAGE);
        }
    }
    public JPanel getContentPanel() {
        return contentPanel;
    }
}



