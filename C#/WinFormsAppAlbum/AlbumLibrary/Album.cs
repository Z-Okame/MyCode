using System.Collections.Generic;
using System.Data;

namespace AlbumLibrary
{
    public class Album
    {
        private int id;
        private string titolo;
        private string autore;
        private int anno;
        private string categoria;
        private int durataMinuti;

        public int ID { get => id; set => id = value; }
        public string Titolo { get => titolo; set => titolo = value; }
        public string Autore { get => autore; set => autore = value; }
        public int Anno { get => anno; set => anno = value; }
        public string Categoria { get => categoria; set => categoria = value; }
        public int DurataMinuti { get => durataMinuti; set => durataMinuti = value; }

        public Album(int id, string titolo, string autore, int anno, string categoria, int durataMinuti)
        {
            ID = id;
            Titolo = titolo;
            Autore = autore;
            Anno = anno;
            Categoria = categoria;
            DurataMinuti = durataMinuti;
        }


        public static List<Album> GetSampleData()
        {
            return new List<Album>
            {
                new(190290, "The dark side of the moon", "Pink Floyd", 1973, "rock", 57),
                new(2903123, "Variazioni Goldberg", "Bach", 1741, "classica", 51),
                new(2609101, "The Visitors", "ABBA", 1981, "pop", 62),
                new(93401, "Kind of Blue", "Miles Davis", 1959, "jazz", 48)
            };
        }
    }

    public class Dati
    {
        public DataTable AlbumDiCategoria(string categoria)
        {
            DataTable tableCategoria = new DataTable();

            tableCategoria.Columns.AddRange(new DataColumn[]
            {
                new DataColumn("ID", typeof(int)),
                new DataColumn("Titolo", typeof(string)),
                new DataColumn("Autore", typeof(string)),
                new DataColumn("Anno", typeof(int)),
                new DataColumn("Categoria", typeof(string)),
                new DataColumn("DurataMinuti", typeof(int))
            });

            foreach (Album album in Album.GetSampleData())
            {
                if (string.Equals(album.Categoria, categoria, StringComparison.OrdinalIgnoreCase))
                {
                    tableCategoria.Rows.Add(
                        album.ID,
                        album.Titolo,
                        album.Autore,
                        album.Anno,
                        album.Categoria,
                        album.DurataMinuti);
                }
            }

            return tableCategoria;
        }

        public string TitoloAlbumPiuVecchio(DataTable tabellaAlbum)
        {
            if (tabellaAlbum.Rows.Count == 0)
            {
                return string.Empty;
            }

            DataRow albumPiuVecchio = tabellaAlbum.Rows[0];

            foreach (DataRow album in tabellaAlbum.Rows)
            {
                if (Convert.ToInt32(album["Anno"]) < Convert.ToInt32(albumPiuVecchio["Anno"]))
                {
                    albumPiuVecchio = album;
                }
            }

            return Convert.ToString(albumPiuVecchio["Titolo"]) ?? string.Empty;
        }

        public double MediaDurataAlbum(DataTable tabellaAlbum)
        {
            if (tabellaAlbum.Rows.Count == 0)
            {
                return 0;
            }

            int durataTotale = 0;

            foreach (DataRow album in tabellaAlbum.Rows)
            {
                durataTotale += Convert.ToInt32(album["DurataMinuti"]);
            }

            return (double)durataTotale / tabellaAlbum.Rows.Count;
        }
    }
}
