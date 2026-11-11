namespace WinFormsAppOrdini
{
    partial class WindowsFormOrdini
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
            dataGridViewOrdini = new DataGridView();
            labelTitoloOrdini = new Label();
            ((System.ComponentModel.ISupportInitialize)dataGridViewOrdini).BeginInit();
            SuspendLayout();
            // 
            // dataGridViewOrdini
            // 
            dataGridViewOrdini.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewOrdini.Location = new Point(114, 62);
            dataGridViewOrdini.Name = "dataGridViewOrdini";
            dataGridViewOrdini.Size = new Size(561, 308);
            dataGridViewOrdini.TabIndex = 0;
            dataGridViewOrdini.CellContentClick += this.dataGridViewOrdini_CellContentClick;
            // 
            // labelTitoloOrdini
            // 
            labelTitoloOrdini.AutoSize = true;
            labelTitoloOrdini.Location = new Point(374, 30);
            labelTitoloOrdini.Name = "labelTitoloOrdini";
            labelTitoloOrdini.Size = new Size(40, 15);
            labelTitoloOrdini.TabIndex = 1;
            labelTitoloOrdini.Text = "Ordini";
            // 
            // WindowsFormOrdini
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(labelTitoloOrdini);
            Controls.Add(dataGridViewOrdini);
            Name = "WindowsFormOrdini";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "Gestione Ordini";
            ((System.ComponentModel.ISupportInitialize)dataGridViewOrdini).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private DataGridView dataGridViewOrdini;
        private Label labelTitoloOrdini;
    }
}