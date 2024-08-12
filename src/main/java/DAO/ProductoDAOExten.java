package DAO;

import DAO.ProductoDAOImpl;
import modelo.Combo;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ProductoDAOExten extends HttpServlet {
    private ProductoDAOImpl productoDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        productoDAO = new ProductoDAOImpl();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener datos del modelo
        List<Combo> unidadesMedidas = productoDAO.ComboUnidadMedida();
        List<Combo> clasificaciones = productoDAO.ComboClasificacion();

        // Pasar datos a la vista (JSP)
        request.setAttribute("unidadesMedidas", unidadesMedidas);
        request.setAttribute("clasificaciones", clasificaciones);
        RequestDispatcher dispatcher = request.getRequestDispatcher("crearProducto.jsp");
        dispatcher.forward(request, response);
    }    
}
