using AlbumLibrary;
using System.Data;

namespace WinFormsAppAlbum
{
    public partial class FormInizio : Form
    {
        private DataTable tabellaAlbum;
        private Dati dati;

        public FormInizio()
        {
            InitializeComponent();
            dati = new Dati();
        }

        private void buttonCaricaAlbum_Click_1(object sender, EventArgs e)
        {
            if (comboBoxCategoria.SelectedItem is not string categoria)
            {
                return;
            }

            tabellaAlbum = dati.AlbumDiCategoria(categoria);
            dataGridView1.DataSource = tabellaAlbum;
        }

        private void buttonVisualizzaInfo_Click(object sender, EventArgs e)
        {
            if (tabellaAlbum is null)
            {
                return;
            }

            labelAlbumVecchio.Text = $"Titolo Album più vecchio: {dati.TitoloAlbumPiuVecchio(tabellaAlbum)}";
            labelDurataMediaAlbum.Text = $"Durata media (minuti): {dati.MediaDurataAlbum(tabellaAlbum):F2}";
        }
    }
}
