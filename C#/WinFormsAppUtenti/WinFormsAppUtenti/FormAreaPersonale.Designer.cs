namespace WinFormsAppUtenti
{
    partial class FormAreaPersonale
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            labelBentornato = new Label();
            labelDati = new Label();
            labelUserUsername = new Label();
            labelUserEmail = new Label();
            SuspendLayout();
            // 
            // labelBentornato
            // 
            labelBentornato.AutoSize = true;
            labelBentornato.Location = new Point(138, 20);
            labelBentornato.Name = "labelBentornato";
            labelBentornato.Size = new Size(0, 15);
            labelBentornato.TabIndex = 0;
            // 
            // labelDati
            // 
            labelDati.AutoSize = true;
            labelDati.Location = new Point(12, 52);
            labelDati.Name = "labelDati";
            labelDati.Size = new Size(28, 15);
            labelDati.TabIndex = 1;
            labelDati.Text = "Dati";
            // 
            // labelUserUsername
            // 
            labelUserUsername.AutoSize = true;
            labelUserUsername.Location = new Point(53, 115);
            labelUserUsername.Name = "labelUserUsername";
            labelUserUsername.Size = new Size(66, 15);
            labelUserUsername.TabIndex = 2;
            labelUserUsername.Text = "Username :";
            // 
            // labelUserEmail
            // 
            labelUserEmail.AutoSize = true;
            labelUserEmail.Location = new Point(53, 164);
            labelUserEmail.Name = "labelUserEmail";
            labelUserEmail.Size = new Size(42, 15);
            labelUserEmail.TabIndex = 3;
            labelUserEmail.Text = "Email :";
            // 
            // FormAreaPersonale
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(356, 282);
            Controls.Add(labelUserEmail);
            Controls.Add(labelUserUsername);
            Controls.Add(labelDati);
            Controls.Add(labelBentornato);
            Name = "FormAreaPersonale";
            Text = "Form1";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label labelBentornato;
        private Label labelDati;
        private Label labelUserUsername;
        private Label labelUserEmail;
    }
}