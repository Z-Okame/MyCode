Console.WriteLine("Hello, World!");
SuperClasse SUPERCLASSE = new SuperClasse();
SUPERCLASSE.Attributo = 1;
Console.WriteLine(SUPERCLASSE.Attributo);
SUPERCLASSE.Metodo();
Console.ReadLine();

SottoClasse SOTTOCLASSE = new SottoClasse { SottoAttributo = 2, Attributo = 1};
// SOTTOCLASSE.Attributo = 2;
SOTTOCLASSE.Metodo();

List<SuperClasse> lista = new List<SuperClasse>();
lista.Add(SUPERCLASSE);
lista.Add(SOTTOCLASSE);

Console.WriteLine("Polimorfismo: ");
foreach (SuperClasse s in lista)
{
    s.Metodo();
}

public class SuperClasse
{
    private int attributo;

    public SuperClasse()
    {
    }

    public SuperClasse(int attributo)
    {
        Attributo = attributo;
    }

    public int Attributo { get => attributo; set => attributo = value; }

    //virtual per binding
    public virtual void Metodo()
    {
        Console.WriteLine($"sono il metodo della SuperClasse {Attributo}");
    }
}

public class SottoClasse : SuperClasse
{
    int sottoAttributo;
    public SottoClasse()
    {
    }

    /// <summary>
    /// Sfrutta il costruttore della superclasse per assegnare il parametro alla properties
    /// </summary>
    /// <param name="attributo"></param>
    public SottoClasse(int attributo, int sottoAttributo) : base(attributo)
    {
        SottoAttributo = sottoAttributo;
    }

    public int SottoAttributo { get => sottoAttributo; set => sottoAttributo = value; }


    public override void Metodo()
    {
        Console.WriteLine($"Sono il metodo di SottoClasse {sottoAttributo}");
    }
}