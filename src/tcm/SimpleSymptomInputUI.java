package tcm;import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import jess.*;

public class SimpleSymptomInputUI extends JFrame {
	
 	private JPanel contentPanel;
    private HashMap<String, JTextField> userInputText = new HashMap<>();
    private HashMap<String, ArrayList<JCheckBox>> userInputOptions = new HashMap<>();

    public SimpleSymptomInputUI() {
        contentPanel = new JPanel();
        contentPanel.setLayout(new BoxLayout(contentPanel, BoxLayout.Y_AXIS));

        // 添加身体部位症状输入项
        addSymptomInputSection(contentPanel, "头部和面部", new String[]{"头痛", "头晕", "眩晕", "耳鸣", "鼻塞", "牙痛", "喉咙疼痛"});
        addSymptomInputSection(contentPanel, "呼吸系统", new String[]{"咳嗽", "气喘", "呼吸困难", "胸闷"});
        addSymptomInputSection(contentPanel, "消化系统", new String[]{"胃痛", "腹痛", "腹泻", "便秘", "呕吐"});
        addSymptomInputSection(contentPanel, "泌尿系统", new String[]{"尿频", "尿痛", "尿血", "排尿困难"});
        addSymptomInputSection(contentPanel, "生殖系统", new String[]{"痛经", "月经不调", "白带异常"});
        addSymptomInputSection(contentPanel, "肌肉骨骼系统", new String[]{"关节痛", "腰背痛", "颈椎痛", "四肢酸痛"});
        addSymptomInputSection(contentPanel, "循环系统", new String[]{"胸痛", "心悸", "浮肿", "中风症状"});
        addSymptomInputSection(contentPanel, "皮肤与淤斑", new String[]{"皮疹", "瘙痒", "紫癜", "淤斑"});
        addSymptomInputSection(contentPanel, "全身症状", new String[]{"发热", "乏力", "盗汗", "虚弱","畏寒"});

        // 提交按钮
        JButton submitButton = new JButton("提交");
        submitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
					displayUserInput();
				} catch (JessException e1) {
					// TODO Auto-generated catch block
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

        // 用户自定义输入
        JLabel label = new JLabel(bodyPart + " 症状描述: ");
        JTextField textField = new JTextField(20);
        JPanel textInputPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        textInputPanel.add(label);
        textInputPanel.add(textField);
        inputPanel.add(textInputPanel);
        userInputText.put(bodyPart, textField);

        // 常见症状复选框
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
    	engine.batch("src/template.clp");
    	engine.batch("src/facts.clp");
    	engine.batch("src/herb.clp");
        System.out.println("用户输入的症状信息：");
        for (String bodyPart : userInputText.keySet()) {
        	Fact input = new Fact("Symptom", engine);
            JTextField textField = userInputText.get(bodyPart);
            input.setSlotValue("body-part",new Value(bodyPart, RU.STRING));
    		input.setSlotValue("user-input",new Value(textField.getText(), RU.STRING));
    		
            ArrayList<JCheckBox> checkBoxes = userInputOptions.get(bodyPart);
            ArrayList<String> selectedSymptoms = new ArrayList<>();
            for (JCheckBox checkBox : checkBoxes) {
                if (checkBox.isSelected()) {
                	selectedSymptoms.add(checkBox.getText());
                }
            }
            ValueVector symptomVector = new ValueVector();
            for (String symptom : selectedSymptoms) {
            	symptomVector.add(new Value(symptom, RU.STRING));
            }
            input.setSlotValue("selected-symptoms", new Value(symptomVector, RU.LIST));
            System.out.println();
            engine.assertFact(input);
        }
        Fact userinfo = new Fact("Basic-information", engine);
        try {
			for (String key : UserInfoInput.userbasic.keySet()) {
				userinfo.setSlotValue(key, new Value(UserInfoInput.userbasic.get(key), RU.INTEGER));
			}
			for(String meal : UserInfoInput.userbasicOptions.keySet()) {
				if(UserInfoInput.userbasicOptions.get(meal).isSelected()) {
					userinfo.setSlotValue(meal, new Value(1, RU.INTEGER));
				} else {
					userinfo.setSlotValue(meal, new Value(0, RU.INTEGER));
				}
			}
		} catch (JessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        engine.eval("(facts)");
    }

    public JPanel getContentPanel() {
        return contentPanel;
    }
}

//    private Map<String, JTextField> userInputText = new HashMap<>();
//    private Map<String, ArrayList<JCheckBox>> userInputOptions = new HashMap<>();
//   
//    public SimpleSymptomInputUI() {
//        setTitle("症状输入系统");
//        setSize(600, 800);
//        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//        setLayout(new BorderLayout());
//
//        // 创建一个滚动面板
//        JPanel panel = new JPanel();
//        panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
//        JScrollPane scrollPane = new JScrollPane(panel);
//        scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
//        add(scrollPane, BorderLayout.CENTER);
//
//        // 添加身体部位症状输入项
//        addSymptomInputSection(panel, "头部和面部", new String[]{"头痛", "头晕", "眩晕", "耳鸣", "鼻塞", "牙痛", "喉咙疼痛"});
//        addSymptomInputSection(panel, "呼吸系统", new String[]{"咳嗽", "气喘", "呼吸困难", "胸闷"});
//        addSymptomInputSection(panel, "消化系统", new String[]{"胃痛", "腹痛", "腹泻", "便秘", "呕吐"});
//        addSymptomInputSection(panel, "泌尿系统", new String[]{"尿频", "尿痛", "尿血", "排尿困难"});
//        addSymptomInputSection(panel, "生殖系统", new String[]{"痛经", "月经不调", "白带异常"});
//        addSymptomInputSection(panel, "肌肉骨骼系统", new String[]{"关节痛", "腰背痛", "颈椎痛", "四肢酸痛"});
//        addSymptomInputSection(panel, "循环系统", new String[]{"胸痛", "心悸", "浮肿", "中风症状"});
//        addSymptomInputSection(panel, "皮肤与淤斑", new String[]{"皮疹", "瘙痒", "紫癜", "淤斑"});
//        addSymptomInputSection(panel, "全身症状", new String[]{"发热", "乏力", "盗汗", "虚弱"});
//
//        // 提交按钮
//        JButton submitButton = new JButton("提交");
//        submitButton.addActionListener(new ActionListener() {
//            @Override
//            public void actionPerformed(ActionEvent e) {
//                displayUserInput();
//            }
//        });
//        panel.add(submitButton);
//    }
//
//    private void addSymptomInputSection(JPanel panel, String bodyPart, String[] commonSymptoms) {
//        JPanel inputPanel = new JPanel();
//        inputPanel.setLayout(new BoxLayout(inputPanel, BoxLayout.Y_AXIS));
//        inputPanel.setBorder(BorderFactory.createTitledBorder(bodyPart));
//
//        // 用户自定义输入
//        JLabel label = new JLabel(bodyPart + " 症状描述: ");
//        JTextField textField = new JTextField(20);
//        JPanel textInputPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
//        textInputPanel.add(label);
//        textInputPanel.add(textField);
//        inputPanel.add(textInputPanel);
//        userInputText.put(bodyPart, textField);
//
//        // 常见症状复选框
//        JPanel checkboxPanel = new JPanel();
//        checkboxPanel.setLayout(new FlowLayout(FlowLayout.LEFT));
//        ArrayList<JCheckBox> checkBoxes = new ArrayList<>();
//        for (String symptom : commonSymptoms) {
//            JCheckBox checkBox = new JCheckBox(symptom);
//            checkboxPanel.add(checkBox);
//            checkBoxes.add(checkBox);
//        }
//        userInputOptions.put(bodyPart, checkBoxes);
//        inputPanel.add(checkboxPanel);
//
//        panel.add(inputPanel);
//    }
//
//    private void displayUserInput() {
//        System.out.println("用户输入的症状信息：");
//        for (String bodyPart : userInputText.keySet()) {
//            JTextField textField = userInputText.get(bodyPart);
//            ArrayList<JCheckBox> checkBoxes = userInputOptions.get(bodyPart);
//
//            System.out.println(bodyPart + " 症状描述: " + textField.getText());
//
//            System.out.println("选择的常见症状：");
//            for (JCheckBox checkBox : checkBoxes) {
//                if (checkBox.isSelected()) {
//                    System.out.println(" - " + checkBox.getText());
//                }
//            }
//            System.out.println();
//        }
//    }
//    
  
//
//    public static void main(String[] args) {
//        SwingUtilities.invokeLater(new Runnable() {
//            @Override
//            public void run() {
//                new SimpleSymptomInputUI().setVisible(true);
//            }
//        });
//    }
