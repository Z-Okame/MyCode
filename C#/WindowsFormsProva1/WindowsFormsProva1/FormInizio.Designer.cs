namespace WindowsFormsProva1
{
    partial class FormInizio
    {
        /// <summary>
        /// Variabile di progettazione necessaria.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Pulire le risorse in uso.
        /// </summary>
        /// <param name="disposing">ha valore true se le risorse gestite devono essere eliminate, false in caso contrario.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Codice generato da Progettazione Windows Form

        /// <summary>
        /// Metodo necessario per il supporto della finestra di progettazione. Non modificare
        /// il contenuto del metodo con l'editor di codice.
        /// </summary>
        private void InitializeComponent()
        {
            this.buttonProva = new System.Windows.Forms.Button();
            this.comboBoxProva = new System.Windows.Forms.ComboBox();
            this.labelProva = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // buttonProva
            // 
            this.buttonProva.Location = new System.Drawing.Point(33, 39);
            this.buttonProva.Name = "buttonProva";
            this.buttonProva.Size = new System.Drawing.Size(66, 37);
            this.buttonProva.TabIndex = 0;
            this.buttonProva.Text = "el buton de prova";
            this.buttonProva.UseVisualStyleBackColor = true;
            // 
            // comboBoxProva
            // 
            this.comboBoxProva.FormattingEnabled = true;
            this.comboBoxProva.Location = new System.Drawing.Point(120, 48);
            this.comboBoxProva.Name = "comboBoxProva";
            this.comboBoxProva.Size = new System.Drawing.Size(379, 21);
            this.comboBoxProva.TabIndex = 1;
            this.comboBoxProva.SelectedIndexChanged += new System.EventHandler(this.comboBoxProva_SelectedIndexChanged);
            // 
            // labelProva
            // 
            this.labelProva.AutoSize = true;
            this.labelProva.Location = new System.Drawing.Point(518, 51);
            this.labelProva.Name = "labelProva";
            this.labelProva.Size = new System.Drawing.Size(35, 13);
            this.labelProva.TabIndex = 2;
            this.labelProva.Text = "label1";
            // 
            // FormInizio
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.labelProva);
            this.Controls.Add(this.comboBoxProva);
            this.Controls.Add(this.buttonProva);
            this.Name = "FormInizio";
            this.Text = "FormInizio";
            this.Load += new System.EventHandler(this.FormInizio_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button buttonProva;
        private System.Windows.Forms.ComboBox comboBoxProva;
        private System.Windows.Forms.Label labelProva;
    }
}

