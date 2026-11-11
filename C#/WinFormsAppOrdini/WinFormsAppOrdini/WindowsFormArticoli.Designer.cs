namespace WinFormsAppOrdini
{
    partial class WindowsFormArticoli
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
            dataGridViewArticoli = new DataGridView();
            labelArticoliTitolo = new Label();
            labelSomma = new Label();
            labelMedia = new Label();
            buttonSommaMedia = new Button();
            buttonAggiungiArticolo = new Button();
            textBoxNome = new TextBox();
            textBoxPrezzo = new TextBox();
            labelNome = new Label();
            labelPrezzo = new Label();
            ((System.ComponentModel.ISupportInitialize)dataGridViewArticoli).BeginInit();
            SuspendLayout();
            // 
            // dataGridViewArticoli
            // 
            dataGridViewArticoli.AllowUserToAddRows = false;
            dataGridViewArticoli.AllowUserToDeleteRows = false;
            dataGridViewArticoli.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dataGridViewArticoli.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewArticoli.Location = new Point(72, 59);
            dataGridViewArticoli.Name = "dataGridViewArticoli";
            dataGridViewArticoli.ReadOnly = true;
            dataGridViewArticoli.RowHeadersVisible = false;
            dataGridViewArticoli.Size = new Size(669, 325);
            dataGridViewArticoli.TabIndex = 0;
            // 
            // labelArticoliTitolo
            // 
            labelArticoliTitolo.AutoSize = true;
            labelArticoliTitolo.Location = new Point(72, 29);
            labelArticoliTitolo.Name = "labelArticoliTitolo";
            labelArticoliTitolo.Size = new Size(45, 15);
            labelArticoliTitolo.TabIndex = 1;
            labelArticoliTitolo.Text = "Articoli";
            // 
            // labelSomma
            // 
            labelSomma.AutoSize = true;
            labelSomma.Location = new Point(72, 396);
            labelSomma.Name = "labelSomma";
            labelSomma.Size = new Size(0, 15);
            labelSomma.TabIndex = 2;
            // 
            // labelMedia
            // 
            labelMedia.AutoSize = true;
            labelMedia.Location = new Point(72, 421);
            labelMedia.Name = "labelMedia";
            labelMedia.Size = new Size(0, 15);
            labelMedia.TabIndex = 3;
            // 
            // buttonSommaMedia
            // 
            buttonSommaMedia.Location = new Point(581, 396);
            buttonSommaMedia.Name = "buttonSommaMedia";
            buttonSommaMedia.Size = new Size(160, 30);
            buttonSommaMedia.TabIndex = 4;
            buttonSommaMedia.Text = "Calcola somma e media";
            buttonSommaMedia.UseVisualStyleBackColor = true;
            buttonSommaMedia.Click += buttonSommaMedia_Click;
            // 
            // buttonAggiungiArticolo
            // 
            buttonAggiungiArticolo.Location = new Point(581, 21);
            buttonAggiungiArticolo.Name = "buttonAggiungiArticolo";
            buttonAggiungiArticolo.Size = new Size(160, 30);
            buttonAggiungiArticolo.TabIndex = 5;
            buttonAggiungiArticolo.Text = "Aggiungi Articolo";
            buttonAggiungiArticolo.UseVisualStyleBackColor = true;
            buttonAggiungiArticolo.Click += buttonAggiungiArticolo_Click;
            // 
            // textBoxNome
            // 
            textBoxNome.Location = new Point(297, 390);
            textBoxNome.Name = "textBoxNome";
            textBoxNome.Size = new Size(100, 23);
            textBoxNome.TabIndex = 6;
            // 
            // textBoxPrezzo
            // 
            textBoxPrezzo.Location = new Point(297, 419);
            textBoxPrezzo.Name = "textBoxPrezzo";
            textBoxPrezzo.Size = new Size(100, 23);
            textBoxPrezzo.TabIndex = 7;
            // 
            // labelNome
            // 
            labelNome.AutoSize = true;
            labelNome.Location = new Point(251, 393);
            labelNome.Name = "labelNome";
            labelNome.Size = new Size(40, 15);
            labelNome.TabIndex = 8;
            labelNome.Text = "Nome";
            // 
            // labelPrezzo
            // 
            labelPrezzo.AutoSize = true;
            labelPrezzo.Location = new Point(250, 421);
            labelPrezzo.Name = "labelPrezzo";
            labelPrezzo.Size = new Size(41, 15);
            labelPrezzo.TabIndex = 9;
            labelPrezzo.Text = "Prezzo";
            // 
            // WindowsFormArticoli
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(labelPrezzo);
            Controls.Add(labelNome);
            Controls.Add(textBoxPrezzo);
            Controls.Add(textBoxNome);
            Controls.Add(buttonAggiungiArticolo);
            Controls.Add(buttonSommaMedia);
            Controls.Add(labelMedia);
            Controls.Add(labelSomma);
            Controls.Add(labelArticoliTitolo);
            Controls.Add(dataGridViewArticoli);
            Name = "WindowsFormArticoli";
            StartPosition = FormStartPosition.CenterParent;
            Text = "Articoli";
            ((System.ComponentModel.ISupportInitialize)dataGridViewArticoli).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private DataGridView dataGridViewArticoli;
        private Label labelArticoliTitolo;
        private Label labelSomma;
        private Label labelMedia;
        private Button buttonSommaMedia;
        private Button buttonAggiungiArticolo;
        private TextBox textBoxNome;
        private TextBox textBoxPrezzo;
        private Label labelNome;
        private Label labelPrezzo;
    }
}