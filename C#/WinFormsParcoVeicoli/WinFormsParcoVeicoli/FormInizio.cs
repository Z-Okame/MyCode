using System.ComponentModel;
using WinFormsLibraryVeicoli;

namespace WinFormsParcoVeicoli
{
    public partial class FormInizio : Form
    {
        BindingList<Veicolo> veicoli;
        public FormInizio()
        {
            InitializeComponent();
            veicoli = new BindingList<Veicolo>();
            dataGridViewVeicoli.DataSource = veicoli;
        }

        private void dataGridViewVeicoli_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 0)
            {
                Veicolo veicolo = veicoli[e.RowIndex];
                textBoxTarga.Text = veicolo.Targa.ToString();
                textBoxMarca.Text = veicolo.Marca.ToString();
                textBoxModello.Text = veicolo.Modello.ToString();
                textBoxChilometriPercorsi.Text = veicolo.ChilometriPercorsi.ToString();
                textBoxProprietà.Text = veicolo is Auto auto ? auto.NumeroPorte.ToString() : veicolo is Camion camion ? camion.CapacitaCarico.ToString() : string.Empty;
                comboBoxScelta.SelectedIndex = veicolo is Auto ? 0 : 1;
            }

        }

        private void buttonElimina_Click(object sender, EventArgs e)
        {
            veicoli.RemoveAt(dataGridViewVeicoli.CurrentCell.RowIndex);
        }

        private void buttonInserisci_Click(object sender, EventArgs e)
        {
            if (comboBoxScelta.SelectedItem.ToString() == "Auto")
                veicoli.Add(new Auto(int.Parse(textBoxProprietà.Text), textBoxTarga.Text, textBoxMarca.Text, textBoxModello.Text, double.Parse(textBoxChilometriPercorsi.Text)));
            else
                veicoli.Add(new Camion(double.Parse(textBoxProprietà.Text), textBoxTarga.Text, textBoxMarca.Text, textBoxModello.Text, double.Parse(textBoxChilometriPercorsi.Text)));
        }

        private void buttonModifica_Click(object sender, EventArgs e)
        {                   
            Veicolo v = veicoli.FirstOrDefault(x => x.Targa.ToString() == textBoxTarga.Text);
            v.Marca = textBoxMarca.Text;
            v.Modello = textBoxModello.Text;
            v.ChilometriPercorsi = Convert.ToInt32(textBoxChilometriPercorsi.Text);
            if (v is Auto auto)
            {
                auto.NumeroPorte = Convert.ToInt32(textBoxProprietà.Text);
            }
            else if (v is Camion camion)
            {
                textBoxProprietà.Text.Replace('.', ',');
                camion.CapacitaCarico = Convert.ToDouble(textBoxProprietà.Text);
            }
            dataGridViewVeicoli.Refresh();
        }

        private void FormInizio_Load(object sender, EventArgs e)
        {
                        
        }
    }
}
