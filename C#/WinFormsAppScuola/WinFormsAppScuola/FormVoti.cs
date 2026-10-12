using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace WinFormsAppScuola
{
    public partial class FormVoti : Form
    {
        List<Object> voti;
        public FormVoti(List<Object> l)
        {
            InitializeComponent();
            voti = l;
            dataGridViewVoti.DataSource = voti;
        }
    }
}
