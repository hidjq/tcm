package tcm;

import javax.swing.*;
import javax.swing.border.TitledBorder;

import jess.Context;
import jess.Fact;
import jess.JessException;
import jess.QueryResult;
import jess.RU;
import jess.Rete;
import jess.Value;
import jess.ValueVector;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.HashMap;
import tcm.i18n.*;

public class MainFrame extends JFrame {
	private final I18nManager i18n = I18nManager.getInstance();
    private JScrollPane scrollPane;
    private JPanel contentPanel;
    private HashMap<String, Integer> sectionOffsets = new HashMap<>();
    private boolean isPatient;
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
    private void refreshUI(Boolean isPatient) {
        // 1. Refresh frame title
        setTitle(i18n.getString("app.title"));

        // 2. Clear content panel
        contentPanel.removeAll();

        // 3. Refresh navigation list with new language
        String[] sections = {
            i18n.getString("section.basic"),
            i18n.getString("section.symptoms")
        };
        if(isPatient) {
        // Find and update the navigation list
        for (Component comp : getContentPane().getComponents()) {
            if (comp instanceof JScrollPane) {
                JScrollPane navScroll = (JScrollPane) comp;
                if (navScroll.getViewport().getView() instanceof JList) {
                    JList<String> navList = (JList<String>) navScroll.getViewport().getView();
                    DefaultListModel<String> model = new DefaultListModel<>();
                    for (String section : sections) {
                        model.addElement(section);
                    }
                    navList.setModel(model);
                }
            }
        }
        }
        // 4. Update language selector label
        for (Component comp : getContentPane().getComponents()) {
            if (comp instanceof JPanel && comp.getParent() == getContentPane()) {
                JPanel topPanel = (JPanel) comp;
                for (Component topComp : topPanel.getComponents()) {
                    if (topComp instanceof JLabel) {
                        ((JLabel) topComp).setText(i18n.getString("language.select"));
                    }
                }
            }
        }

        // 5. Recreate content panels with new language
        HashMap<String, String> userbasic = new HashMap<>();
        
        if(isPatient) {
        	addUserInfoInputSection(userbasic);
        	addSymptomInputSection(userbasic);
        } else {
        	addConditionInputSection(userbasic);
//        	JButton submitButton = new JButton(i18n.getString("button.submit"));
//            submitButton.addActionListener(new ActionListener() {
//                @Override
//                public void actionPerformed(ActionEvent e) {
//                    try {
//                        displayUserInput();
//                    } catch (JessException e1) {
//                        e1.printStackTrace();
//                    }
//                }
//            });
//            contentPanel.add(submitButton);
        }
        // 6. Recalculate section offsets
        SwingUtilities.invokeLater(this::calculateSectionOffsets);

        // 7. Update UI
        revalidate();
        repaint();
    }
    
    public MainFrame(HashMap<String, String> userbasic) {
    	UserTypeSelectionDialog dialog = new UserTypeSelectionDialog(this);
        dialog.setVisible(true);
        
        if (!dialog.isSelectionMade()) {
            System.exit(0);
        }
        
        isPatient = dialog.isPatient();
    	setTitle(i18n.getString("app.title"));
        
        setSize(800, 600);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        // Create the navigation panel on the left
//        String[] sections = {"Basic User Information", "Symptom Description"};
//        String[] sections = {
//        		i18n.getString("section.basic"),
//        		i18n.getString("section.symptoms")
//        };
        String[] sections;
        if (isPatient) {
            sections = new String[]{
                i18n.getString("section.basic"),
                i18n.getString("section.symptoms")
            };
            JList<String> navigationList = new JList<>(sections);
            navigationList.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
            navigationList.addListSelectionListener(e -> {
                if (!e.getValueIsAdjusting()) {
                    String selectedSection = navigationList.getSelectedValue();
                    if (selectedSection != null && sectionOffsets.containsKey(selectedSection)) {
                        int yOffset = sectionOffsets.get(selectedSection);
                        scrollPane.getViewport().setViewPosition(new Point(0, yOffset));
                    }
                }
            });
            JScrollPane navigationScrollPane = new JScrollPane(navigationList);
            navigationScrollPane.setPreferredSize(new Dimension(150, 0));
            add(navigationScrollPane, BorderLayout.WEST);
        }
        
        JPanel topPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT));
        JComboBox<String> languageSelector = new JComboBox<>(i18n.getSupportedLanguages());
        languageSelector.addActionListener(e -> {
            String selectedLanguage = (String) languageSelector.getSelectedItem();
            i18n.setLocale(selectedLanguage);
            refreshUI(isPatient); // You'll need to implement this method
        });
        topPanel.add(new JLabel(i18n.getString("language.select")));
        topPanel.add(languageSelector);
        add(topPanel, BorderLayout.NORTH);
        
        // Create the content area
        contentPanel = new JPanel();
        contentPanel.setLayout(new BoxLayout(contentPanel, BoxLayout.Y_AXIS));

        // Add a scrollable view
        scrollPane = new JScrollPane(contentPanel);
        scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
        add(scrollPane, BorderLayout.CENTER);

        // Add UserInfoInputUI and EnhancedSymptomInputUI
        
        if(isPatient) {
        	addUserInfoInputSection(userbasic);
        	addSymptomInputSection(userbasic);
        } else {
        	addConditionInputSection(userbasic);
//        	JButton submitButton = new JButton(i18n.getString("button.submit"));
//            submitButton.addActionListener(new ActionListener() {
//                @Override
//                public void actionPerformed(ActionEvent e) {
//                    try {
//                        displayUserInput();
//                    } catch (JessException e1) {
//                        e1.printStackTrace();
//                    }
//                }
//            });
//            contentPanel.add(submitButton);
        }

        // Calculate the offset for each section
        SwingUtilities.invokeLater(this::calculateSectionOffsets);
    }
    
    private void displayUserInput() throws JessException {
        Rete engine = new Rete();
        String langSuffix = i18n.getFileSuffix();
        engine.batch("src/template.clp");
        engine.batch("src/prescription"+langSuffix+".clp");
        engine.batch("src/facts" + langSuffix + ".clp");
        engine.batch("src/herb" + langSuffix + ".clp");
        engine.batch("rules" + langSuffix + ".clp");
        Fact userinfo = new Fact("Basic-information", engine);
        try {
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
    private void addUserInfoInputSection(HashMap<String, String> userbasic) {
        UserInfoInput userInfoInputUI = new UserInfoInput();
        JPanel userInfoPanel = new JPanel(new BorderLayout());
        userInfoPanel.setBorder(BorderFactory.createTitledBorder(i18n.getString("section.basic")));
        userInfoPanel.add(userInfoInputUI.getContentPanel(), BorderLayout.CENTER);
        contentPanel.add(userInfoPanel);
    }
    
    private void addConditionInputSection(HashMap<String, String> userbasic) {
    	SubHealthInput subHealthInputUI = new SubHealthInput();
        JPanel subHealthPanel = new JPanel(new BorderLayout());
        subHealthPanel.setBorder(BorderFactory.createTitledBorder(i18n.getString("section.basic")));
        subHealthPanel.add(subHealthInputUI.getContentPanel(), BorderLayout.CENTER);
        contentPanel.add(subHealthPanel);
    }

    private void addSymptomInputSection(HashMap<String, String> userbasic) {
        SimpleSymptomInputUI symptomInputUI = new SimpleSymptomInputUI();
        JPanel symptomPanel = new JPanel(new BorderLayout());
        symptomPanel.setBorder(BorderFactory.createTitledBorder(i18n.getString("section.symptoms")));
        symptomPanel.add(symptomInputUI.getContentPanel(), BorderLayout.CENTER);
        contentPanel.add(symptomPanel);
    }

    private void calculateSectionOffsets() {
        sectionOffsets.clear();
        int yOffset = 0;
        for (Component comp : contentPanel.getComponents()) {
            if (comp instanceof JPanel) {
                JPanel panel = (JPanel) comp;
                if (panel.getBorder() instanceof TitledBorder) {
                    String title = ((TitledBorder) panel.getBorder()).getTitle();
                    if (title != null) {
                        sectionOffsets.put(title, yOffset);
                    }
                }
                yOffset += panel.getHeight() + 20; // Add spacing
            }
        }
    }

    public static void main(String[] args) {
        HashMap<String, String> userbasic = new HashMap<>();
        
        SwingUtilities.invokeLater(() -> new MainFrame(userbasic).setVisible(true));
    }
}
