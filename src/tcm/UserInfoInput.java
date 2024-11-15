package tcm;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class UserInfoInput extends JFrame {
	 	private JPanel contentPanel;
	 	public static HashMap<String, String> userbasic = new HashMap<>();
	 	public static HashMap<String, JCheckBox> userbasicOptions = new HashMap<>();
	    public UserInfoInput() {
	        contentPanel = new JPanel();
	        contentPanel.setLayout(new BoxLayout(contentPanel, BoxLayout.Y_AXIS));

	        addBasicInfoSection("height", "请输入您的身高");
	        addBasicInfoSection("weight", "请输入您的体重");
	        addBasicInfoSection("age", "请输入您的年龄");
	        addMealSkippingSection();
	        addSleepInfoSection();
	    }

	    private void addBasicInfoSection(String title, String placeholder) {
	        JPanel inputPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
	        JLabel label = new JLabel(title + ": ");
	        JTextField textField = new JTextField(20);
	        textField.setToolTipText(placeholder);
	        userbasic.put(title, textField.getText());
	        inputPanel.add(label);
	        inputPanel.add(textField);
	        contentPanel.add(inputPanel);
	    }

	    private void addMealSkippingSection() {
	        JPanel mealPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
	        JLabel label = new JLabel("跳过的餐次 (可多选): ");
	        String[] meals = {"breakfast", "lunch", "dinner"};
	        for (String meal : meals) {
	            JCheckBox checkBox = new JCheckBox(meal);
	            userbasicOptions.put(meal, checkBox);
	            mealPanel.add(checkBox);
	        }
	        contentPanel.add(mealPanel);
	    }

	    private void addSleepInfoSection() {
	        JPanel sleepPanel = new JPanel();
	        sleepPanel.setLayout(new FlowLayout(FlowLayout.LEFT));
	        sleepPanel.add(new JLabel("平均每天睡眠时长 (小时): "));
	        JTextField textField = new JTextField(10);
	        sleepPanel.add(textField);
	        userbasic.put("sleep-hours", textField.getText());

	        sleepPanel.add(new JLabel("是否熬夜: "));
	        JComboBox<String> comboBox = new JComboBox<>(new String[]{"是", "否"});
	        sleepPanel.add(comboBox);
	        userbasic.put("stauy-up", comboBox.getSelectedItem().toString());

	        sleepPanel.add(new JLabel("起夜次数: "));
	        JTextField nightWakeField = new JTextField(10);
	        sleepPanel.add(nightWakeField);
	        userbasic.put("sleep-pattern", nightWakeField.getText());
	        
	        
	        contentPanel.add(sleepPanel);
	    }

	    public JPanel getContentPanel() {
	        return contentPanel;
	    }
//    private Map<String, Object> userInfo = new HashMap<>();
//    
//    public UserInfoInput() {
//        setTitle("用户基本信息输入");
//        setSize(600, 700);
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
//        // 添加基本信息输入项
//        addBasicInfoSection(panel, "身高 (cm)", "请输入您的身高", true);
//        addBasicInfoSection(panel, "体重 (kg)", "请输入您的体重", true);
//        addBasicInfoSection(panel, "年龄", "请输入您的年龄", true);
//
//        // 添加饮食习惯
//        addMealSkippingSection(panel);
//
//        // 添加睡眠习惯
//        addBasicInfoSection(panel, "平均每天睡眠时长 (小时)", "请输入每天睡觉的小时数", true);
//        addDropdownSection(panel, "是否熬夜", new String[]{"是", "否"}, "是否经常熬夜", false);
//        addBasicInfoSection(panel, "起夜次数", "请输入您每晚起夜的次数", false);
//
//        // 提交按钮
//        JButton submitButton = new JButton("提交");
//        submitButton.addActionListener(new ActionListener() {
//            @Override
//            public void actionPerformed(ActionEvent e) {
//                displayUserInfo();
//            }
//        });
//        panel.add(submitButton);
//    }
//
//    private void addBasicInfoSection(JPanel panel, String title, String placeholder, boolean isNumeric) {
//        JPanel inputPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
//        JLabel label = new JLabel(title + ": ");
//        JTextField textField = new JTextField(20);
//        textField.setToolTipText(placeholder);
//        inputPanel.add(label);
//        inputPanel.add(textField);
//        userInfo.put(title, textField);
//        panel.add(inputPanel);
//    }
//
//    private void addDropdownSection(JPanel panel, String title, String[] options, String label, boolean isMandatory) {
//        JPanel dropdownPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
//        JLabel dropdownLabel = new JLabel(label + ": ");
//        JComboBox<String> comboBox = new JComboBox<>(options);
//        dropdownPanel.add(dropdownLabel);
//        dropdownPanel.add(comboBox);
//        userInfo.put(title, comboBox);
//        panel.add(dropdownPanel);
//    }
//
//    private void addMealSkippingSection(JPanel panel) {
//        JPanel mealPanel = new JPanel();
//        mealPanel.setLayout(new BoxLayout(mealPanel, BoxLayout.Y_AXIS));
//        mealPanel.setBorder(BorderFactory.createTitledBorder("饮食习惯"));
//
//        // 跳过哪一顿
//        JLabel mealSkippingLabel = new JLabel("您通常跳过哪些餐（可多选）:");
//        mealPanel.add(mealSkippingLabel);
//
//        JPanel checkBoxPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
//        ArrayList<JCheckBox> mealCheckBoxes = new ArrayList<>();
//        String[] meals = {"早餐", "午餐", "晚餐"};
//        for (String meal : meals) {
//            JCheckBox checkBox = new JCheckBox(meal);
//            checkBoxPanel.add(checkBox);
//            mealCheckBoxes.add(checkBox);
//        }
//
//        userInfo.put("跳过的餐次", mealCheckBoxes);
//        mealPanel.add(checkBoxPanel);
//        panel.add(mealPanel);
//    }
//
//    private void displayUserInfo() {
//        System.out.println("用户基本信息：");
//        for (String key : userInfo.keySet()) {
//            Object component = userInfo.get(key);
//            if (component instanceof JTextField) {
//                JTextField textField = (JTextField) component;
//                System.out.println(key + ": " + textField.getText());
//            } else if (component instanceof JComboBox) {
//                JComboBox<String> comboBox = (JComboBox<String>) component;
//                System.out.println(key + ": " + comboBox.getSelectedItem());
//            } else if (component instanceof ArrayList) {
//                ArrayList<JCheckBox> checkBoxes = (ArrayList<JCheckBox>) component;
//                System.out.print(key + ": ");
//                boolean hasSelection = false;
//                for (JCheckBox checkBox : checkBoxes) {
//                    if (checkBox.isSelected()) {
//                        System.out.print(checkBox.getText() + " ");
//                        hasSelection = true;
//                    }
//                }
//                if (!hasSelection) {
//                    System.out.print("无");
//                }
//                System.out.println();
//            }
//        }
//    }

//    public static void main(String[] args) {
//        SwingUtilities.invokeLater(new Runnable() {
//            @Override
//            public void run() {
//                new UserInfoInput().setVisible(true);
//            }
//        });
//    }
}
