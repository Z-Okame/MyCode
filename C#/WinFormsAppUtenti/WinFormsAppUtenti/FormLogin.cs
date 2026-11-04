using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using WinFormsLibraryUtenti;

namespace WinFormsAppUtenti
{
    public partial class FormLogin : Form
    {
        private List<Utente> users;
        public FormLogin(List<Utente> u)
        {
            InitializeComponent();
            users = u;
        }

        private void buttonLogIn_Click(object sender, EventArgs e)
        {
            Utente utente = users.FirstOrDefault(u => u.Email == textBoxEmail.Text && u.Password == textBoxPassword.Text);
            if (utente != null)
            {
                FormAreaPersonale formpersonale = new FormAreaPersonale(utente);
                formpersonale.ShowDialog();
            }
        }
    }
}
