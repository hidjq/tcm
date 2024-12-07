package tcm;

import javax.swing.*;
import java.awt.*;
import tcm.i18n.*;

public class UserTypeSelectionDialog extends JDialog {
    private boolean selectionMade = false;
    private boolean isPatient = false;
    private final I18nManager i18n = I18nManager.getInstance();

    public UserTypeSelectionDialog(Frame owner) {
        super(owner, true);
        setTitle(i18n.getString("dialog.usertype.title"));
        setLayout(new BorderLayout(10, 10));
        setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);

        JPanel contentPanel = new JPanel();
        contentPanel.setLayout(new BoxLayout(contentPanel, BoxLayout.Y_AXIS));
        contentPanel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));

        JLabel questionLabel = new JLabel(i18n.getString("dialog.usertype.question"));
        questionLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
        contentPanel.add(questionLabel);
        contentPanel.add(Box.createVerticalStrut(20));

        JButton patientButton = new JButton(i18n.getString("dialog.usertype.patient"));
        JButton healthyButton = new JButton(i18n.getString("dialog.usertype.healthy"));

        patientButton.setAlignmentX(Component.CENTER_ALIGNMENT);
        healthyButton.setAlignmentX(Component.CENTER_ALIGNMENT);

        patientButton.addActionListener(e -> {
            isPatient = true;
            selectionMade = true;
            dispose();
        });

        healthyButton.addActionListener(e -> {
            isPatient = false;
            selectionMade = true;
            dispose();
        });

        contentPanel.add(patientButton);
        contentPanel.add(Box.createVerticalStrut(10));
        contentPanel.add(healthyButton);

        add(contentPanel, BorderLayout.CENTER);
        pack();
        setLocationRelativeTo(owner);
    }

    public boolean isSelectionMade() {
        return selectionMade;
    }

    public boolean isPatient() {
        return isPatient;
    }
}