/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package screens;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;

public class ComputerFrame extends JFrame {
    private JTextField txtComputerId;
    private JTextField txtPrice;
    private JTextField txtName;
    private JTextField txtManufacture;
    private JButton btnShowAll;
    private JButton btnAddNew;
    private JButton btnFind;
    private JTable tblProducts;

    public ComputerFrame() {
        initComponents();
    }

    private void initComponents() {
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setTitle("Product Form");

        // Create labels
        JLabel lblComputerId = new JLabel("Computer ID:");
        JLabel lblPrice = new JLabel("Price:");
        JLabel lblName = new JLabel("Name:");
        JLabel lblManufacture = new JLabel("Manufacture:");

        // Create text fields
        txtComputerId = new JTextField(10);
        txtPrice = new JTextField(10);
        txtName = new JTextField(20);
        txtManufacture = new JTextField(20);

        // Create buttons
        btnShowAll = new JButton("Show All");
        btnAddNew = new JButton("Add New");
        btnFind = new JButton("Find");

        // Create table
        tblProducts = new JTable();
        JScrollPane scrollPane = new JScrollPane(tblProducts);

        // Set layout
        setLayout(new BorderLayout());

        // Create input panel
        JPanel inputPanel = new JPanel(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.anchor = GridBagConstraints.WEST;
        gbc.insets = new Insets(5, 5, 5, 5);
        inputPanel.add(lblComputerId, gbc);
        gbc.gridx++;
        inputPanel.add(txtComputerId, gbc);
        gbc.gridx = 0;
        gbc.gridy++;
        inputPanel.add(lblPrice, gbc);
        gbc.gridx++;
        inputPanel.add(txtPrice, gbc);
        gbc.gridx = 0;
        gbc.gridy++;
        inputPanel.add(lblName, gbc);
        gbc.gridx++;
        inputPanel.add(txtName, gbc);
        gbc.gridx = 0;
        gbc.gridy++;
        inputPanel.add(lblManufacture, gbc);
        gbc.gridx++;
        inputPanel.add(txtManufacture, gbc);

        // Create button panel
        JPanel buttonPanel = new JPanel(new FlowLayout());
        buttonPanel.add(btnShowAll);
        buttonPanel.add(btnAddNew);
        buttonPanel.add(btnFind);

        // Add components to the frame
        add(inputPanel, BorderLayout.NORTH);
        add(scrollPane, BorderLayout.CENTER);
        add(buttonPanel, BorderLayout.SOUTH);

        // Add action listeners
        btnShowAll.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                showAllProducts();
            }
        });

        btnAddNew.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                addNewProduct();
            }
        });

        btnFind.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                findProduct();
            }
        });

        pack();
    }

    private void showAllProducts() {
        // Get data from the database or any other source
        Vector<Vector<String>> productsData = new Vector<Vector<String>>();
        // Populate productsData with the product information
            
        // Create table model
        Vector<String> columnNames = new Vector<String>();
        columnNames.add("Computer ID");
        columnNames.add("Price");
        columnNames.add("Name");
        columnNames.add("Manufacture");
        DefaultTableModel model = new DefaultTableModel(productsData, columnNames);

        // Set the table model
        tblProducts.setModel(model);
    }

    private void addNewProduct() {
        String computerId = txtComputerId.getText();
        String price = txtPrice.getText();
        String name = txtName.getText();
        String manufacture = txtManufacture.getText();

        // Add the new product to the database or any other storage

        // Clear the input fields
        txtComputerId.setText("");
        txtPrice.setText("");
        txtName.setText("");
        txtManufacture.setText("");

        // Refresh the table
        showAllProducts();
    }

    private void findProduct() {
        // Implement the find functionality
    }
    
}
