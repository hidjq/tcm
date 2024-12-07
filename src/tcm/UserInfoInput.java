package tcm;

import javax.swing.*;
import javax.swing.border.TitledBorder;
import java.awt.*;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import java.util.HashMap;
import tcm.i18n.*;

public class UserInfoInput extends JFrame {
    private JPanel contentPanel;
    private final I18nManager i18n = I18nManager.getInstance();
    public static HashMap<String, JTextField> userbasic = new HashMap<>();
    public static HashMap<String, JCheckBox> userbasicOptions = new HashMap<>();
    public static HashMap<String, ButtonGroup> userLifestyleChoices = new HashMap<>();
    // Default values (for internal use only)
    private static final String DEFAULT_HEIGHT = "170.0";
    private static final String DEFAULT_WEIGHT = "60.0";
    private static final String DEFAULT_AGE = "20";
    private static final String DEFAULT_SLEEP_HOURS = "8";
    private static final String DEFAULT_WAKEUPS = "0";
    private static final String DEFAULT_STAY_UP = "否";  // Default "No" for staying up late

    public UserInfoInput() {
        contentPanel = new JPanel();
        contentPanel.setLayout(new BoxLayout(contentPanel, BoxLayout.Y_AXIS));
        
        addBasicInfoSection();
        addLifestyleSection();
        addMealSkippingSection();
        addSleepInfoSection();
        
        // Initialize default values in the maps
        initializeDefaultValues();
    }

    private void initializeDefaultValues() {
        // Only add values to maps if fields are empty when needed
        userbasic.putIfAbsent("height", new JTextField(DEFAULT_HEIGHT));
        userbasic.putIfAbsent("weight", new JTextField(DEFAULT_WEIGHT));
        userbasic.putIfAbsent("age", new JTextField(DEFAULT_AGE));
        userbasic.putIfAbsent("sleep-hours", new JTextField(DEFAULT_SLEEP_HOURS));
        userbasic.putIfAbsent("sleep-pattern", new JTextField(DEFAULT_WAKEUPS));
        userbasic.putIfAbsent("stay-up", new JTextField(DEFAULT_STAY_UP));
    }

    private void addBasicInfoSection() {
        JPanel basicInfoPanel = new JPanel();
        basicInfoPanel.setLayout(new BoxLayout(basicInfoPanel, BoxLayout.Y_AXIS));
        basicInfoPanel.setBorder(BorderFactory.createTitledBorder(
            BorderFactory.createEtchedBorder(), 
            i18n.getString("section.basic")
        ));

        addInputField(basicInfoPanel, i18n.getString("basic.height"), "height");
        addInputField(basicInfoPanel, i18n.getString("basic.weight"), "weight");
        addInputField(basicInfoPanel, i18n.getString("basic.age"), "age");

        contentPanel.add(basicInfoPanel);
    }

    private void addInputField(JPanel panel, String labelText, String fieldName) {
        JPanel inputPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        JLabel label = new JLabel(labelText + ": ");
        JTextField textField = new JTextField(20);
        textField.addFocusListener(new FocusAdapter() {
            @Override
            public void focusLost(FocusEvent e) {
                String input = textField.getText().trim();
                if (!input.isEmpty()) {
                    userbasic.put(fieldName, textField);
                }
            }
        });
        
//        userbasic.put(fieldName, textField);
        inputPanel.add(label);
        inputPanel.add(textField);
        panel.add(inputPanel);
    }

    private void addMealSkippingSection() {
        JPanel mealPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        mealPanel.setBorder(BorderFactory.createTitledBorder(
            BorderFactory.createEtchedBorder(),
            i18n.getString("basic.meals")
        ));

        String[] meals = {
            i18n.getString("basic.meals.breakfast"),
            i18n.getString("basic.meals.lunch"),
            i18n.getString("basic.meals.dinner")
        };
        
        String[] meals_key = {
                "breakfast",
                "lunch",
                "dinner"
            };

        for (int i=0; i<3; i++) {
            JCheckBox checkBox = new JCheckBox(meals[i]);
            userbasicOptions.put(meals_key[i], checkBox);
            mealPanel.add(checkBox);
        }

        contentPanel.add(mealPanel);
    }

    private void addSleepInfoSection() {
        JPanel sleepPanel = new JPanel();
        sleepPanel.setLayout(new GridBagLayout());
        sleepPanel.setBorder(BorderFactory.createTitledBorder(
            BorderFactory.createEtchedBorder(),
            "Sleep Information"
        ));

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.anchor = GridBagConstraints.WEST;
        gbc.insets = new Insets(5, 5, 5, 5);

        // Sleep duration
        gbc.gridx = 0;
        gbc.gridy = 0;
        sleepPanel.add(new JLabel(i18n.getString("basic.sleep.duration")), gbc);

        gbc.gridx = 1;
        JTextField sleepField = new JTextField(10);
        sleepField.addFocusListener(new FocusAdapter() {
            @Override
            public void focusLost(FocusEvent e) {
                String input = sleepField.getText().trim();
                if (!input.isEmpty()) {
                    userbasic.put("sleep-hours", sleepField);
                }
            }
        });
        sleepPanel.add(sleepField, gbc);
//        userbasic.put("sleep-hours", sleepField);

        // Stay up late selection
        gbc.gridx = 0;
        gbc.gridy = 1;
        sleepPanel.add(new JLabel(i18n.getString("basic.sleep.late")), gbc);

        gbc.gridx = 1;
        JComboBox<String> comboBox = new JComboBox<>(new String[]{
            i18n.getString("basic.sleep.stayup"),
            i18n.getString("basic.sleep.notstayup")
        });
        sleepPanel.add(comboBox, gbc);
        
        comboBox.addActionListener(e -> {
            String selected = comboBox.getSelectedItem().toString();
            userbasic.put(i18n.getString("key.stayup"), new JTextField(selected));
        });

        // Night wakeups
        gbc.gridx = 0;
        gbc.gridy = 2;
        sleepPanel.add(new JLabel(i18n.getString("basic.sleep.wakeup")), gbc);

        gbc.gridx = 1;
        JTextField wakeupField = new JTextField(10);
        wakeupField.addFocusListener(new FocusAdapter() {
            @Override
            public void focusLost(FocusEvent e) {
                String input = wakeupField.getText().trim();
                if (!input.isEmpty()) {
                    userbasic.put(i18n.getString("key.sleep-pattern"), wakeupField);
                }
            }
        });
        sleepPanel.add(wakeupField, gbc);
//        userbasic.put("sleep-pattern", wakeupField);

        contentPanel.add(sleepPanel);
    }

    public JPanel getContentPanel() {
        return contentPanel;
    }
    
    private void addLifestyleSection() {
        JPanel lifestylePanel = new JPanel();
        lifestylePanel.setLayout(new BoxLayout(lifestylePanel, BoxLayout.Y_AXIS));
        lifestylePanel.setBorder(BorderFactory.createTitledBorder(
            BorderFactory.createEtchedBorder(),
            i18n.getString("basic.lifestyle")
        ));

        // Exercise Frequency
        JPanel exercisePanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        exercisePanel.add(new JLabel(i18n.getString("basic.lifestyle.exercise") + ": "));
        ButtonGroup exerciseGroup = new ButtonGroup();
        String[] exerciseOptions = {
            i18n.getString("basic.lifestyle.exercise.none"),
            i18n.getString("basic.lifestyle.exercise.occasional"),
            i18n.getString("basic.lifestyle.exercise.regular"),
            i18n.getString("basic.lifestyle.exercise.frequent")
        };
        addRadioButtons(exercisePanel, exerciseGroup, exerciseOptions);
        userLifestyleChoices.put("exercise", exerciseGroup);
        lifestylePanel.add(exercisePanel);

        // Diet Type
        JPanel dietPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        dietPanel.add(new JLabel(i18n.getString("basic.lifestyle.diet") + ": "));
        ButtonGroup dietGroup = new ButtonGroup();
        String[] dietOptions = {
            i18n.getString("basic.lifestyle.diet.balanced"),
            i18n.getString("basic.lifestyle.diet.meat"),
            i18n.getString("basic.lifestyle.diet.irregular"),
            i18n.getString("basic.lifestyle.diet.overeating"),
            i18n.getString("basic.lifestyle.diet.highsalt"),
            i18n.getString("basic.lifestyle.diet.highsugar"),
        };
        addRadioButtons(dietPanel, dietGroup, dietOptions);
        userLifestyleChoices.put("diet", dietGroup);
        lifestylePanel.add(dietPanel);

        // Smoking Status
        JPanel smokingPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        smokingPanel.add(new JLabel(i18n.getString("basic.lifestyle.smoking") + ": "));
        ButtonGroup smokingGroup = new ButtonGroup();
        String[] smokingOptions = {
            i18n.getString("basic.lifestyle.smoking.none"),
            i18n.getString("basic.lifestyle.smoking.occasional"),
            i18n.getString("basic.lifestyle.smoking.regular"),
            i18n.getString("basic.lifestyle.smoking.heavy")
        };
        addRadioButtons(smokingPanel, smokingGroup, smokingOptions);
        userLifestyleChoices.put("smoking", smokingGroup);
        lifestylePanel.add(smokingPanel);

        contentPanel.add(lifestylePanel);
    }
    private void addRadioButtons(JPanel panel, ButtonGroup group, String[] options) {
        for (String option : options) {
            JRadioButton button = new JRadioButton(option);
            group.add(button);
            panel.add(button);
            // Select the first option by default
            if (group.getSelection() == null) {
                button.setSelected(true);
            }
        }
    }
    

    // Method to get value with default fallback
    public String getValue(String key) {
        JTextField field = userbasic.get(key);
        String value = field.getText().trim();
        if (value.isEmpty()) {
            switch (key) {
                case "height": return String.valueOf(DEFAULT_HEIGHT);
                case "weight": return String.valueOf(DEFAULT_WEIGHT);
                case "age": return String.valueOf(DEFAULT_AGE);
                case "sleep-hours": return String.valueOf(DEFAULT_SLEEP_HOURS);
                case "sleep-pattern": return String.valueOf(DEFAULT_WAKEUPS);
                case "stay-up": return DEFAULT_STAY_UP;
                default: return "";
            }
        }
        return value;
    }
}