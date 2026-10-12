namespace WinFormsPrima
{
    partial class FormPrima
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
            buttonCliccami = new Button();
            buttonSecondo = new Button();
            SuspendLayout();
            // 
            // buttonCliccami
            // 
            buttonCliccami.Location = new Point(589, 199);
            buttonCliccami.Name = "buttonCliccami";
            buttonCliccami.Size = new Size(75, 23);
            buttonCliccami.TabIndex = 0;
            buttonCliccami.Text = "Cliccami";
            buttonCliccami.UseVisualStyleBackColor = true;
            buttonCliccami.Click += buttonCliccami_Click;
            // 
            // buttonSecondo
            // 
            buttonSecondo.Location = new Point(189, 99);
            buttonSecondo.Name = "buttonSecondo";
            buttonSecondo.Size = new Size(75, 23);
            buttonSecondo.TabIndex = 1;
            buttonSecondo.Text = "button1";
            buttonSecondo.UseVisualStyleBackColor = true;
            buttonSecondo.Click += buttonSecondo_Click;
            // 
            // FormPrima
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1138, 680);
            Controls.Add(buttonSecondo);
            Controls.Add(buttonCliccami);
            Name = "FormPrima";
            Text = "Form";
            Load += FormPrima_Load;
            ResumeLayout(false);
        }

        #endregion

        private Button buttonCliccami;
        private Button buttonSecondo;
    }
}
