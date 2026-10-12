namespace WinFormsParcoVeicoli
{
    partial class FormInizio
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            buttonCaricaVeicoli = new Button();
            dataGridView1 = new DataGridView();
            TextBoxTarga = new TextBox();
            LabelTarga = new Label();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            SuspendLayout();
            // 
            // buttonCaricaVeicoli
            // 
            buttonCaricaVeicoli.Location = new Point(282, 12);
            buttonCaricaVeicoli.Name = "buttonCaricaVeicoli";
            buttonCaricaVeicoli.Size = new Size(126, 23);
            buttonCaricaVeicoli.TabIndex = 0;
            buttonCaricaVeicoli.Text = "buttonCaricaVeicoli";
            buttonCaricaVeicoli.UseVisualStyleBackColor = true;
            // 
            // dataGridView1
            // 
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Location = new Point(414, 12);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.Size = new Size(351, 426);
            dataGridView1.TabIndex = 1;
            // 
            // TextBoxTarga
            // 
            TextBoxTarga.Location = new Point(25, 52);
            TextBoxTarga.Name = "TextBoxTarga";
            TextBoxTarga.Size = new Size(100, 23);
            TextBoxTarga.TabIndex = 2;
            // 
            // LabelTarga
            // 
            LabelTarga.AutoSize = true;
            LabelTarga.Location = new Point(52, 34);
            LabelTarga.Name = "LabelTarga";
            LabelTarga.Size = new Size(36, 15);
            LabelTarga.TabIndex = 3;
            LabelTarga.Text = "Targa";
            // 
            // FormInizio
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(LabelTarga);
            Controls.Add(TextBoxTarga);
            Controls.Add(dataGridView1);
            Controls.Add(buttonCaricaVeicoli);
            Name = "FormInizio";
            Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Button buttonCaricaVeicoli;
        private DataGridView dataGridView1;
        private TextBox TextBoxTarga;
        private Label LabelTarga;
    }
}
