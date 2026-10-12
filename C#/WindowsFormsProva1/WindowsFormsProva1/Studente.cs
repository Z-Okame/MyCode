using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsProva1
{
    public class Studente
    {
        int matricola;
        string nome;
        string cognome;

        public Studente(int matricola, string nome, string cognome)
        {
            Matricola = matricola;
            Nome = nome;
            Cognome = cognome;
        }

        public int Matricola { get => matricola; set => matricola = value; }
        public string Nome { get => nome; set => nome = value; }
        public string Cognome { get => cognome; set => cognome = value; }

    }
}
