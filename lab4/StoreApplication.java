import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the video and bookstore database
 * interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * that an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 */
public class StoreApplication {

	/**
	 * Return a list of phone numbers of customers, given a first name and
	 * last name.
	 */
	public List<String> getCustomerPhoneFromFirstLastName(Connection connection,
			String firstName, String lastName) {
           List<String> result = new ArrayList<String>();
           String selectSQL = "SELECT DISTINCT a.phone FROM dv_customer c, dv_address a WHERE c.address_id = a.address_id AND c.first_name = ? AND c.last_name = ?";
         try{
           PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
           preparedStatement.setString(1, firstName);
           preparedStatement.setString(2, lastName);
           ResultSet rs = preparedStatement.executeQuery();
           while (rs.next()) {
		      result.add(rs.getString("phone"));
           }
           return result;
         }catch(Exception e){
	     System.out.println("error phones" + e);
         }
	        System.out.println(result);
		return result;
	}

	/**
	 * Return list of film titles whose length is is equal to or greater
	 * than the minimum length, and less than or equal to the maximum
	 * length.
	 */
	public List<String> getFilmTitlesBasedOnLengthRange(Connection connection,
			int minLength, int maxLength) {
		List<String> result = new LinkedList<String>();
                String selectSQL = "SELECT DISTINCT f.title FROM dv_film f WHERE f.length >= ? AND f.length <=?";
         try{
           PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
           preparedStatement.setInt(1, minLength);
           preparedStatement.setInt(2, maxLength);
           ResultSet rs = preparedStatement.executeQuery();
           while (rs.next()) {
		result.add(rs.getString("title"));	
           }
           return result;
         }catch(Exception e){
	     System.out.println("error phones" + e);
         }
		return result;
	}

	/**
	 * Return the number of customers that live in a given district and
	 * have the given active status.
	 */
	public final int countCustomersInDistrict(Connection connection,
			String districtName, boolean active) {
	   int result = -1;
 //          String selectSQL = "select count(*) from dv_address a, dv_customer c where a.address_id = c.address_id AND a.district = ? AND c.active = ? group by a.district, c.customer_id order by count(c.customer_id)asc";
           String selectSQL = "select Count(*) from (select count(c.customer_id) from dv_address a, dv_customer c where a.address_id = c.address_id AND a.district = ? AND c.active = ?  group by a.district, c.customer_id order by count(c.customer_id)asc) As z";
           try{
             PreparedStatement preparedStatement = connection.prepareStatement(selectSQL);
             preparedStatement.setString(1, districtName);
             preparedStatement.setBoolean(2, active);
             ResultSet rs = preparedStatement.executeQuery();
             while (rs.next()) {
		Long tmp  = (Long)rs.getObject("count");
		result = tmp.intValue();	
             }
          //   return result;
         }catch(Exception e){
	     System.out.println("error count:: " + e);
         }

		return result;
	}

	/**
	 * Add a film to the inventory, given its title, description,
	 * length, and rating.
	 *
	 * Your query will need to cast the rating parameter to the
	 * enumerared type mpaa_rating. Whereas an uncast parameter is
	 * simply a question mark, casting would look like ?::mpaa_rating 
	 */
	public void insertFilmIntoInventory(Connection connection, String
			title, String description, int length, String rating)
	{
                String insertTableSQL = "INSERT INTO dv_film"
		+ "(title, description, length, rating) VALUES"
		+ "(?,?,?,CAST(? AS mpaa_rating))";
             try{
		PreparedStatement preparedStatement = connection.prepareStatement(insertTableSQL);
		preparedStatement.setString(1,title);
		preparedStatement.setString(2, description);
		preparedStatement.setInt(3, length);
		preparedStatement.setString(4,rating);
		// execute insert SQL stetement
		preparedStatement.executeUpdate();
		System.out.println("Successful entry");
           }catch(Exception e){
                System.out.println("We have an error: "+e);  
		System.exit(-1);
          }
	}

	/**
	 * Constructor
	 */
	public StoreApplication()
	{}

};
