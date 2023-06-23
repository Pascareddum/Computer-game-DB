import java.util.Scanner;

 

public class Computergame_2 {

 

    public static void main(String[] args) {
        Computergame.connessione ("root", "Testadura10!");
        String  risultato;
        System.out.println("Quale operazione vuoi eseguire? \n 1 SELECT\n 2 INSERT\n 3 UPDATE\n 4 DELETE");
        Scanner in = new Scanner(System.in);
        int risposta = in.nextInt();
        while (risposta != 5) {
        
            
        
        switch (risposta) {
    
        case 1: risultato = Computergame.select ("TOT");
        System.out.println(risultato);
        break;
        
        case 2: Computergame.insert("4589","Fallout 4","2015","18","Usato");
        risultato = Computergame.select ("TOT");
        System.out.println(risultato);
        break;

 

        case 3: Computergame.update ("4589","Titolo","Far Cry 4");
        risultato = Computergame.select ("TOT");
        System.out.println(risultato);
        break;

 

        case 4: Computergame.delete ("4589");
        risultato = Computergame.select ("TOT");
        System.out.println(risultato);
        break;
        
        }
        risposta = in.nextInt();
    }

 

    }
}