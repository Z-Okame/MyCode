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
    public partial class FormAreaPersonale : Form
    {
        public FormAreaPersonale(Utente user)
        {
            InitializeComponent();
            labelUserEmail.Text = "Email : " + user.Email;
            labelUserUsername.Text = "Username : " + user.User;
            labelBentornato.Text = "Bentornato " + user.User + "!";
        }
    }
}
