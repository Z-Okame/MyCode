namespace WinFormsPrima
{
    public partial class FormPrima : Form
    {
        private int counter = 0;
        public FormPrima()
        {
            InitializeComponent();
        }

        private void buttonSecondo_Click(object sender, EventArgs e)
        {
            MessageBox.Show($"Counter: {counter}");
        }

        private void FormPrima_Load(object sender, EventArgs e)
        {
            counter = 10;
        }

        private void buttonCliccami_Click(object sender, EventArgs e)
        {
            counter--;
        }
    }
}
