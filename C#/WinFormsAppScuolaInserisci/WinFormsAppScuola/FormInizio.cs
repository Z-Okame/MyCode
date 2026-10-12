using System.ComponentModel;
using WinFormsLibraryScuola;

namespace WinFormsAppScuola
{
    public partial class FormInizio : Form
    {
        BindingList<Studente> studenti;
        public FormInizio()
        {
            InitializeComponent();
            studenti = Studente.GetStudenti();
            dataGridViewStudenti.DataSource = studenti;
        }

        private void buttonCaricaStudenti_Click(object sender, EventArgs e)
        {
            dataGridViewStudenti.DataSource = studenti;
        }

        private void dataGridViewStudenti_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            Studente studente = studenti[e.RowIndex];
            if (e.ColumnIndex == 0)
            {
                //MessageBox.Show(studente.Cognome);
                List<int> voti = studente.Voti;
                var v = voti.Select(vo => new { Voto = vo }).Cast<Object>().ToList();
                //dataGridViewVoti.DataSource = v;
                FormVoti formVoti = new FormVoti(v);
                formVoti.ShowDialog();
            }
            else
            {
                textBoxMatricola.Text = studente.Matricola.ToString();
                textBoxCognome.Text = studente.Cognome;
                textBoxNome.Text = studente.Nome;
                textBoxDataNascita.Text = studente.DataNascita.ToString();
            }
        }

        private void buttonCancella_Click(object sender, EventArgs e)
        {
            studenti.RemoveAt(1);

        }

        private void buttonInserisciStudente_Click(object sender, EventArgs e)
        {
            Studente s = new Studente(Convert.ToInt32(textBoxMatricola.Text), textBoxNome.Text, textBoxCognome.Text, DateTime.Parse(textBoxDataNascita.Text), new List<int> { 3, 4, 5 });
            studenti.Add(s);
        }

        private void buttonModificaStudente_Click(object sender, EventArgs e)
        {
            Studente s = studenti.FirstOrDefault(x => x.Matricola.ToString() == textBoxMatricola.Text);
            s.Cognome = textBoxCognome.Text;
            s.Nome = textBoxNome.Text;
            s.DataNascita = DateTime.Parse(textBoxDataNascita.Text);
            dataGridViewStudenti.Refresh();
        }
    }
}