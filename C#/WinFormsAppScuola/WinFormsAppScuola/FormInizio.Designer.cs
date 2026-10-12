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
            dataGridViewVoti = new DataGridView();
            ((System.ComponentModel.ISupportInitialize)dataGridViewStudenti).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dataGridViewVoti).BeginInit();
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
            dataGridViewStudenti.Size = new Size(568, 150);
            dataGridViewStudenti.TabIndex = 1;
            dataGridViewStudenti.CellContentClick += dataGridViewStudenti_CellContentClick;
            // 
            // Carica
            // 
            Carica.HeaderText = "Carica";
            Carica.Name = "Carica";
            Carica.Text = "Click";
            Carica.UseColumnTextForButtonValue = true;
            // 
            // dataGridViewVoti
            // 
            dataGridViewVoti.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewVoti.Location = new Point(194, 189);
            dataGridViewVoti.Name = "dataGridViewVoti";
            dataGridViewVoti.Size = new Size(352, 150);
            dataGridViewVoti.TabIndex = 2;
            // 
            // FormInizio
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(dataGridViewVoti);
            Controls.Add(dataGridViewStudenti);
            Controls.Add(buttonCaricaStudenti);
            Name = "FormInizio";
            Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)dataGridViewStudenti).EndInit();
            ((System.ComponentModel.ISupportInitialize)dataGridViewVoti).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private Button buttonCaricaStudenti;
        private DataGridView dataGridViewStudenti;
        private DataGridViewButtonColumn Carica;
        private DataGridView dataGridViewVoti;
    }
}
