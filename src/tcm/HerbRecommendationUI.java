package tcm;

import javax.imageio.ImageIO;
import javax.swing.*;
import javax.swing.border.TitledBorder;

import jess.*;

import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;

import tcm.i18n.*;

public class HerbRecommendationUI extends JFrame {
    private final I18nManager i18n = I18nManager.getInstance();
    private JPanel contentPanel;
    private String diagnosedDisease;
    private double matchScore;
    private java.util.List<String> recommendedHerbs;
    private java.util.List<String> herbAmounts;
    private String preparationMethod;
    private int timesPerDay;
    private boolean afterMeal;
    
    public HerbRecommendationUI(String disease, double score, 
                               java.util.List<String> herbs, 
                               java.util.List<String> amounts,
                               String preparation, 
                               int times, 
                               boolean isAfterMeal) {
        this.diagnosedDisease = disease;
        this.matchScore = score;
        this.recommendedHerbs = herbs;
        this.herbAmounts = amounts;
        this.preparationMethod = preparation;
        this.timesPerDay = times;
        this.afterMeal = isAfterMeal;
        
        initializeUI();
    }
    private void initializeUI() {
        setTitle(i18n.getString("recommendation.title"));
        setSize(800, 600);  // 增加窗口大小以适应图片
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        
        // 创建主滚动面板
        contentPanel = new JPanel();
        contentPanel.setLayout(new BoxLayout(contentPanel, BoxLayout.Y_AXIS));
        contentPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        
        // 诊断部分
        addDiagnosisPanel();
        
        // 草药部分
        addHerbsPanel();
        
        // 使用说明部分
        addInstructionsPanel();
        
        // 草药图片部分
        addHerbImagesPanel();
        
        // 添加打印按钮
        addPrintButton();
        
        // 添加内容面板到滚动窗格
        JScrollPane scrollPane = new JScrollPane(contentPanel);
        add(scrollPane);
        
        // 居中显示
        setLocationRelativeTo(null);
    }

    private void addDiagnosisPanel() {
        JPanel diagnosisPanel = new JPanel();
        diagnosisPanel.setLayout(new BoxLayout(diagnosisPanel, BoxLayout.Y_AXIS));
        diagnosisPanel.setBorder(BorderFactory.createTitledBorder(
            BorderFactory.createEtchedBorder(),
            i18n.getString("recommendation.diagnosis")
        ));
        
        JLabel diseaseLabel = new JLabel(i18n.getString("recommendation.disease") + ": " + diagnosedDisease);
        JLabel scoreLabel = new JLabel(i18n.getString("recommendation.score") + ": " + 
                                     String.format("%.2f%%", matchScore * 100));
        
        diagnosisPanel.add(createCenteredPanel(diseaseLabel));
        diagnosisPanel.add(Box.createVerticalStrut(5));
        diagnosisPanel.add(createCenteredPanel(scoreLabel));
        
        contentPanel.add(diagnosisPanel);
        contentPanel.add(Box.createVerticalStrut(10));
    }

    private void addHerbsPanel() {
        JPanel herbsPanel = new JPanel();
        herbsPanel.setLayout(new BoxLayout(herbsPanel, BoxLayout.Y_AXIS));
        herbsPanel.setBorder(BorderFactory.createTitledBorder(
            BorderFactory.createEtchedBorder(),
            i18n.getString("recommendation.herbs")
        ));
        
        // 创建药物表格
        String[] columnNames = {
            i18n.getString("recommendation.herb.name"),
            i18n.getString("recommendation.herb.amount")
        };
        
        Object[][] data = new Object[recommendedHerbs.size()][2];
        for (int i = 0; i < recommendedHerbs.size(); i++) {
            data[i][0] = recommendedHerbs.get(i);
            data[i][1] = herbAmounts.get(i) + " " + i18n.getString("recommendation.herb.unit");
        }
        
        JTable herbsTable = new JTable(data, columnNames);
        herbsTable.setEnabled(false);
        JScrollPane tableScrollPane = new JScrollPane(herbsTable);
        tableScrollPane.setPreferredSize(new Dimension(400, 100));
        herbsPanel.add(tableScrollPane);
        
        contentPanel.add(herbsPanel);
        contentPanel.add(Box.createVerticalStrut(10));
    }

    private void addInstructionsPanel() {
        JPanel instructionsPanel = new JPanel();
        instructionsPanel.setLayout(new BoxLayout(instructionsPanel, BoxLayout.Y_AXIS));
        instructionsPanel.setBorder(BorderFactory.createTitledBorder(
            BorderFactory.createEtchedBorder(),
            i18n.getString("recommendation.instructions")
        ));
        
        JLabel preparationLabel = new JLabel(i18n.getString("recommendation.preparation") + ": " + preparationMethod);
        JLabel timesLabel = new JLabel(i18n.getString("recommendation.times") + ": " + 
                                     timesPerDay + " " + i18n.getString("recommendation.times.unit"));
        JLabel mealLabel = new JLabel(i18n.getString("recommendation.timing") + ": " + 
                                    (afterMeal ? i18n.getString("recommendation.after_meal") : 
                                               i18n.getString("recommendation.before_meal")));
        
        instructionsPanel.add(createCenteredPanel(preparationLabel));
        instructionsPanel.add(Box.createVerticalStrut(5));
        instructionsPanel.add(createCenteredPanel(timesLabel));
        instructionsPanel.add(Box.createVerticalStrut(5));
        instructionsPanel.add(createCenteredPanel(mealLabel));
        
        contentPanel.add(instructionsPanel);
        contentPanel.add(Box.createVerticalStrut(10));
    }
    private ResourceBundle imageMapping;
    
    
    private void addHerbImagesPanel() {
        JPanel imagesPanel = new JPanel(new FlowLayout(FlowLayout.CENTER, 10, 10));
        imagesPanel.setBorder(BorderFactory.createTitledBorder(
            BorderFactory.createEtchedBorder(),
            i18n.getString("recommendation.images")
        ));

        // 为每种草药添加图片
        for (String herb : recommendedHerbs) {
            try {
                // 获取图片文件名
                String imageFileName = i18n.getString(herb);
                // 获取当前语言的药材名称
//                String localizedHerbName = i18n.getString("herb.name." + 
//                    herb.toLowerCase().replace(" ", "_"));
                
                String imagePath = "src/tcm/herbs/" + imageFileName;
                System.out.println(imagePath);
                // 加载图片
//                InputStream imageStream = getClass().getResourceAsStream(imagePath);
//                if (imageStream == null) {
//                    throw new IOException("Image not found: " + imagePath);
//                }
                
//                BufferedImage img = ImageIO.read(imageStream);
                ImageIcon imageIcon = new ImageIcon(imagePath);
                // 调整图片大小
//                Image scaledImage = img.getScaledInstance(150, 150, Image.SCALE_SMOOTH);
//                imageIcon = new ImageIcon(scaledImage);
                
                // 创建图片面板
                JPanel herbPanel = new JPanel();
                herbPanel.setLayout(new BoxLayout(herbPanel, BoxLayout.Y_AXIS));
                
                // 添加图片
                JLabel imageLabel = new JLabel(imageIcon);
                imageLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
                herbPanel.add(imageLabel);
                
                // 添加本地化的药材名称
                JLabel nameLabel = new JLabel(herb);
                nameLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
                herbPanel.add(nameLabel);
                imagesPanel.add(herbPanel);
                
            } catch (Exception e) {
                System.err.println("Failed to load image for herb: " + i18n.getString(herb));
                // 创建占位符
                JPanel placeholderPanel = createPlaceholderPanel(i18n.getString(herb));
                imagesPanel.add(placeholderPanel);
            }
        }
        
        contentPanel.add(imagesPanel);
        contentPanel.add(Box.createVerticalStrut(10));
    }
    private JPanel createPlaceholderPanel(String herb) {
        JPanel placeholderPanel = new JPanel();
        placeholderPanel.setLayout(new BoxLayout(placeholderPanel, BoxLayout.Y_AXIS));
        
        JLabel placeholder = new JLabel(i18n.getString("recommendation.image.unavailable"));
        placeholder.setPreferredSize(new Dimension(150, 150));
        placeholder.setBorder(BorderFactory.createLineBorder(Color.GRAY));
        placeholder.setHorizontalAlignment(JLabel.CENTER);
        placeholder.setAlignmentX(Component.CENTER_ALIGNMENT);
        JLabel nameLabel = new JLabel(herb);
        nameLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
        
        placeholderPanel.add(placeholder);
        placeholderPanel.add(nameLabel);
        
        return placeholderPanel;
    }

//    private void initializeUI() {
//        setTitle(i18n.getString("recommendation.title"));
//        setSize(600, 500);
//        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
//        
//        contentPanel = new JPanel();
//        contentPanel.setLayout(new BoxLayout(contentPanel, BoxLayout.Y_AXIS));
//        contentPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
//        
//        // Diagnosis Section
//        JPanel diagnosisPanel = new JPanel();
//        diagnosisPanel.setLayout(new BoxLayout(diagnosisPanel, BoxLayout.Y_AXIS));
//        diagnosisPanel.setBorder(BorderFactory.createTitledBorder(
//            BorderFactory.createEtchedBorder(),
//            i18n.getString("recommendation.diagnosis")
//        ));
//        
//        JLabel diseaseLabel = new JLabel(i18n.getString("recommendation.disease") + ": " + diagnosedDisease);
//        JLabel scoreLabel = new JLabel(i18n.getString("recommendation.score") + ": " + 
//                                     String.format("%.2f%%", matchScore * 100));
//        
//        diagnosisPanel.add(createCenteredPanel(diseaseLabel));
//        diagnosisPanel.add(Box.createVerticalStrut(5));
//        diagnosisPanel.add(createCenteredPanel(scoreLabel));
//        
//        // Herbs Section
//        JPanel herbsPanel = new JPanel();
//        herbsPanel.setLayout(new BoxLayout(herbsPanel, BoxLayout.Y_AXIS));
//        herbsPanel.setBorder(BorderFactory.createTitledBorder(
//            BorderFactory.createEtchedBorder(),
//            i18n.getString("recommendation.herbs")
//        ));
//        
//        // Create herbs table
//        String[] columnNames = {
//            i18n.getString("recommendation.herb.name"),
//            i18n.getString("recommendation.herb.amount")
//        };
//        
//        Object[][] data = new Object[recommendedHerbs.size()][2];
//        for (int i = 0; i < recommendedHerbs.size(); i++) {
//            data[i][0] = recommendedHerbs.get(i);
//            data[i][1] = herbAmounts.get(i) + " " + i18n.getString("recommendation.herb.unit");
//        }
//        
//        JTable herbsTable = new JTable(data, columnNames);
//        herbsTable.setEnabled(false);
//        JScrollPane tableScrollPane = new JScrollPane(herbsTable);
//        tableScrollPane.setPreferredSize(new Dimension(400, 100));
//        herbsPanel.add(tableScrollPane);
//        
//        // Usage Instructions Section
//        JPanel instructionsPanel = new JPanel();
//        instructionsPanel.setLayout(new BoxLayout(instructionsPanel, BoxLayout.Y_AXIS));
//        instructionsPanel.setBorder(BorderFactory.createTitledBorder(
//            BorderFactory.createEtchedBorder(),
//            i18n.getString("recommendation.instructions")
//        ));
//        
//        JLabel preparationLabel = new JLabel(i18n.getString("recommendation.preparation") + ": " + preparationMethod);
//        JLabel timesLabel = new JLabel(i18n.getString("recommendation.times") + ": " + 
//                                     timesPerDay + " " + i18n.getString("recommendation.times.unit"));
//        JLabel mealLabel = new JLabel(i18n.getString("recommendation.timing") + ": " + 
//                                    (afterMeal ? i18n.getString("recommendation.after_meal") : 
//                                               i18n.getString("recommendation.before_meal")));
//        
//        instructionsPanel.add(createCenteredPanel(preparationLabel));
//        instructionsPanel.add(Box.createVerticalStrut(5));
//        instructionsPanel.add(createCenteredPanel(timesLabel));
//        instructionsPanel.add(Box.createVerticalStrut(5));
//        instructionsPanel.add(createCenteredPanel(mealLabel));
//        
//        // Add all sections to main panel
//        contentPanel.add(diagnosisPanel);
//        contentPanel.add(Box.createVerticalStrut(10));
//        contentPanel.add(herbsPanel);
//        contentPanel.add(Box.createVerticalStrut(10));
//        contentPanel.add(instructionsPanel);
//        
//        // Add print button
//        JButton printButton = new JButton(i18n.getString("recommendation.print"));
//        printButton.addActionListener(e -> printPrescription());
//        
//        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.CENTER));
//        buttonPanel.add(printButton);
//        contentPanel.add(Box.createVerticalStrut(10));
//        contentPanel.add(buttonPanel);
//        
//        // Add content panel to frame
//        add(new JScrollPane(contentPanel));
//        
//        // Center on screen
//        setLocationRelativeTo(null);
//    }
    
    private JPanel createCenteredPanel(JComponent component) {
        JPanel panel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        panel.add(component);
        return panel;
    }
    private void addPrintButton() {
        JButton printButton = new JButton(i18n.getString("recommendation.print"));
        printButton.addActionListener(e -> printPrescription());
        
        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.CENTER));
        buttonPanel.add(printButton);
        contentPanel.add(buttonPanel);
    }
    private void printPrescription() {
        // TODO: Implement printing functionality
        JOptionPane.showMessageDialog(this, 
            i18n.getString("recommendation.print.message"),
            i18n.getString("recommendation.print.title"),
            JOptionPane.INFORMATION_MESSAGE);
    }
}