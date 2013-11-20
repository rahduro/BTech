
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/*
 * ShareGenerate.java
 *
 * Created on Feb 6, 2009, 6:46:01 PM
 */
public class ShareGenerate extends javax.swing.JFrame {

    /** Creates new form ShareGenerate */
    public ShareGenerate() {
        Runtime.getRuntime().gc();
        initComponents();
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        basisDialog = new javax.swing.JDialog();
        basisPanel = new javax.swing.JPanel();
        jLabel6 = new javax.swing.JLabel();
        basisStr = new javax.swing.JTextField();
        cancel = new javax.swing.JButton();
        ok = new javax.swing.JButton();
        userMessage = new javax.swing.JOptionPane();
        browse = new javax.swing.JFileChooser();
        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        inputBasis = new javax.swing.JButton();
        reset = new javax.swing.JButton();
        genShare = new javax.swing.JButton();
        partc = new javax.swing.JTextField();
        mqs = new javax.swing.JTextField();
        browse1 = new javax.swing.JButton();
        secretFile1 = new javax.swing.JTextField();
        time = new javax.swing.JLabel();

        basisDialog.setTitle("Enter Basis Elements");

        basisPanel.setBackground(new java.awt.Color(192, 219, 255));
        basisPanel.setAutoscrolls(true);
        basisPanel.setMinimumSize(new java.awt.Dimension(500, 200));

        jLabel6.setFont(new java.awt.Font("Arial Narrow", 1, 14)); // NOI18N
        jLabel6.setForeground(java.awt.SystemColor.textHighlight);
        jLabel6.setText("Enter a minimal qualified set of participants (in comma separated value format):");

        basisStr.setFont(new java.awt.Font("Arial Narrow", 1, 14)); // NOI18N
        basisStr.setForeground(java.awt.SystemColor.textHighlight);

        cancel.setText("Cancel");
        cancel.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cancelActionPerformed(evt);
            }
        });

        ok.setText("OK");
        ok.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                okActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout basisPanelLayout = new javax.swing.GroupLayout(basisPanel);
        basisPanel.setLayout(basisPanelLayout);
        basisPanelLayout.setHorizontalGroup(
            basisPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, basisPanelLayout.createSequentialGroup()
                .addContainerGap(39, Short.MAX_VALUE)
                .addComponent(jLabel6)
                .addGap(37, 37, 37))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, basisPanelLayout.createSequentialGroup()
                .addGap(156, 156, 156)
                .addComponent(basisStr, javax.swing.GroupLayout.DEFAULT_SIZE, 213, Short.MAX_VALUE)
                .addGap(142, 142, 142))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, basisPanelLayout.createSequentialGroup()
                .addContainerGap(190, Short.MAX_VALUE)
                .addComponent(ok)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(cancel, javax.swing.GroupLayout.PREFERRED_SIZE, 74, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(171, 171, 171))
        );
        basisPanelLayout.setVerticalGroup(
            basisPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(basisPanelLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel6)
                .addGap(42, 42, 42)
                .addComponent(basisStr, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(52, 52, 52)
                .addGroup(basisPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(ok, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(cancel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(32, 32, 32))
        );

        javax.swing.GroupLayout basisDialogLayout = new javax.swing.GroupLayout(basisDialog.getContentPane());
        basisDialog.getContentPane().setLayout(basisDialogLayout);
        basisDialogLayout.setHorizontalGroup(
            basisDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(basisDialogLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(basisPanel, javax.swing.GroupLayout.PREFERRED_SIZE, 492, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(18, Short.MAX_VALUE))
        );
        basisDialogLayout.setVerticalGroup(
            basisDialogLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(basisDialogLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(basisPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        browse.setDialogType(javax.swing.JFileChooser.CUSTOM_DIALOG);
        browse.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                browseActionPerformed(evt);
            }
        });

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Share Generation Engine");
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosed(java.awt.event.WindowEvent evt) {
                frameWindowClosed(evt);
            }
        });

        jPanel1.setBackground(new java.awt.Color(192, 219, 255));
        jPanel1.setBorder(new javax.swing.border.LineBorder(java.awt.SystemColor.textHighlight, 3, true));
        jPanel1.setAutoscrolls(true);

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/binaryKey.jpg"))); // NOI18N

        jLabel2.setFont(new java.awt.Font("Arial Narrow", 1, 14));
        jLabel2.setForeground(java.awt.SystemColor.textHighlight);
        jLabel2.setText("Enter Secret Key File:");

        jLabel4.setFont(new java.awt.Font("Arial Narrow", 1, 14));
        jLabel4.setForeground(java.awt.SystemColor.textHighlight);
        jLabel4.setText("No. of Participants:");

        jLabel5.setFont(new java.awt.Font("Arial Narrow", 1, 14));
        jLabel5.setForeground(java.awt.SystemColor.textHighlight);
        jLabel5.setText("No. of Basis Sets:");

        inputBasis.setText("Enter Basis Sets");
        inputBasis.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                inputBasisActionPerformed(evt);
            }
        });

        reset.setText("Back");
        reset.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                resetActionPerformed(evt);
            }
        });

        genShare.setText("Generate Shares");
        genShare.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                genShareActionPerformed(evt);
            }
        });

        partc.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                partcFocusLost(evt);
            }
        });

        mqs.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusLost(java.awt.event.FocusEvent evt) {
                mqsFocusLost(evt);
            }
        });

        browse1.setText("Browse");
        browse1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                browse1ActionPerformed(evt);
            }
        });

        time.setFont(new java.awt.Font("Arial Narrow", 1, 14));
        time.setForeground(java.awt.SystemColor.textHighlight);
        time.setText("  ");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(35, 35, 35)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jLabel4)
                            .addComponent(jLabel5))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(mqs)
                            .addComponent(partc, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(31, 31, 31)
                        .addComponent(time, javax.swing.GroupLayout.PREFERRED_SIZE, 138, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jLabel1)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(23, 23, 23)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(inputBasis)
                                .addGap(67, 67, 67)
                                .addComponent(genShare)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(reset))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel2)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(secretFile1, javax.swing.GroupLayout.PREFERRED_SIZE, 173, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(browse1)))))
                .addContainerGap(10, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(26, 26, 26)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel2)
                    .addComponent(secretFile1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(browse1))
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(jLabel4)
                                .addComponent(partc, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(38, 38, 38)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                    .addComponent(mqs, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel5)))))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(36, 36, 36)
                        .addComponent(time)))
                .addGap(40, 40, 40)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(inputBasis, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(genShare, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(reset))
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

private void inputBasisActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_inputBasisActionPerformed
    /*Show dialog-box to enter basis set*/
    basisDialog.setSize(525, 275);
    basisDialog.setVisible(true);

}//GEN-LAST:event_inputBasisActionPerformed

private void okActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_okActionPerformed
    /*Input the basis set*/
    
    // Fetch the basis set entered
    String str = basisStr.getText();
    
    // If the set is empty, alert the user
    if (str.isEmpty()){
        userMessage.showMessageDialog(this, "Please enter a valid basis set!");
    }
    else{
    
        // Discard the commas & store the basis sets in the basis[][] array
        String[] arr = str.split(",");
        basis[count++] = new int[arr.length];
        for (int i = 0; i < arr.length; ++i) {
            basis[count - 1][i] = Integer.parseInt(arr[i]);
        }

        // Continue till all the basis sets are entered
        basisStr.setText("");
        temp1--;
        if (temp1 < 1) {
            basisDialog.setVisible(false);
            inputBasis.setEnabled(false);

        }
    }
}//GEN-LAST:event_okActionPerformed

private void partcFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_partcFocusLost
    /*Input the number of Participants*/ 
    p = Integer.parseInt(partc.getText());
}//GEN-LAST:event_partcFocusLost

private void mqsFocusLost(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_mqsFocusLost
    /*Input the number of basis sets*/
    n = Integer.parseInt(mqs.getText());
    temp1 = n;

    // Initialize arrays
    basis = new int[n][];
    common = new int[n][n];
}//GEN-LAST:event_mqsFocusLost

private void genShareActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_genShareActionPerformed
    /*Share Generation module*/
    
    // Start the timer
    long start = System.currentTimeMillis();

    /*This module identifies pairs of minimal qualified sets with maximum intersection.*/
    init_flag(n);
    init_common(n);
    basis_comp();
    pair();

    
    /*This module solves the system of linear equations and generates the shares*/
    create_g();
    
    // Determine the parameters to solve the equations
    for (int i = 0; i < n; ++i) {
        if (pairing[i] == 0) {
            // solve a single equation.
            solve_eq1(i);                               
        } 
        else {
            // solve a pair of equations. 
            for (int j = i + 1; j < n; ++j) {
                if (pairing[i] == pairing[j]) {
                    int x = common[i][j];           // x number of common variables.
                    int y = (basis[i].length - x);  // y number of uncommon variables in the first equation.
                    int z = (basis[j].length - x);  // z number of uncommon variables in the second equation.
                    solve_eq(x, y, z, i, j);
                }
            }
        }
    }

    // Calculation of the shares
    out_share();

    // Write the Key Parameters in a text file 
    String col = "Number of columns is: " + columns + "\n\n" + "Length of the Secret is: " + secretKey.length() + " bits";
    printShare(col, "keyParam.doc");

    // Stop the timer
    long end = System.currentTimeMillis();

    // Display time taken
    float duration = (end - start) / 1000;
    time.setText("Time Elapsed: " + duration + " s");

}//GEN-LAST:event_genShareActionPerformed

private void resetActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_resetActionPerformed
    /*Reset the form fields*/
    new LogIn().setVisible(true);
    this.setVisible(false);
}//GEN-LAST:event_resetActionPerformed

private void frameWindowClosed(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_frameWindowClosed
    System.out.println("Bye !!");
}//GEN-LAST:event_frameWindowClosed

private void browseActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_browseActionPerformed
    /*Open a file dialog and select the secret key file*/
    
    // Start the timer
    long start = System.currentTimeMillis();
    
    // Read the Secret Key file
    try {
        // Open the file
        FileInputStream fstream = new FileInputStream(browse.getSelectedFile());

        // Convert our input stream to a
        // DataInputStream
        DataInputStream in = new DataInputStream(fstream);

        // Continue to read lines while
        // there are still some left to read
        while (in.available() != 0) {
            // Print file line to screen
            input += in.readLine() + "\n";
        }
        in.close();
    } catch (java.lang.StringIndexOutOfBoundsException e) {
        userMessage.showMessageDialog(this, "Values of some fields may be incorrect !");
    } catch (Exception e) {
        userMessage.showMessageDialog(this, "Error in Reading File: " + e);
    }

    // Convert the Secret into binary form and write into a file
    try {
        // Create file
        FileWriter fstream = new FileWriter("binaryKey.txt");
        BufferedWriter out = new BufferedWriter(fstream);

        // Binary conversion
        for (int i = 0; i < input.length(); ++i) {
            char a = input.charAt(i);
            String temp = Integer.toBinaryString((int) a);
            while (temp.length() < 8) {
                temp = "0" + temp;
            }
            out.write(temp);
        }
        out.close();
    } catch (Exception e) {//Catch exception if any
        userMessage.showMessageDialog(this, "Error in Writing File: " + e);
    }
    
    // Read the input from the binary text file
    try {
        BufferedReader in = new BufferedReader(new FileReader("binaryKey.txt"));
        String str;
        while ((str = in.readLine()) != null) {
            secretKey += str;
        }
        in.close();
    } catch (IOException e) {
        userMessage.showMessageDialog(this, "Error in Reading File: " + e);
    }
    input = "";
    
    // Stop the timer
    long end = System.currentTimeMillis();

    // Display the time taken
    float duration = (end - start) / 1000;
    time.setText("Time Elapsed: " + duration + " s");

}//GEN-LAST:event_browseActionPerformed

private void browse1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_browse1ActionPerformed
    /*Select the Secret Key file*/
    browse.showDialog(this, "Select Key");
    secretFile1.setText(browse.getSelectedFile().getPath());

}//GEN-LAST:event_browse1ActionPerformed

private void cancelActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cancelActionPerformed
    /*Cancel the input basis set*/
    basisDialog.dispose();
}//GEN-LAST:event_cancelActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JDialog basisDialog;
    private javax.swing.JPanel basisPanel;
    private javax.swing.JTextField basisStr;
    private javax.swing.JFileChooser browse;
    private javax.swing.JButton browse1;
    private javax.swing.JButton cancel;
    private javax.swing.JButton genShare;
    private javax.swing.JButton inputBasis;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JTextField mqs;
    private javax.swing.JButton ok;
    private javax.swing.JTextField partc;
    private javax.swing.JButton reset;
    private javax.swing.JTextField secretFile1;
    private javax.swing.JLabel time;
    private javax.swing.JOptionPane userMessage;
    // End of variables declaration//GEN-END:variables

    /* Global Variables Used */
    public int p,  n,  temp1,  count = 0,  count1 = 0,  columns = 0,  count2 = -1,  count3 = -1;
    /* p: no. of participants
     * n: no. of minimal qualified sets
     * columns: no. of columns in the generating matrices
     */
    public int[][] basis,  common;
    /* basis[][]: stores the minimal qualified set of participants
     * common[][]: stores the number of common paricipants in every pair
     */
    int[][] G0, G1;
    /* G0[][], G1[][]: Generating matrices
     */
    public String secretKey = "",  output,  input = "";
    /* scretKey: stores the secret key string
     * input: stores the binary input stream
     */
    public int[] pairing,  flag2;
    

    /* Global Methods Used */
    
    //Method to initialize the flag arrays
    public void init_flag(int len) {
        pairing = new int[n];
        flag2 = new int[n];

        for (int i = 0; i < len; ++i) {
            pairing[i] = 0;
            flag2[i] = 0;
        }
    }

    //Method to initialize the common array
    public void init_common(int len) {
        for (int i = 0; i < len; ++i) {
            for (int j = 0; j < len; ++j) {
                common[i][j] = -1;
            }
        }
    }

    //Method to compare two basis sets and return the number of common elements.
    public int compare(int row1, int row2) {
        int com = 0;

        for (int i = 0; i < basis[row1].length; ++i) {
            int x = basis[row1][i];

            for (int j = 0; j < basis[row2].length; ++j) {
                if (x == basis[row2][j]) {
                    com++;
                }
            }
        }
        return (com);
    }

    //Method to store the number of common elements between each pair of basis sets into the common[][] array
    public void basis_comp() {

        for (int i = 0; i < n; ++i) {
            for (int j = (i + 1); j < n; ++j) {
                common[i][j] = compare(i, j);
            }
        }
    }

    //Method to return the biggest element of the common[][] array.
    public void max_common() {
        int max = 0;
        int row1 = -1, col1 = -1;

        for (int i = 0; i < n; ++i) {
            for (int j = (i + 1); j < n; ++j) {
                // If either set has already been paired, ignore it
                if (pairing[i] != 0 || pairing[j] != 0) {
                    continue;
                }

                // Determine the row and column index of the next greatest element
                if (common[i][j] > max) {
                    max = common[i][j];
                    row1 = i;
                    col1 = j;

                }
            }
        }
        
        // Pair the basis sets having maximum intersection.
        if (row1 != -1 && col1 != -1) {
            pairing[row1] = pairing[col1] = ++count1;
        }
    }

    //Method to pair the minimal qualified elements.
    public void pair() {
        int i, j;

        if ((n % 2) > 0) {
            j = (n - 1) / 2;
        } else {
            j = n / 2;
        }

        for (i = 0; i < j; ++i) {
            max_common();
        }

    }

    //Method to create and initialize the generating matrices.
    public void create_g() {
        int sum = 0, com, x, y;

        //To calculate the number of columns in the Generting matrices.
        for (int i = 0; i < n; ++i) {

            if (pairing[i] == 0) {
                x = (basis[i].length) - 1;
                columns += Math.pow(2, x);
            }

            for (int j = (i + 1); j < n; ++j) {

                if (pairing[j] == 0) {
                    continue;
                }

                if (pairing[i] == pairing[j]) {
                    com = compare(i, j);
                    x = basis[i].length;
                    y = basis[j].length;
                    sum = (x + y) - (com + 2);
                    columns += Math.pow(2, sum);
                }
            }
        }

        //To initialize the generating matrices
        G0 = new int[p][columns];
        G1 = new int[p][columns];

        for (int i = 0; i < p; ++i) {
            for (int j = 0; j < columns; ++j) {
                G0[i][j] = 0;
                G1[i][j] = 0;

            }
        }
    }

    //Method to return the XOR of the digits of an integer.
    public int num_XOR(int num) {
        int mask = 1, acc = 0;

        for (int i = 0; i < 8; ++i) {
            int M = mask & num;
            acc = acc ^ M;
            num = num >>> 1;
        }
        return (acc);
    }

    //Methods to update the elements of the generating matrices.
    public void update_G0(int v1, int v2, int v3, int row1, int row2, int c2) {
        char mask = 1, flag = 0;

        for (int i = 0; i < basis[row1].length; ++i) {
            int X = basis[row1][i];
            flag = 0;
            for (int j = 0; j < basis[row2].length; ++j) {
                if (X == basis[row2][j]) {
                    flag = 1;
                }
            }

            if (flag == 1) {    //it is a common element between row1 and row2
                short M = (short) (mask & v1);
                G0[X - 1][c2] = M;
                v1 = v1 >>> 1;

            } else {
                short M = (short) (mask & v2);
                G0[X - 1][c2] = M;
                v2 = v2 >>> 1;
            }
        }

        for (int i = 0; i < basis[row2].length; ++i) {
            int X = basis[row2][i];
            flag = 0;
            for (int j = 0; j < basis[row1].length; ++j) {
                if (X == basis[row1][j]) {
                    flag = 1;
                }
            }

            if (flag == 0) {    //its an extra variable of the second equation
                short M = (short) (mask & v3);
                G0[X - 1][c2] = M;
                v3 = v3 >>> 1;
            }
        }

    }
    

    // Method to update the Generating matrix
    public void update_G1(int v1, int v2, int v3, int row1, int row2, int c3) {
        int mask = 1, flag = 0;

        for (int i = 0; i < basis[row1].length; ++i) {
            int X = basis[row1][i];
            flag = 0;
            for (int j = 0; j < basis[row2].length; ++j) {
                if (X == basis[row2][j]) {
                    flag = 1;
                }
            }

            if (flag == 1) {    //it is a common element between row1 and row2
                short M = (short) (mask & v1);
                G1[X - 1][c3] = M;
                v1 = v1 >>> 1;

            } else {
                short M = (short) (mask & v2);
                G1[X - 1][c3] = M;
                v2 = v2 >>> 1;
            }
        }

        for (int i = 0; i < basis[row2].length; ++i) {
            int X = basis[row2][i];
            flag = 0;
            for (int j = 0; j < basis[row1].length; ++j) {
                if (X == basis[row1][j]) {
                    flag = 1;
                }
            }

            if (flag == 0) {    //its an extra variable of the second equation
                short M = (short) (mask & v3);
                G1[X - 1][c3] = M;
                v3 = v3 >>> 1;
            }
        }

    }

    //Method to solve the systems of linear equations.
    public void solve_eq(int com_var, int ex_var1, int ex_var2, int row1, int row2) {

        //int mask=1;

        for (int i = 0; i < Math.pow(2, com_var); ++i) {
            for (int j = 0; j < Math.pow(2, ex_var1); ++j) {
                for (int k = 0; k < Math.pow(2, ex_var2); ++k) {

                    if (num_XOR(i) == num_XOR(j) && num_XOR(i) == num_XOR(k)) {   /*Condition for solution G0*/
                        count2++;
                        update_G0(i, j, k, row1, row2, count2);
                    }

                    if (num_XOR(i) != num_XOR(j) && num_XOR(i) != num_XOR(k)) {    /*Condition for solution G1*/
                        count3++;
                        update_G1(i, j, k, row1, row2, count3);
                    }

                }
            }
        }
    }

    // Method to solve single linear equation
    public void solve_eq1(int row) {
        System.out.println("solve eq has been called !!  " + row);
        for (int i = 0; i < Math.pow(2, basis[row].length); ++i) {
            if (num_XOR(i) == 0) {
                count2++;
                update1_G0(i, row, count2);

            } else {
                count3++;
                update1_G1(i, row, count3);
            }
        }

    }

    // Method to update generating matrices when no participants are in common
    public void update1_G0(int var1, int row, int c2) {
        int mask = 1;

        for (int i = 0; i < basis[row].length; ++i) {
            short M = (short) (mask & var1);
            int a = basis[row][i];
            //System.out.println(a+"   "+M);
            //System.out.println(columns+"");
            G0[a - 1][c2] = M;
            var1 = var1 >>> 1;
        }
    }
    
    // Method to update generating matrices when no participants are in common
    public void update1_G1(int var1, int row, int c3) {
        int mask = 1;

        for (int i = 0; i < basis[row].length; ++i) {
            short M = (short) (mask & var1);
            G1[basis[row][i] - 1][c3] = M;
            var1 = var1 >>> 1;
        }

    }

    //Method to calculate the shares.
    public void out_share() {
      
        for (int i = 0; i < p; ++i) {
            try {
                // Create file
                int num=i+1;
                String name="Share"+num+".txt";
                FileWriter fstream = new FileWriter(name);
                BufferedWriter out = new BufferedWriter(fstream);

                for(int j=0;j<secretKey.length();++j){
                    if(secretKey.charAt(j)=='0'){
                        for(int k=0;k<columns;++k){
                            out.write(""+G0[i][k]);
                        }
                    }

                    if(secretKey.charAt(j)=='1'){
                        for(int k=0;k<columns;++k){
                            out.write(""+G1[i][k]);
                        }
                    }

                }

                out.close();
            } catch (Exception e) {//Catch exception if any
                userMessage.showMessageDialog(this, "Error in Writing File: " + e);
            }

        }

    }

    public static void printShare(String share, String name) {
        try {
            // Create file
            FileWriter fstream = new FileWriter(name);
            BufferedWriter out = new BufferedWriter(fstream);
            out.write(share);
            //Close the output stream
            out.close();
        } catch (Exception e) {//Catch exception if any
            System.err.println("Error: " + e.getMessage());
        }
    }
}