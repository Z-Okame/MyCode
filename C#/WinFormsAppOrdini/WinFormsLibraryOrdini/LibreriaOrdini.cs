using System.Data;

namespace WinFormsLibraryOrdini
{
    public class Ordine
    {
        private int idOrdine;
        private int idCliente;
        private string data;

        public int IdOrdine { get => idOrdine; set => idOrdine = value; }
        public int IdCliente { get => idCliente; set => idCliente = value; }
        public string Data { get => data; set => data = value; }

        public Ordine(int idOrdine, int idCliente, string data)
        {
            IdOrdine = idOrdine;
            IdCliente = idCliente;
            Data = data;
        }

        public List<Ordine> GetSampleData()
        {
            return new List<Ordine>
            {
                new Ordine(2012,1210,"12/12/2020"),
                new Ordine(9020,801,"01/04/2021"),
                new Ordine(3340,651,"12/06/2021")
            };
        }
    }

    public class Articolo
    {
        private string nomeArticolo;
        private int idOrdine;
        private double importo;

        public string NomeArticolo { get => nomeArticolo; set => nomeArticolo = value; }
        public int IdOrdine { get => idOrdine; set => idOrdine = value; }
        public double Importo { get => importo; set => importo = value; }

        public Articolo(string nomeArticolo, int idOrdine, double importo)
        {
            NomeArticolo = nomeArticolo;
            IdOrdine = idOrdine;
            Importo = importo;
        }

        public List<Articolo> GetSampleData()
        {
            return new List<Articolo> {
            new Articolo("Iphone 15", 2012, 1200.20),
            new Articolo("PC Sony intel i7",2012,230.45),
            new Articolo("PC Olidata i7", 9020, 320.50)
            };
        }
    }

    public class Dati
    {
        public DataTable GetArticoli()
        {

        }
        public DataTable GetOrdini();

    }
}
