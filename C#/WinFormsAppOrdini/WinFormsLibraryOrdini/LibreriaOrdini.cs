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

        public static List<Ordine> GetSampleData()
        {
            return new List<Ordine>
            {
                new Ordine(2012, 1210, "12/12/2020"),
                new Ordine(9020, 801, "01/04/2021"),
                new Ordine(3340, 651, "12/06/2021")
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

        public static List<Articolo> GetSampleData()
        {
            return new List<Articolo>
            {
                new Articolo("Iphone 15", 2012, 1200.20),
                new Articolo("PC Sony intel i7", 2012, 230.45),
                new Articolo("PC Olidata i7", 9020, 320.50),
                new Articolo("Webcam Logitec", 3340, 31.00)
            };
        }
    }

    public class Dati
    {
        private static DataTable ordini;
        private static DataTable articoli;

        public DataTable GetOrdini()
        {
            if (ordini == null)
            {
                ordini = new DataTable("Ordini");
                ordini.Columns.Add("IdOrdine", typeof(int));
                ordini.Columns.Add("IdCliente", typeof(int));
                ordini.Columns.Add("Data", typeof(string));

                foreach (Ordine o in Ordine.GetSampleData())
                    ordini.Rows.Add(o.IdOrdine, o.IdCliente, o.Data);
            }
            return ordini;
        }

        public DataTable GetArticoli()
        {
            if (articoli == null)
            {
                articoli = new DataTable("Articoli");
                articoli.Columns.Add("NomeArticolo", typeof(string));
                articoli.Columns.Add("IdOrdine", typeof(int));
                articoli.Columns.Add("Importo", typeof(double));

                foreach (Articolo a in Articolo.GetSampleData())
                    articoli.Rows.Add(a.NomeArticolo, a.IdOrdine, a.Importo);
            }
            return articoli;
        }

        public DataTable ArticoliPerOrdine(int idOrdine)
        {
            DataView view = new DataView(GetArticoli());
            view.RowFilter = $"IdOrdine = {idOrdine}";
            return view.ToTable();
        }

        public double SommaImporti(int idOrdine)
        {
            return ArticoliPerOrdine(idOrdine)
                .AsEnumerable()
                .Sum(r => r.Field<double>("Importo"));
        }

        public double MediaImporti(int idOrdine)
        {
            var righe = ArticoliPerOrdine(idOrdine).AsEnumerable().ToList();
            if (righe.Count == 0) return 0;
            return righe.Average(r => r.Field<double>("Importo"));
        }

        public void AggiungiArticolo(string nome, int idOrdine, double prezzo)
        {
            GetArticoli().Rows.Add(nome, idOrdine, prezzo);
        }

    }
}