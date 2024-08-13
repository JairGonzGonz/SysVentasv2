/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.ProveedorDAO;
import DAO.ProveedorDAOImpl;
import modelo.Proveedor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.List;

/**
 *
 * @author GONZCORP
 */
public class ProveedorServlet extends HttpServlet {

    private ProveedorDAO proveedorDAO;

    @Override
    public void init() {
        proveedorDAO = new ProveedorDAOImpl();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProveedorServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProveedorServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String action = request.getPathInfo();
        if (action == null) {
            action = "/list";
        }
        switch (action) {
            case "/new":
                showNewForm(request, response);
                break;
//            case "/insert":
//                insertProveedor(request, response);
//                break;
//            case "/delete":
//                deleteProveedor(request, response);
//                break;
//            case "/edit":
//                showEditForm(request, response);
//                break;
//            case "/update":
//                updateProveedor(request, response);
//                break;
            default:
                listProveedores(request, response);
                break;
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    private void listProveedores(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Proveedor> proveedores = proveedorDAO.obtenerTodos();
        request.setAttribute("proveedores", proveedores);
        request.getRequestDispatcher("vistas/proveedor/list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("vistas/proveedor/form.jsp").forward(request, response);
    }

//    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String rucProveedor = request.getParameter("rucProveedor");
//        Proveedor proveedor = proveedorDAO.actualizar(proveedor);
//        request.setAttribute("proveedor", proveedor);
//        request.getRequestDispatcher("/proveedor/form.jsp").forward(request, response);
//    }

//    private void insertProveedor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Proveedor proveedor = new Proveedor();
//        setProveedorFields(proveedor, request);
//        proveedor.setFechaRegistro(LocalDateTime.now());
//
//        proveedorDAO.insertarProveedor(proveedor);
//        response.sendRedirect(request.getContextPath() + "/proveedor/list");
//    }

//    private void updateProveedor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Proveedor proveedor = new Proveedor();
//        setProveedorFields(proveedor, request);
//
//        proveedorDAO.actualizarProveedor(proveedor);
//        response.sendRedirect(request.getContextPath() + "/proveedor/list");
//    }

//    private void deleteProveedor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String rucProveedor = request.getParameter("rucProveedor");
//        proveedorDAO.eliminarProveedor(rucProveedor);
//        response.sendRedirect(request.getContextPath() + "/proveedor/list");
//    }

    private void setProveedorFields(Proveedor proveedor, HttpServletRequest request) {
        proveedor.setRUCProveedor(request.getParameter("rucProveedor"));
        proveedor.setRazonSocial(request.getParameter("razonSocial"));
        proveedor.setRazonComercial(request.getParameter("razonComercial"));
        proveedor.setCorreo(request.getParameter("correo"));
        proveedor.setTelefono(request.getParameter("telefono"));
        proveedor.setDiasCredito(Double.parseDouble(request.getParameter("diasCredito")));
        proveedor.setContacto1(request.getParameter("contacto1"));
        proveedor.setTelefonoC1(request.getParameter("telefonoC1"));
        proveedor.setContacto2(request.getParameter("contacto2"));
        proveedor.setTelefonoC2(request.getParameter("telefonoC2"));
        proveedor.setIDUsuario(request.getParameter("idUsuario"));
        proveedor.setIDUbigeo(request.getParameter("idUbigeo"));
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
