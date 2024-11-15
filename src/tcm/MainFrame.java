package tcm;

import javax.swing.*;
import javax.swing.border.TitledBorder;

import java.awt.*;
import java.util.HashMap;

public class MainFrame extends JFrame {
    private JScrollPane scrollPane;
    private JPanel contentPanel;
    private HashMap<String, Integer> sectionOffsets = new HashMap<>();

    public MainFrame() {
        setTitle("综合信息输入系统");
        setSize(800, 600);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        // 创建左侧导航栏
        String[] sections = {"用户基本信息", "症状描述"};
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

        // 创建内容区域
        contentPanel = new JPanel();
        contentPanel.setLayout(new BoxLayout(contentPanel, BoxLayout.Y_AXIS));

        // 添加滚动视图
        scrollPane = new JScrollPane(contentPanel);
        scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
        add(scrollPane, BorderLayout.CENTER);

        // 添加 UserInfoInputUI 和 EnhancedSymptomInputUI
        addUserInfoInputSection();
        addSymptomInputSection();

        // 计算每部分的偏移量
        SwingUtilities.invokeLater(this::calculateSectionOffsets);
    }

    private void addUserInfoInputSection() {
        UserInfoInput userInfoInputUI = new UserInfoInput();
        JPanel userInfoPanel = new JPanel(new BorderLayout());
        userInfoPanel.setBorder(BorderFactory.createTitledBorder("用户基本信息"));
        userInfoPanel.add(userInfoInputUI.getContentPanel(), BorderLayout.CENTER);
        contentPanel.add(userInfoPanel);
    }

    private void addSymptomInputSection() {
        SimpleSymptomInputUI symptomInputUI = new SimpleSymptomInputUI();
        JPanel symptomPanel = new JPanel(new BorderLayout());
        symptomPanel.setBorder(BorderFactory.createTitledBorder("症状描述"));
        symptomPanel.add(symptomInputUI.getContentPanel(), BorderLayout.CENTER);
        contentPanel.add(symptomPanel);
    }

    private void calculateSectionOffsets() {
        sectionOffsets.clear();
        int yOffset = 0;
        for (Component comp : contentPanel.getComponents()) {
            if (comp instanceof JPanel) {
                JPanel panel = (JPanel) comp;
                String title = ((TitledBorder) panel.getBorder()).getTitle();
                sectionOffsets.put(title, yOffset);
                yOffset += panel.getHeight() + 20; // 加间距
            }
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new MainFrame().setVisible(true));
    }
}
