package tcm;

import javax.swing.*;
import javax.swing.border.TitledBorder;

import jess.*;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import tcm.i18n.*;

public class SubHealthInput extends JFrame {
    private JPanel contentPanel;
    private final I18nManager i18n = I18nManager.getInstance();
    public static HashMap<String, JSlider> symptomSliders = new HashMap<>();
    public static HashMap<String, JTextArea> additionalInfo = new HashMap<>();
    public static HashMap<String, ArrayList<JCheckBox>> sleepCheckboxes = new HashMap<>();

    public SubHealthInput() {
        contentPanel = new JPanel();
        contentPanel.setLayout(new BoxLayout(contentPanel, BoxLayout.Y_AXIS));
        
        // Add fatigue section
        addFatigueSection();
        
        // Add sleep section
        addSleepSection();
        
        // Add mood section
        addMoodSection();
        
        // Add physical discomfort section
        addPhysicalDiscomfortSection();
        
        // Add lifestyle section
        addLifestyleSection();
        
        // Add additional notes section
//        addNotesSection();
        
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
    private void displayUserInput() throws JessException {
        Rete engine = new Rete();

        engine.eval("(watch rules)");
        engine.eval("(watch facts)");
        String langSuffix = i18n.getFileSuffix();
        engine.batch("src/template_subhealth.clp");
        engine.batch("src/template.clp");
        engine.batch("src/subhealth_pattern"+langSuffix+".clp");
        engine.batch("src/prescription"+langSuffix+".clp");
        engine.batch("src/facts" + langSuffix + ".clp");
        engine.batch("src/herb" + langSuffix + ".clp");
        engine.batch("src/subhealth.clp");
        for (String symptomKey : symptomSliders.keySet()) {
            JSlider slider = symptomSliders.get(symptomKey);
            engine.assertString(String.format(
                "(SubhealthSymptom (category \"%s\") (symptom-name \"%s\") (severity %d))",
                getCategory(symptomKey),
                symptomKey.replace("subhealth.",""),
                slider.getValue()
            ));
        }
        for (Map.Entry<String, ArrayList<JCheckBox>> entry : sleepCheckboxes.entrySet()) {
            for (JCheckBox checkBox : entry.getValue()) {
                if (checkBox.isSelected()) {
                    String symptomName = checkBox.getText();
                    engine.assertString(String.format(
                        "(SubhealthSymptom (category \"sleep\") (symptom-name \"sleep.checkbox.%s\") (severity 10))",
                        symptomName.toLowerCase()
                    ));
                }
            }
        }
        engine.run();
        engine.eval("(facts)");
        
        processResults(engine);
    }
    private String getCategory(String symptomKey) {
        // 疲劳相关症状
        if (symptomKey.startsWith("subhealth.fatigue.")) {
            return "fatigue";
        }
        // 睡眠相关症状
        else if (symptomKey.startsWith("subhealth.sleep.")) {
            return "sleep";
        }
        // 情绪相关症状
        else if (symptomKey.startsWith("subhealth.mood.")) {
            return "mood";
        }
        // 身体不适症状
        else if (symptomKey.startsWith("subhealth.physical.")) {
            return "physical";
        }
        // 生活方式相关
        else if (symptomKey.startsWith("subhealth.lifestyle.")) {
            return "lifestyle";
        }
        // 默认分类
        return "other";
    }
    
    private void processResults(Rete engine) throws JessException {
        Context context = engine.getGlobalContext();
        QueryResult results = engine.runQueryStar("get-matched-patterns", new ValueVector());
        
        ArrayList<String> patterns = new ArrayList<>();
        ArrayList<String> herbs = new ArrayList<>();
        ArrayList<String> amounts = new ArrayList<>();
        double highestScore = 0;
        String pattern = "";
        while (results.next()) {
            String patternName = results.get("name").stringValue(context);
            double score = results.get("score").floatValue(context);
            Value herbsValue = results.get("herbs");
            ValueVector herbsList = herbsValue.listValue(context);
            if (score > highestScore) {
            	herbs = new ArrayList<>();
                highestScore = score;
                pattern = patternName;
                for (int i = 0; i < herbsList.size(); i++) {
                    Value herbValue = herbsList.get(i);
                    herbs.add(herbValue.stringValue(context));
                    amounts.add("9g"); // 默认剂量
                }
            }
            
            patterns.add(patternName);
        }

        if (!pattern.equals("")) {
            // 创建并显示建议界面
            HerbRecommendationUI recommendationUI = new HerbRecommendationUI(
                pattern,  // 模式名称用顿号分隔
                highestScore,
                herbs,
                amounts,
                i18n.getString("subhealth.prepartion"),   // 默认服用方法
                2,        // 默认每天服用次数
                true      // 默认饭后服用
            );
            recommendationUI.setVisible(true);
        } else {
            // 如果没有找到匹配的模式，显示提示信息
            JOptionPane.showMessageDialog(this,
                i18n.getString("subhealth.no.pattern"),
                i18n.getString("subhealth.diagnosis.title"),
                JOptionPane.INFORMATION_MESSAGE);
        }
    }

    private void addFatigueSection() {
        JPanel panel = createSectionPanel(i18n.getString("subhealth.fatigue.title"));
        
        // Add fatigue types with sliders
        String[] fatigueTypes = {
            "subhealth.fatigue.physical",
            "subhealth.fatigue.mental",
            "subhealth.fatigue.morning"
        };
        
        for (String type : fatigueTypes) {
            addSymptomSlider(panel, type);
        }
        
        contentPanel.add(panel);
        addVerticalSpace();
    }

    private void addSleepSection() {
        JPanel panel = createSectionPanel(i18n.getString("subhealth.sleep.title"));
        
        // Add sleep issues with sliders
        String[] sleepIssues = {
            "subhealth.sleep.difficulty",
            "subhealth.sleep.quality",
            "subhealth.sleep.duration",
            "subhealth.sleep.waking"
        };
        
        for (String issue : sleepIssues) {
            addSymptomSlider(panel, issue);
        }
        
        // Add specific sleep problems checkboxes
        JPanel checkboxPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        String[] specificIssues = {
            "subhealth.sleep.dream",
            "subhealth.sleep.snore",
            "subhealth.sleep.irregular"
        };
        
//        for (String issue : specificIssues) {
//            JCheckBox checkBox = new JCheckBox(i18n.getString(issue));
//            checkboxPanel.add(checkBox);
//        }
        ArrayList<JCheckBox> checkBoxes = new ArrayList<>();
        for (String issue : specificIssues) {
            JCheckBox checkBox = new JCheckBox(i18n.getString(issue));
            checkBoxes.add(checkBox);
            checkboxPanel.add(checkBox);
        }
        sleepCheckboxes.put("sleep", checkBoxes);
        panel.add(checkboxPanel);
        contentPanel.add(panel);
        addVerticalSpace();
    }

    private void addMoodSection() {
        JPanel panel = createSectionPanel(i18n.getString("subhealth.mood.title"));
        
        // Add mood symptoms with sliders
        String[] moodTypes = {
            "subhealth.mood.anxiety",
            "subhealth.mood.irritability",
            "subhealth.mood.depression",
            "subhealth.mood.stress"
        };
        
        for (String type : moodTypes) {
            addSymptomSlider(panel, type);
        }
        
        contentPanel.add(panel);
        addVerticalSpace();
    }

    private void addPhysicalDiscomfortSection() {
        JPanel panel = createSectionPanel(i18n.getString("subhealth.physical.title"));
        
        // Add physical discomfort types with sliders
        String[] discomfortTypes = {
            "subhealth.physical.digestion",
            "subhealth.physical.headache",
            "subhealth.physical.muscle",
            "subhealth.physical.coldHands",
            "subhealth.physical.dryness"
        };
        
        for (String type : discomfortTypes) {
            addSymptomSlider(panel, type);
        }
        
        contentPanel.add(panel);
        addVerticalSpace();
    }

    private void addLifestyleSection() {
        JPanel panel = createSectionPanel(i18n.getString("subhealth.lifestyle.title"));
        
        // Add lifestyle factors with radio buttons
        String[] factors = {
            "subhealth.lifestyle.exercise",
            "subhealth.lifestyle.diet",
            "subhealth.lifestyle.work",
            "subhealth.lifestyle.screen"
        };
        
        for (String factor : factors) {
            JPanel subPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
            subPanel.add(new JLabel(i18n.getString(factor)));
            
            ButtonGroup group = new ButtonGroup();
            String[] levels = {"low", "medium", "high"};
            
            for (String level : levels) {
                JRadioButton radio = new JRadioButton(i18n.getString("subhealth.level." + level));
                group.add(radio);
                subPanel.add(radio);
            }
            
            panel.add(subPanel);
        }
        
        contentPanel.add(panel);
        addVerticalSpace();         
    }

//    private void addNotesSection() {
//        JPanel panel = createSectionPanel(i18n.getString("subhealth.notes.title"));
//        
//        JTextArea notesArea = new JTextArea(4, 30);
//        notesArea.setLineWrap(true);
//        notesArea.setWrapStyleWord(true);
//        JScrollPane scrollPane = new JScrollPane(notesArea);
//        
//        panel.add(new JLabel(i18n.getString("subhealth.notes.prompt")));
//        panel.add(scrollPane);
//        
//        additionalInfo.put("notes", notesArea);
//        
//        contentPanel.add(panel);
//    }

    private JPanel createSectionPanel(String title) {
        JPanel panel = new JPanel();
        panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
        panel.setBorder(BorderFactory.createTitledBorder(
            BorderFactory.createEtchedBorder(),
            title
        ));
        return panel;
    }

    private void addSymptomSlider(JPanel panel, String symptomKey) {
        JPanel sliderPanel = new JPanel(new BorderLayout());
        JLabel label = new JLabel(i18n.getString(symptomKey));
        
        JSlider slider = new JSlider(0, 10, 0);
        slider.setMajorTickSpacing(2);
        slider.setMinorTickSpacing(1);
        slider.setPaintTicks(true);
        slider.setPaintLabels(true);
        slider.setPreferredSize(new Dimension(200, 50));
        
        symptomSliders.put(symptomKey, slider);
        
        sliderPanel.add(label, BorderLayout.WEST);
        sliderPanel.add(slider, BorderLayout.CENTER);
        panel.add(sliderPanel);
    }

    private void addVerticalSpace() {
        contentPanel.add(Box.createVerticalStrut(10));
    }

    public JPanel getContentPanel() {
        return contentPanel;
    }
}