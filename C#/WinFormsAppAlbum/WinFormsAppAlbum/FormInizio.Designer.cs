namespace WinFormsAppAlbum
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
            comboBoxCategoria = new ComboBox();
            labelAlbumVecchio = new Label();
            labelDurataMediaAlbum = new Label();
            dataGridView1 = new DataGridView();
            buttonCaricaAlbum = new Button();
            buttonVisualizzaInfo = new Button();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            SuspendLayout();
            // 
            // comboBoxCategoria
            // 
            comboBoxCategoria.FormattingEnabled = true;
            comboBoxCategoria.Items.AddRange(new object[] { "rock", "classica", "jazz", "pop" });
            comboBoxCategoria.Location = new Point(649, 46);
            comboBoxCategoria.Name = "comboBoxCategoria";
            comboBoxCategoria.Size = new Size(121, 23);
            comboBoxCategoria.TabIndex = 1;
            // 
            // labelAlbumVecchio
            // 
            labelAlbumVecchio.AutoSize = true;
            labelAlbumVecchio.Location = new Point(488, 277);
            labelAlbumVecchio.Name = "labelAlbumVecchio";
            labelAlbumVecchio.Size = new Size(144, 15);
            labelAlbumVecchio.TabIndex = 1;
            labelAlbumVecchio.Text = "Titolo Album più vecchio:";
            // 
            // labelDurataMediaAlbum
            // 
            labelDurataMediaAlbum.AutoSize = true;
            labelDurataMediaAlbum.Location = new Point(488, 305);
            labelDurataMediaAlbum.Name = "labelDurataMediaAlbum";
            labelDurataMediaAlbum.Size = new Size(127, 15);
            labelDurataMediaAlbum.TabIndex = 2;
            labelDurataMediaAlbum.Text = "Durata media (minuti):";
            // 
            // dataGridView1
            // 
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Location = new Point(40, 29);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.Size = new Size(442, 354);
            dataGridView1.TabIndex = 3;
            // 
            // buttonCaricaAlbum
            // 
            buttonCaricaAlbum.Location = new Point(666, 88);
            buttonCaricaAlbum.Name = "buttonCaricaAlbum";
            buttonCaricaAlbum.Size = new Size(104, 23);
            buttonCaricaAlbum.TabIndex = 4;
            buttonCaricaAlbum.Text = "Carica Album";
            buttonCaricaAlbum.UseVisualStyleBackColor = true;
            buttonCaricaAlbum.Click += buttonCaricaAlbum_Click_1;
            // 
            // buttonVisualizzaInfo
            // 
            buttonVisualizzaInfo.Location = new Point(488, 241);
            buttonVisualizzaInfo.Name = "buttonVisualizzaInfo";
            buttonVisualizzaInfo.Size = new Size(104, 23);
            buttonVisualizzaInfo.TabIndex = 5;
            buttonVisualizzaInfo.Text = "Visualizza Info";
            buttonVisualizzaInfo.UseVisualStyleBackColor = true;
            buttonVisualizzaInfo.Click += this.buttonVisualizzaInfo_Click;
            // 
            // FormInizio
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(buttonVisualizzaInfo);
            Controls.Add(buttonCaricaAlbum);
            Controls.Add(dataGridView1);
            Controls.Add(labelDurataMediaAlbum);
            Controls.Add(labelAlbumVecchio);
            Controls.Add(comboBoxCategoria);
            Name = "FormInizio";
            Text = "Gestione Album";
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private ComboBox comboBoxCategoria;
        private Label labelAlbumVecchio;
        private Label labelDurataMediaAlbum;
        private DataGridView dataGridView1;
        private Button buttonCaricaAlbum;
        private Button buttonVisualizzaInfo;
    }
}
