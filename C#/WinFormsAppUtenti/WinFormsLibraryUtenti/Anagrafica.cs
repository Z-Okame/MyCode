using System.Data;
using System.Diagnostics;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.TreeView;

namespace WinFormsLibraryUtenti
{
    public class Anagrafica
    {
        private int id;
        private string cognome;
        private string nome;

        public int Id { get => id; set => id = value; }
        public string Cognome { get => cognome; set => cognome = value; }
        public string Nome { get => nome; set => nome = value; }

        public Anagrafica(int id, string cognome, string nome)
        {
            Id = id;
            Cognome = cognome;
            Nome = nome;
        }

        public static List<Anagrafica> GetSampleData()
        {
            List<Anagrafica> anagrafiche = new List<Anagrafica>
                {
                    new Anagrafica(190290, "Bianchi", "Mirko"),
                    new Anagrafica(193460, "Verdi", "Marco"),
                    new Anagrafica(234746, "Verdi", "Marco")
                };
            return anagrafiche;
        }
    }

    public class Utente
    {
        private int id;
        private string user;
        private string password;
        private string email;

        public int Id { get => id; set => id = value; }
        public string User { get => user; set => user = value; }
        public string Password { get => password; set => password = value; }
        public string Email { get => email; set => email = value; }

        public Utente(int id, string user, string password, string email)
        {
            Id = id;
            User = user;
            Password = password;
            Email = email;
        }

        public static List<Utente> GetSampleData()
        {
            List<Utente> utenti = new List<Utente>
            {
                new Utente(190290, "mirko.bianchi", "kjn4_2", "mirko.bianchi@itis.pr.it"),
                new Utente(193460, "marco.verdi", "poi9_A", "marco.verdi@itis.pr.it"),
                new Utente(234746, "marco.verdi1", "asAwL_c", "marco.verdi1@itis.pr.it")
            };

            return utenti;
        }
    }

    public class Dati
    {

        public DataTable GetAnagrafica()
        {
            DataTable anagrafica = new DataTable();

            anagrafica.Columns.AddRange(new DataColumn[]
            {
                new DataColumn("ID",typeof(int)),
                new DataColumn("Nome",typeof(string)),
                new DataColumn("Cognome",typeof(string))
            });

            foreach (Anagrafica anagraficaDato in Anagrafica.GetSampleData())
            {
                anagrafica.Rows.Add(
                    anagraficaDato.Id,
                    anagraficaDato.Nome,
                    anagraficaDato.Cognome);
            }

            return anagrafica;
        }

        public DataTable GetUtenti()
        {
            DataTable utenti = new DataTable();

            utenti.Columns.AddRange(new DataColumn[]
            {
                new DataColumn("ID", typeof(int)),
                new DataColumn("User", typeof(string)),
                new DataColumn("Password", typeof(string)),
                new DataColumn("Email", typeof(string))
            });

            foreach (Utente utente in Utente.GetSampleData())
            {
                utenti.Rows.Add(
                    utente.Id,
                    utente.User,
                    utente.Password,
                    utente.Email);
            }

            return utenti;
        }
    }
}
