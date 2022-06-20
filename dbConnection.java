package seasonTickets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

public class dbConnection {
    
    
    private Connection connections(Connection con){
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con =DriverManager.getConnection("jdbc:mysql://localhost/seasonTicket", "root","nuttertools");

        } 
    catch (ClassNotFoundException ex) {
                Logger.getLogger(logInUi.class.getName()).log(Level.SEVERE, null, ex);
        }
    catch (SQLException ex) {
                Logger.getLogger(logInUi.class.getName()).log(Level.SEVERE, null, ex);
        }
    return con;
    }
    public Connection getConnection(){
        Connection con1 = null;
        con1 = connections(con1);
        return con1;
    }
}
