import java.awt.EventQueue;
import java.sql.*;

 

 

import javax.swing.JFrame;
import javax.swing.JLabel;
import java.awt.BorderLayout;
import java.awt.Font;
import javax.swing.JPanel;
import javax.swing.border.TitledBorder;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JTable;
import javax.swing.JScrollPane;
import javax.swing.border.EtchedBorder;
import java.awt.Color;
import java.sql.*;
public class Computergame {
private static final String url = "jdbc:mysql://localhost:3306/progetto?useTimezone=true&serverTimezone=UTC";
private static Connection connection = null;
private static Statement statement=null;

 

 

public static void connessione(String u, String p) {
try {
connection=DriverManager.getConnection(url,u,p);
System.out.println("CONNESSIONE AVVENUTA CON SUCCESSO");
} catch (SQLException e) {
e.printStackTrace();
}
}

 

 

public static String select(String condizione) {
String sqlQuery=null;
String result="";
if(condizione.compareTo("TOT")==0)
sqlQuery="SELECT * FROM Gioco";
else
sqlQuery="SELECT * FROM Gioco WHERE "+condizione;
try {
statement=connection.createStatement();
ResultSet risultato=statement.executeQuery(sqlQuery);
while(risultato.next()) {
String codiceprodotto=risultato.getString("CodiceProdotto");
String titolo=risultato.getString("Titolo");
String annopubblicazione=risultato.getString("AnnoPubblicazione");
String pegi=risultato.getString("PEGI");
String condizioni=risultato.getString("Condizioni");
result+="------------------------------------------------------------------------------------------\n";

 

 

result+="CodiceProdotto="+codiceprodotto+"\n"+"Titolo="+titolo+"\n"+"Annopubblicazione="+annopubblicazione+"\n"+"Pegi="+pegi+"\n"+"Condizioni="+condizioni+"\n";

 

 

}
risultato.close();
}catch(SQLException e) {
e.printStackTrace();
}
return result;
}
public static void insert(String codiceprodotto,String titolo,String annopubblicazione,String pegi,String condizioni) {
String sqlQuery="INSERT INTO Gioco VALUES ("+"\'"+codiceprodotto+"\'"+","+"\'"+titolo+"\'"+","+"\'"+annopubblicazione+"\'"+","+"\'"+pegi+"\'"+","+"\'"+condizioni+"\'"+")";
try {
statement=connection.createStatement();
statement.executeUpdate(sqlQuery);
System.out.println("Inserimento riuscito.");
}catch(SQLException e) {
e.printStackTrace();
}
}
public static void update(String codiceprodotto, String colonna, String valore) {
int val=0;
String sqlQuery=null;
boolean flag=false;
try {
val=Integer.parseInt(valore);
flag=true;
}catch(NumberFormatException e){
}
if(flag)
sqlQuery="UPDATE Gioco SET "+colonna+"="+val+" WHERE CodiceProdotto="+"\'"+codiceprodotto+"\'";
else
sqlQuery="UPDATE Gioco SET "+colonna+"="+"\'"+valore+"\'"+" WHERE CodiceProdotto="+"\'"+codiceprodotto+"\'";
try {
statement=connection.createStatement();
statement.executeUpdate(sqlQuery);
System.out.println("Aggiornamento riuscito.");
}catch(SQLException e) {
e.printStackTrace();
}
}
public static void delete(String codiceprodotto) {
String sqlQuery="DELETE FROM Gioco WHERE CodiceProdotto="+"\'"+codiceprodotto+"\'";
try {
statement=connection.createStatement();
statement.executeUpdate(sqlQuery);
System.out.println("Operazione riuscita.");
}catch(SQLException e) {
e.printStackTrace();
}
}
}