namespace WinFormsLibraryGestioneBiblioteca
{
    public abstract class Risorsa
    {
        private String codice;
        private String titolo;
        private String autore;
        private int giorniPrestito;

        public string Codice { get => codice; set => codice = value; }
        public string Titolo { get => titolo; set => titolo = value; }
        public string Autore { get => autore; set => autore = value; }
        public int GiorniPrestito { get => giorniPrestito; set => giorniPrestito = value; }

        protected Risorsa(string codice, string titolo, string autore, int giorniPrestito)
        {
            Codice = codice;
            Titolo = titolo;
            Autore = autore;
            GiorniPrestito = giorniPrestito;
        }

        public virtual String StampaDettagli()
        {
            return $"Codice: {Codice}, Titolo: {Titolo}, Autore: {Autore}, Giorni di Prestito: {GiorniPrestito}";
        }
        public virtual double CalcolaPenaleRitardo()
        {
            return 0.20 * GiorniPrestito;
        }

    }

    public class Libro : Risorsa
    {
        private int numeroPagine;

        public int NumeroPagine { get => numeroPagine; set => numeroPagine = value; }


        public Libro(int numeroPagine, string codice, string titolo, string autore, int giorniPrestito1) : base(codice, titolo, autore, giorniPrestito1)
        {
            NumeroPagine = numeroPagine;
        }

        public override string StampaDettagli()
        {
            return base.StampaDettagli() + $",Numero Pagine: {NumeroPagine}";
        }

        public override double CalcolaPenaleRitardo()
        {
            return base.CalcolaPenaleRitardo() + 5;
        }
    }

    public class AudioLibro : Risorsa
    {
        private int durataMinuti;

        public int DurataMinuti { get => durataMinuti; set => durataMinuti = value; }

        public AudioLibro(int durataMinuti,string codice, string titolo, string autore, int giorniPrestito1) : base(codice, titolo, autore, giorniPrestito1)
        {
            DurataMinuti = durataMinuti;
        }

        public override string StampaDettagli()
        {
            return base.StampaDettagli() +  $",Durata: {DurataMinuti} minuti";
        }

        public override double CalcolaPenaleRitardo()
        {
            return 0.50 * GiorniPrestito + (0.01 * DurataMinuti);
        }
    }


    public class Catalogo
    {
        private List<Risorsa> elencoRisorse;

        public void AggiungiRisorsa(Risorsa r)
        {
            elencoRisorse.Add(r);
        }

        public String VisualizzaCatalogo()
        {
            String strCatalogo = "";

            foreach (var r in elencoRisorse)
            {
                strCatalogo += "\n" + r.StampaDettagli();
            }

            return strCatalogo;

        }

        public double CalcolaPenaleTotale()
        {
            double sommaTotale = 0;
            foreach (var r in elencoRisorse)
            {
                sommaTotale += r.CalcolaPenaleRitardo();
            }

            return sommaTotale;
        }
        
    }
}
