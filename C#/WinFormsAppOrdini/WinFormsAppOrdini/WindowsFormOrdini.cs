using WinFormsLibraryOrdini;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace WinFormsAppOrdini
{
    public partial class WindowsFormOrdini : Form
    {
        private Dati dati = new Dati();

        public WindowsFormOrdini()
        {
            InitializeComponent();
            dataGridViewOrdini.DataSource = dati.GetOrdini();
        }

        private void dataGridViewOrdini_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex < 0) return; 

            int idOrdine = Convert.ToInt32(dataGridViewOrdini.Rows[e.RowIndex].Cells["IdOrdine"].Value);
            WindowsFormArticoli formArticoli = new WindowsFormArticoli(idOrdine);
            formArticoli.ShowDialog();
        }
    }
}