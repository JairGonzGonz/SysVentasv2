/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package DAO;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author David
 */
public class UsuarioDAOTest {
    
    public UsuarioDAOTest() {
    }

    @Test
    public void testValidarUsuarioTrue() {
        System.out.println("validarUsuario");
        String username = "MASTER";
        String password = "000";
        UsuarioDAO instance = new UsuarioDAO();
        boolean expResult = false;
        boolean result = instance.validarUsuario(username, password);
        assertTrue("La condicion deberia ser True", result);
        //fail("The test case is a prototype.");
    }
    
    @Test
    public void testValidarUsuarioFalse() {
        System.out.println("validarUsuario");
        String username = "JUPITER";
        String password = "35295";
        UsuarioDAO instance = new UsuarioDAO();
        boolean expResult = false;
        boolean result = instance.validarUsuario(username, password);
        assertFalse("La condicion deberia ser False", result);
        //fail("The test case is a prototype.");
    }
}
