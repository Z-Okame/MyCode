using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsProva1
{
    public partial class FormInizio : Form
    {
        List<Studente> lista;
        public FormInizio()
        {
            InitializeComponent();
            lista = new List<Studente>();
            lista.Add(new Studente(1,"pippo","pippo"));
            lista.Add(new Studente(2, "topolino", "topolino"));
            lista.Add(new Studente(2, "eta", "beta"));
        }

        private void FormInizio_Load(object sender, EventArgs e)
        {
            /*
            comboBoxProva.Items.Add("uno");
            comboBoxProva.Items.Add("due");
            comboBoxProva.Items.Add("tre");
            */
            comboBoxProva.DataSource = lista;
            comboBoxProva.DisplayMember = "Cognome";
        }

        private void comboBoxProva_SelectedIndexChanged(object sender, EventArgs e)
        {
            Studente s = ((Studente)comboBoxProva.SelectedItem);
            labelProva.Text = s.Cognome + " " + s.Nome;
        }
    }
}
