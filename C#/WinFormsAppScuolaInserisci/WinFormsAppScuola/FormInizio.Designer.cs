namespace WinFormsAppScuola
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
            buttonCaricaStudenti = new Button();
            dataGridViewStudenti = new DataGridView();
            Carica = new DataGridViewButtonColumn();
            buttonCancella = new Button();
            textBoxMatricola = new TextBox();
            textBoxNome = new TextBox();
            textBoxCognome = new TextBox();
            textBoxDataNascita = new TextBox();
            buttonInserisciStudente = new Button();
            label1 = new Label();
            label2 = new Label();
            label3 = new Label();
            label4 = new Label();
            buttonModificaStudente = new Button();
            ((System.ComponentModel.ISupportInitialize)dataGridViewStudenti).BeginInit();
            SuspendLayout();
            // 
            // buttonCaricaStudenti
            // 
            buttonCaricaStudenti.Location = new Point(12, 23);
            buttonCaricaStudenti.Name = "buttonCaricaStudenti";
            buttonCaricaStudenti.Size = new Size(176, 23);
            buttonCaricaStudenti.TabIndex = 0;
            buttonCaricaStudenti.Text = "Carica Dati Studenti";
            buttonCaricaStudenti.UseVisualStyleBackColor = true;
            buttonCaricaStudenti.Click += buttonCaricaStudenti_Click;
            // 
            // dataGridViewStudenti
            // 
            dataGridViewStudenti.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewStudenti.Columns.AddRange(new DataGridViewColumn[] { Carica });
            dataGridViewStudenti.Location = new Point(194, 23);
            dataGridViewStudenti.Name = "dataGridViewStudenti";
            dataGridViewStudenti.RowHeadersWidth = 51;
            dataGridViewStudenti.Size = new Size(568, 150);
            dataGridViewStudenti.TabIndex = 1;
            dataGridViewStudenti.CellContentClick += dataGridViewStudenti_CellContentClick;
            // 
            // Carica
            // 
            Carica.HeaderText = "Carica";
            Carica.MinimumWidth = 6;
            Carica.Name = "Carica";
            Carica.Text = "Click";
            Carica.UseColumnTextForButtonValue = true;
            Carica.Width = 125;
            // 
            // buttonCancella
            // 
            buttonCancella.Location = new Point(12, 63);
            buttonCancella.Margin = new Padding(3, 2, 3, 2);
            buttonCancella.Name = "buttonCancella";
            buttonCancella.Size = new Size(82, 22);
            buttonCancella.TabIndex = 3;
            buttonCancella.Text = "cancella";
            buttonCancella.UseVisualStyleBackColor = true;
            buttonCancella.Click += buttonCancella_Click;
            // 
            // textBoxMatricola
            // 
            textBoxMatricola.Location = new Point(24, 226);
            textBoxMatricola.Margin = new Padding(3, 2, 3, 2);
            textBoxMatricola.Name = "textBoxMatricola";
            textBoxMatricola.Size = new Size(110, 23);
            textBoxMatricola.TabIndex = 4;
            // 
            // textBoxNome
            // 
            textBoxNome.Location = new Point(194, 226);
            textBoxNome.Margin = new Padding(3, 2, 3, 2);
            textBoxNome.Name = "textBoxNome";
            textBoxNome.Size = new Size(110, 23);
            textBoxNome.TabIndex = 5;
            // 
            // textBoxCognome
            // 
            textBoxCognome.Location = new Point(346, 226);
            textBoxCognome.Margin = new Padding(3, 2, 3, 2);
            textBoxCognome.Name = "textBoxCognome";
            textBoxCognome.Size = new Size(110, 23);
            textBoxCognome.TabIndex = 6;
            // 
            // textBoxDataNascita
            // 
            textBoxDataNascita.Location = new Point(508, 226);
            textBoxDataNascita.Margin = new Padding(3, 2, 3, 2);
            textBoxDataNascita.Name = "textBoxDataNascita";
            textBoxDataNascita.Size = new Size(110, 23);
            textBoxDataNascita.TabIndex = 7;
            // 
            // buttonInserisciStudente
            // 
            buttonInserisciStudente.Location = new Point(657, 224);
            buttonInserisciStudente.Margin = new Padding(3, 2, 3, 2);
            buttonInserisciStudente.Name = "buttonInserisciStudente";
            buttonInserisciStudente.Size = new Size(82, 22);
            buttonInserisciStudente.TabIndex = 8;
            buttonInserisciStudente.Text = "Inserisci";
            buttonInserisciStudente.UseVisualStyleBackColor = true;
            buttonInserisciStudente.Click += buttonInserisciStudente_Click;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(50, 209);
            label1.Name = "label1";
            label1.Size = new Size(57, 15);
            label1.TabIndex = 9;
            label1.Text = "Matricola";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(377, 210);
            label2.Name = "label2";
            label2.Size = new Size(40, 15);
            label2.TabIndex = 10;
            label2.Text = "Nome";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(219, 210);
            label3.Name = "label3";
            label3.Size = new Size(60, 15);
            label3.TabIndex = 11;
            label3.Text = "Cognome";
            // 
            // label4
            // 
            label4.AutoSize = true;
            label4.Location = new Point(525, 209);
            label4.Name = "label4";
            label4.Size = new Size(73, 15);
            label4.TabIndex = 12;
            label4.Text = "Data Nascita";
            // 
            // buttonModificaStudente
            // 
            buttonModificaStudente.Location = new Point(657, 251);
            buttonModificaStudente.Name = "buttonModificaStudente";
            buttonModificaStudente.Size = new Size(82, 23);
            buttonModificaStudente.TabIndex = 13;
            buttonModificaStudente.Text = "Modifica";
            buttonModificaStudente.UseVisualStyleBackColor = true;
            buttonModificaStudente.Click += buttonModificaStudente_Click;
            // 
            // FormInizio
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(buttonModificaStudente);
            Controls.Add(label4);
            Controls.Add(label3);
            Controls.Add(label2);
            Controls.Add(label1);
            Controls.Add(buttonInserisciStudente);
            Controls.Add(textBoxDataNascita);
            Controls.Add(textBoxCognome);
            Controls.Add(textBoxNome);
            Controls.Add(textBoxMatricola);
            Controls.Add(buttonCancella);
            Controls.Add(dataGridViewStudenti);
            Controls.Add(buttonCaricaStudenti);
            Name = "FormInizio";
            Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)dataGridViewStudenti).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Button buttonCaricaStudenti;
        private DataGridView dataGridViewStudenti;
        private DataGridViewButtonColumn Carica;
        private Button buttonCancella;
        private TextBox textBoxMatricola;
        private TextBox textBoxNome;
        private TextBox textBoxCognome;
        private TextBox textBoxDataNascita;
        private Button buttonInserisciStudente;
        private Label label1;
        private Label label2;
        private Label label3;
        private Label label4;
        private Button buttonModificaStudente;
    }
}
