namespace WinFormGestioneBiblioteca
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
            dataGridViewGestione = new DataGridView();
            buttonInserisci = new Button();
            buttonModifica = new Button();
            buttonElimina = new Button();
            labelCodice = new Label();
            textBoxCodice = new TextBox();
            labelTitolo = new Label();
            textBoxTitolo = new TextBox();
            labelAutore = new Label();
            textBoxAutore = new TextBox();
            textBoxGiorniPrestito = new TextBox();
            labelGiorniPrestito = new Label();
            textBoxProprietà = new TextBox();
            labelProprietà = new Label();
            radioButtonLibro = new RadioButton();
            radioButtonAudiolibro = new RadioButton();
            ((System.ComponentModel.ISupportInitialize)dataGridViewGestione).BeginInit();
            SuspendLayout();
            // 
            // dataGridViewGestione
            // 
            dataGridViewGestione.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewGestione.Location = new Point(491, 68);
            dataGridViewGestione.Name = "dataGridViewGestione";
            dataGridViewGestione.Size = new Size(462, 453);
            dataGridViewGestione.TabIndex = 0;
            dataGridViewGestione.CellContentClick += dataGridViewGestione_CellContentClick;
            // 
            // buttonInserisci
            // 
            buttonInserisci.Location = new Point(396, 68);
            buttonInserisci.Name = "buttonInserisci";
            buttonInserisci.Size = new Size(75, 43);
            buttonInserisci.TabIndex = 1;
            buttonInserisci.Text = "Inserisci";
            buttonInserisci.UseVisualStyleBackColor = true;
            buttonInserisci.Click += buttonInserisci_Click;
            // 
            // buttonModifica
            // 
            buttonModifica.Location = new Point(396, 117);
            buttonModifica.Name = "buttonModifica";
            buttonModifica.Size = new Size(75, 43);
            buttonModifica.TabIndex = 2;
            buttonModifica.Text = "Modifica";
            buttonModifica.UseVisualStyleBackColor = true;
            buttonModifica.Click += buttonModifica_Click;
            // 
            // buttonElimina
            // 
            buttonElimina.Location = new Point(396, 166);
            buttonElimina.Name = "buttonElimina";
            buttonElimina.Size = new Size(75, 48);
            buttonElimina.TabIndex = 3;
            buttonElimina.Text = "Elimina";
            buttonElimina.UseVisualStyleBackColor = true;
            // 
            // labelCodice
            // 
            labelCodice.AutoSize = true;
            labelCodice.Location = new Point(77, 70);
            labelCodice.Name = "labelCodice";
            labelCodice.Size = new Size(44, 15);
            labelCodice.TabIndex = 4;
            labelCodice.Text = "Codice";
            // 
            // textBoxCodice
            // 
            textBoxCodice.Location = new Point(59, 88);
            textBoxCodice.Name = "textBoxCodice";
            textBoxCodice.Size = new Size(100, 23);
            textBoxCodice.TabIndex = 5;
            // 
            // labelTitolo
            // 
            labelTitolo.AutoSize = true;
            labelTitolo.Location = new Point(239, 70);
            labelTitolo.Name = "labelTitolo";
            labelTitolo.Size = new Size(38, 15);
            labelTitolo.TabIndex = 6;
            labelTitolo.Text = "Titolo";
            // 
            // textBoxTitolo
            // 
            textBoxTitolo.Location = new Point(205, 88);
            textBoxTitolo.Name = "textBoxTitolo";
            textBoxTitolo.Size = new Size(100, 23);
            textBoxTitolo.TabIndex = 7;
            // 
            // labelAutore
            // 
            labelAutore.AutoSize = true;
            labelAutore.Location = new Point(77, 145);
            labelAutore.Name = "labelAutore";
            labelAutore.Size = new Size(43, 15);
            labelAutore.TabIndex = 8;
            labelAutore.Text = "Autore";
            // 
            // textBoxAutore
            // 
            textBoxAutore.Location = new Point(53, 166);
            textBoxAutore.Name = "textBoxAutore";
            textBoxAutore.Size = new Size(100, 23);
            textBoxAutore.TabIndex = 9;
            // 
            // textBoxGiorniPrestito
            // 
            textBoxGiorniPrestito.Location = new Point(205, 166);
            textBoxGiorniPrestito.Name = "textBoxGiorniPrestito";
            textBoxGiorniPrestito.Size = new Size(100, 23);
            textBoxGiorniPrestito.TabIndex = 10;
            // 
            // labelGiorniPrestito
            // 
            labelGiorniPrestito.AutoSize = true;
            labelGiorniPrestito.Location = new Point(214, 148);
            labelGiorniPrestito.Name = "labelGiorniPrestito";
            labelGiorniPrestito.Size = new Size(82, 15);
            labelGiorniPrestito.TabIndex = 11;
            labelGiorniPrestito.Text = "Giorni Prestito";
            // 
            // textBoxProprietà
            // 
            textBoxProprietà.Location = new Point(127, 245);
            textBoxProprietà.Name = "textBoxProprietà";
            textBoxProprietà.Size = new Size(100, 23);
            textBoxProprietà.TabIndex = 12;
            // 
            // labelProprietà
            // 
            labelProprietà.AutoSize = true;
            labelProprietà.Location = new Point(149, 227);
            labelProprietà.Name = "labelProprietà";
            labelProprietà.Size = new Size(55, 15);
            labelProprietà.TabIndex = 13;
            labelProprietà.Text = "Proprietà";
            // 
            // radioButtonLibro
            // 
            radioButtonLibro.AutoSize = true;
            radioButtonLibro.Checked = true;
            radioButtonLibro.Location = new Point(396, 240);
            radioButtonLibro.Name = "radioButtonLibro";
            radioButtonLibro.Size = new Size(52, 19);
            radioButtonLibro.TabIndex = 14;
            radioButtonLibro.TabStop = true;
            radioButtonLibro.Text = "Libro";
            radioButtonLibro.UseVisualStyleBackColor = true;
            // 
            // radioButtonAudiolibro
            // 
            radioButtonAudiolibro.AutoSize = true;
            radioButtonAudiolibro.Location = new Point(396, 265);
            radioButtonAudiolibro.Name = "radioButtonAudiolibro";
            radioButtonAudiolibro.Size = new Size(81, 19);
            radioButtonAudiolibro.TabIndex = 15;
            radioButtonAudiolibro.TabStop = true;
            radioButtonAudiolibro.Text = "Audiolibro";
            radioButtonAudiolibro.UseVisualStyleBackColor = true;
            // 
            // FormInizio
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(985, 559);
            Controls.Add(radioButtonAudiolibro);
            Controls.Add(radioButtonLibro);
            Controls.Add(labelProprietà);
            Controls.Add(textBoxProprietà);
            Controls.Add(labelGiorniPrestito);
            Controls.Add(textBoxGiorniPrestito);
            Controls.Add(textBoxAutore);
            Controls.Add(labelAutore);
            Controls.Add(textBoxTitolo);
            Controls.Add(labelTitolo);
            Controls.Add(textBoxCodice);
            Controls.Add(labelCodice);
            Controls.Add(buttonElimina);
            Controls.Add(buttonModifica);
            Controls.Add(buttonInserisci);
            Controls.Add(dataGridViewGestione);
            Name = "FormInizio";
            Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)dataGridViewGestione).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private DataGridView dataGridViewGestione;
        private Button buttonInserisci;
        private Button buttonModifica;
        private Button buttonElimina;
        private Label labelCodice;
        private TextBox textBoxCodice;
        private Label labelTitolo;
        private TextBox textBoxTitolo;
        private Label labelAutore;
        private TextBox textBoxAutore;
        private TextBox textBoxGiorniPrestito;
        private Label labelGiorniPrestito;
        private TextBox textBoxProprietà;
        private Label labelProprietà;
        private RadioButton radioButtonLibro;
        private RadioButton radioButtonAudiolibro;
    }
}
