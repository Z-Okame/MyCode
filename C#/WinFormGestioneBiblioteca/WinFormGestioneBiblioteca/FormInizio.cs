using System.ComponentModel;
using WinFormsLibraryGestioneBiblioteca;
namespace WinFormGestioneBiblioteca
{
    public partial class FormInizio : Form
    {
        BindingList<Risorsa> risorse;
        public FormInizio()
        {
            InitializeComponent();
        }

        private void buttonInserisci_Click(object sender, EventArgs e)
        {
            if (radioButtonLibro.Checked)
            {
                risorse.Add(new Libro(int.Parse(textBoxProprietà.Text), textBoxCodice.Text, textBoxTitolo.Text, textBoxAutore.Text, int.Parse(textBoxGiorniPrestito.Text)));
            }
            else
            {
                risorse.Add(new AudioLibro(int.Parse(textBoxProprietà.Text), textBoxCodice.Text, textBoxTitolo.Text, textBoxAutore.Text, int.Parse(textBoxGiorniPrestito.Text)));
            }
        }

        private void buttonModifica_Click(object sender, EventArgs e)
        {
            Risorsa r = risorse.FirstOrDefault(x => x.Codice.ToString() == textBoxCodice.Text);
            r.Titolo = textBoxTitolo.Text;
            r.Autore = textBoxAutore.Text;
            r.GiorniPrestito = Convert.ToInt32(textBoxGiorniPrestito.Text);
            if (r is Libro libro)
                libro.NumeroPagine = Convert.ToInt32(textBoxProprietà.Text);
            else if (r is AudioLibro audiolibro)
                audiolibro.DurataMinuti = Convert.ToInt32(textBoxProprietà.Text);
            dataGridViewGestione.Refresh();
        }

        private void dataGridViewGestione_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if  (e.ColumnIndex == 0)
            {

            }
        }

    }
}
