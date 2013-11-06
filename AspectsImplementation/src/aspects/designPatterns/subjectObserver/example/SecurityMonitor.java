package aspects.designPatterns.subjectObserver.example;

import java.awt.Frame;

import java.awt.Panel;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.BorderLayout;

import javax.swing.JTextArea;

/*
 * Modification of the original code
 */

@SuppressWarnings("serial")
public class SecurityMonitor extends Panel {

    protected Frame frame = new Frame("Subject/Observer Demo");
    private JTextArea text;
    
    SecurityMonitor() {
        frame.addWindowListener(new WindowAdapter() {
          public void windowClosing(WindowEvent e) 
          {System.exit(0);}
        });

        frame.add(this, BorderLayout.CENTER);
        text = new JTextArea();
        add(text);
        frame.pack();
        frame.setVisible(true);
    }

    void showMonitoredData(String c) {
        text.append(c);
        frame.pack();
    }
}
