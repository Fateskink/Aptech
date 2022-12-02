package com.aptech;

import com.aptech.models.Contact;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

public class ContactForm implements IAction{
    private JFrame frame;
    private JTextField textFieldContactID;
    private JTextField textFieldFirstName;
    private JTextField textFieldLastName;
    private JTextField textFieldContactNo;
    private JTextArea textAreaAddress;
    private JComboBox comboBoxGender;
    private JTable tableContact;
    private JButton buttonAdd;
    private JButton buttonUpdate;
    private JButton buttonDelete;
    private JButton buttonClear;
    private JPanel mainPanel;
    private ContactRepository contactRepository;

    public ContactForm(String title) {
        contactRepository = new ContactRepository();
        this.frame = new JFrame(title);
        this.frame.setContentPane(this.mainPanel);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(800,600);
        //frame.pack();
        this.setupActions();
    }
    private void reloadTable() {
        try {
            DefaultTableModel tableModel = (DefaultTableModel) tableContact.getModel();
            //tableModel.setRowCount(0);
            ArrayList<Contact> contacts = contactRepository.getContacts();
            for (Contact contact: contacts) {
                String[] row = new String[6];
                row[0] = contact.getId();
                row[1] = contact.getFirstName();
                row[2] = contact.getLastName();
                row[3] = contact.getContactNo();
                row[4] = contact.getAddress();
                row[5] = contact.getGender();
                tableModel.addRow(row);
            }
            tableContact.setModel(tableModel);
            tableModel.fireTableDataChanged();
        }catch (Exception e) {
            System.out.println("cannot show data"+e.getMessage());
        }
    }
    public void show() {
        reloadTable();
        this.frame.setVisible(true);
    }
    @Override
    public void setupActions() {
        buttonAdd.addActionListener((ActionEvent actionEvent) -> {
            System.out.println("You pressed buttonAdd");
        });
        buttonClear.addActionListener((ActionEvent actionEvent) -> {
            System.out.println("You pressed buttonClear");
        });
        buttonDelete.addActionListener((ActionEvent actionEvent) -> {
            System.out.println("You pressed buttonDelete");
        });
        buttonUpdate.addActionListener((ActionEvent actionEvent) -> {
            System.out.println("You pressed buttonUpdate");
        });


    }
}
