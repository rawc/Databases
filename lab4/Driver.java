import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A sample class that connects to PostgreSQL and runs a simple query.
 *
 * Note: Your database name is your login name, so for login jsmith,
 * you would have
 *    getConnection("jdbc:postgresql://cmps180-db.lt.ucsc.edu/jsmith", 
 *    "jsmith" , "password");
 */
public class Driver
{
    public static void main(String[] args) throws
        ClassNotFoundException, FileNotFoundException, IOException,
        SQLException {
       Connection connection;

   	Class.forName("org.postgresql.Driver");  //Registering the driver
    connection = DriverManager.getConnection(
            "jdbc:postgresql://cmps180-db.lt.ucsc.edu/lchatta",
            "lchatta", "again88wave");  //Making the Connection 
    System.out.println("Suss");
    StoreApplication app = new StoreApplication();


    List<String> phoneNumbers =
        app.getCustomerPhoneFromFirstLastName(connection, "Kathleen",
                "Adams");   
    System.out.println("our phone numbers are: " +phoneNumbers);    

    List<String> filmTitles =
        app.getFilmTitlesBasedOnLengthRange(connection, 45, 47);

    System.out.println("our range titles are " + filmTitles); 
    int count = app.countCustomersInDistrict(connection, "California",
           true);
    System.out.println("The count is : " +count); 
    app.insertFilmIntoInventory(connection, "Sequel to the Prequel",
            "Memorable", 98, "PG-13");

    connection.close(); //Closing Connection
    }
}
