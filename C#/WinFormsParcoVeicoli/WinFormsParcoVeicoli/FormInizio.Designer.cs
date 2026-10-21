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
            dataGridViewVeicoli = new DataGridView();
            textBoxTarga = new TextBox();
            LabelTarga = new Label();
            textBoxMarca = new TextBox();
            textBoxModello = new TextBox();
            textBoxChilometriPercorsi = new TextBox();
            textBoxProprietà = new TextBox();
            labelMarca = new Label();
            labelModello = new Label();
            labelChilometriPercorsi = new Label();
            labelProprietà = new Label();
            buttonInserisci = new Button();
            buttonModifica = new Button();
            buttonElimina = new Button();
            comboBoxScelta = new ComboBox();
            labelTipoVeicolo = new Label();
            ((System.ComponentModel.ISupportInitialize)dataGridViewVeicoli).BeginInit();
            SuspendLayout();
            // 
            // dataGridViewVeicoli
            // 
            dataGridViewVeicoli.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewVeicoli.Location = new Point(414, 12);
            dataGridViewVeicoli.Name = "dataGridViewVeicoli";
            dataGridViewVeicoli.Size = new Size(351, 426);
            dataGridViewVeicoli.TabIndex = 1;
            dataGridViewVeicoli.CellContentClick += dataGridViewVeicoli_CellContentClick;
            // 
            // textBoxTarga
            // 
            textBoxTarga.Location = new Point(25, 52);
            textBoxTarga.Name = "textBoxTarga";
            textBoxTarga.Size = new Size(100, 23);
            textBoxTarga.TabIndex = 2;
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
            // textBoxMarca
            // 
            textBoxMarca.Location = new Point(25, 97);
            textBoxMarca.Name = "textBoxMarca";
            textBoxMarca.Size = new Size(100, 23);
            textBoxMarca.TabIndex = 4;
            // 
            // textBoxModello
            // 
            textBoxModello.Location = new Point(25, 148);
            textBoxModello.Name = "textBoxModello";
            textBoxModello.Size = new Size(100, 23);
            textBoxModello.TabIndex = 5;
            // 
            // textBoxChilometriPercorsi
            // 
            textBoxChilometriPercorsi.Location = new Point(25, 203);
            textBoxChilometriPercorsi.Name = "textBoxChilometriPercorsi";
            textBoxChilometriPercorsi.Size = new Size(100, 23);
            textBoxChilometriPercorsi.TabIndex = 6;
            // 
            // textBoxProprietà
            // 
            textBoxProprietà.Location = new Point(25, 264);
            textBoxProprietà.Name = "textBoxProprietà";
            textBoxProprietà.Size = new Size(100, 23);
            textBoxProprietà.TabIndex = 7;
            // 
            // labelMarca
            // 
            labelMarca.AutoSize = true;
            labelMarca.Location = new Point(52, 79);
            labelMarca.Name = "labelMarca";
            labelMarca.Size = new Size(40, 15);
            labelMarca.TabIndex = 8;
            labelMarca.Text = "Marca";
            // 
            // labelModello
            // 
            labelModello.AutoSize = true;
            labelModello.Location = new Point(48, 130);
            labelModello.Name = "labelModello";
            labelModello.Size = new Size(51, 15);
            labelModello.TabIndex = 9;
            labelModello.Text = "Modello";
            // 
            // labelChilometriPercorsi
            // 
            labelChilometriPercorsi.AutoSize = true;
            labelChilometriPercorsi.Location = new Point(17, 185);
            labelChilometriPercorsi.Name = "labelChilometriPercorsi";
            labelChilometriPercorsi.Size = new Size(108, 15);
            labelChilometriPercorsi.TabIndex = 10;
            labelChilometriPercorsi.Text = "Chilometri Percorsi";
            // 
            // labelProprietà
            // 
            labelProprietà.AutoSize = true;
            labelProprietà.Location = new Point(44, 246);
            labelProprietà.Name = "labelProprietà";
            labelProprietà.Size = new Size(55, 15);
            labelProprietà.TabIndex = 11;
            labelProprietà.Text = "Proprietà";
            // 
            // buttonInserisci
            // 
            buttonInserisci.Location = new Point(304, 36);
            buttonInserisci.Name = "buttonInserisci";
            buttonInserisci.Size = new Size(75, 39);
            buttonInserisci.TabIndex = 12;
            buttonInserisci.Text = "Inserisci";
            buttonInserisci.UseVisualStyleBackColor = true;
            buttonInserisci.Click += buttonInserisci_Click;
            // 
            // buttonModifica
            // 
            buttonModifica.Location = new Point(304, 83);
            buttonModifica.Name = "buttonModifica";
            buttonModifica.Size = new Size(75, 37);
            buttonModifica.TabIndex = 13;
            buttonModifica.Text = "Modifica";
            buttonModifica.UseVisualStyleBackColor = true;
            buttonModifica.Click += buttonModifica_Click;
            // 
            // buttonElimina
            // 
            buttonElimina.Location = new Point(304, 130);
            buttonElimina.Name = "buttonElimina";
            buttonElimina.Size = new Size(75, 41);
            buttonElimina.TabIndex = 14;
            buttonElimina.Text = "Elimina";
            buttonElimina.UseVisualStyleBackColor = true;
            buttonElimina.Click += buttonElimina_Click;
            // 
            // comboBoxScelta
            // 
            comboBoxScelta.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBoxScelta.FlatStyle = FlatStyle.Popup;
            comboBoxScelta.Items.AddRange(new object[] { "Auto", "Camion" });
            comboBoxScelta.Location = new Point(304, 203);
            comboBoxScelta.Name = "comboBoxScelta";
            comboBoxScelta.Size = new Size(75, 23);
            comboBoxScelta.TabIndex = 15;
            comboBoxScelta.SelectedIndex = 0;
            // 
            // labelTipoVeicolo
            // 
            labelTipoVeicolo.AutoSize = true;
            labelTipoVeicolo.Location = new Point(307, 185);
            labelTipoVeicolo.Name = "labelTipoVeicolo";
            labelTipoVeicolo.Size = new Size(72, 15);
            labelTipoVeicolo.TabIndex = 16;
            labelTipoVeicolo.Text = "Tipo Veicolo";
            // 
            // FormInizio
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(labelTipoVeicolo);
            Controls.Add(comboBoxScelta);
            Controls.Add(buttonElimina);
            Controls.Add(buttonModifica);
            Controls.Add(buttonInserisci);
            Controls.Add(labelProprietà);
            Controls.Add(labelChilometriPercorsi);
            Controls.Add(labelModello);
            Controls.Add(labelMarca);
            Controls.Add(textBoxProprietà);
            Controls.Add(textBoxChilometriPercorsi);
            Controls.Add(textBoxModello);
            Controls.Add(textBoxMarca);
            Controls.Add(LabelTarga);
            Controls.Add(textBoxTarga);
            Controls.Add(dataGridViewVeicoli);
            Name = "FormInizio";
            Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)dataGridViewVeicoli).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion
        private DataGridView dataGridViewVeicoli;
        private TextBox textBoxTarga;
        private Label LabelTarga;
        private TextBox textBoxMarca;
        private TextBox textBoxModello;
        private TextBox textBoxChilometriPercorsi;
        private TextBox textBoxProprietà;
        private Label labelMarca;
        private Label labelModello;
        private Label labelChilometriPercorsi;
        private Label labelProprietà;
        private Button buttonInserisci;
        private Button buttonModifica;
        private Button buttonElimina;
        private ComboBox comboBoxScelta;
        private Label labelTipoVeicolo;
    }
}
