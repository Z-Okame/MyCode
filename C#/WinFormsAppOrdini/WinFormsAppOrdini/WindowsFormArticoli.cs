using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using WinFormsLibraryOrdini;

namespace WinFormsAppOrdini
{
    public partial class WindowsFormArticoli : Form
    {
        private int idOrdine;
        private Dati dati = new Dati();

        public WindowsFormArticoli(int idOrdine)
        {
            InitializeComponent();
            this.idOrdine = idOrdine;
            labelArticoliTitolo.Text = $"Articoli dell'ordine {idOrdine}";
            dataGridViewArticoli.DataSource = dati.ArticoliPerOrdine(idOrdine);
        }

        private void buttonSommaMedia_Click(object sender, EventArgs e)
        {
            labelSomma.Text = $"Somma importi: {dati.SommaImporti(idOrdine):F2}";
            labelMedia.Text = $"Media importi: {dati.MediaImporti(idOrdine):F2}";
        }

        private void buttonAggiungiArticolo_Click(object sender, EventArgs e)
        {
            dati.AggiungiArticolo(textBoxNome.Text,idOrdine, Convert.ToDouble(textBoxPrezzo.Text.Replace(".",","))); //in caso gli argomenti sono i textbox
            dataGridViewArticoli.DataSource = dati.ArticoliPerOrdine(idOrdine);


            //azzera le label
            labelMedia.Text = "";
            labelSomma.Text = "";
        }
    }
}