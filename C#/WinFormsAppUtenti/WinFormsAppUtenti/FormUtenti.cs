using System.Data;
using WinFormsLibraryUtenti;


namespace WinFormsAppUtenti

{
    public partial class FormUtenti : Form
    {
        public FormUtenti()
        {
            InitializeComponent();
            Dati d = new Dati();
            dataGridViewUtenti.DataSource = d.GetUtentiCompleti();
            dataGridViewAnagrafica.DataSource = d.GetAnagrafica();
        }

        private void buttonLogIn_Click(object sender, EventArgs e)
        {
            FormLogin f = new FormLogin(Utente.GetSampleData());
            f.ShowDialog();
        }

        private void buttonAnagrafica_Click(object sender, EventArgs e)
        {
            string nome = textBoxNome.Text.Trim();
            string cognome = textBoxCognome.Text.Trim();

            if (string.IsNullOrWhiteSpace(nome) || string.IsNullOrWhiteSpace(cognome))
            {
                MessageBox.Show("Inserisci nome e cognome.");
                return;
            }

            DataTable anagrafica = (DataTable)dataGridViewAnagrafica.DataSource;

            int id = anagrafica.Rows.Count == 0
                ? 1
                : anagrafica.AsEnumerable().Max(r => r.Field<int>("ID")) + 1;

            anagrafica.Rows.Add(id, cognome, nome);

            textBoxNome.Clear();
            textBoxCognome.Clear();
        }

    }
}
