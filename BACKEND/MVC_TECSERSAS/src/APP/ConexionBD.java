/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package APP;

import com.sun.jdi.connect.spi.Connection;

/**
 *
 * @author yesst
 */
public class ConexionBD {
    Public static Connection getConexionBD(){
        string url ="jdbc:sqlserver://localhost:1433;" + "database = TECSERSAS;" + "user = ;" + "password = ;"
              
    }

  trystatic {
    Connection con = DriverManager.getConnection(url);
    return con;  
    
    
} Catch (SQLException e){
    
}
}
