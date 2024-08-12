package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.ClienteDAO;
import DAO.ClienteDAOImpl;
import jakarta.servlet.RequestDispatcher;
import modelo.Cliente;
import java.util.List;

public class ClienteServlet extends HttpServlet {

    private ClienteDAO clienteDAO;

    public void init() {
        clienteDAO = new ClienteDAOImpl();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ClienteServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClienteServlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        if (action == null) {
            action = "index";
        }

        switch (action) {
            case "listar":
                listarClientes(request, response);
                break;
            case "mostrarFormularioRegistro":
                mostrarFormularioRegistro(request, response);
                break;
            case "actualizar":
                mostrarFormularioEditar(request, response);
                break;
            case "eliminar":
                eliminarCliente(request, response);
                break;
            case "ver":
                verCliente(request, response);
                break;
            default:
                mostrarIndex(request, response);
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
//        processRequest(request, response);
        String action = request.getParameter("action");

        if ("actualizar".equals(action)) {
            actualizarCliente(request, response);
        } else if ("registrar".equals(action)) {
            registrarCliente(request, response);
        }
    }

    private void listarClientes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cliente> clientes = clienteDAO.listarClientes();
        request.setAttribute("clientes", clientes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("vistas/GestiondeClientes.jsp");
        dispatcher.forward(request, response);
    }

    private void mostrarFormularioRegistro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("vistas/crearCliente.jsp");
        dispatcher.forward(request, response);
    }

    private void verCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cliente cliente = clienteDAO.obtenerPorId(id);
        request.setAttribute("cliente", cliente);
        RequestDispatcher dispatcher = request.getRequestDispatcher("verCliente.jsp");
        dispatcher.forward(request, response);
    }

    private void registrarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String razonSocial = request.getParameter("razonSocial");
        String razonComercial = request.getParameter("razonComercial");
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String idTributario = request.getParameter("idTributario");
        String correo = request.getParameter("correo");
        String idUsuario = request.getParameter("idUsuario");

        Cliente nuevoCliente = new Cliente(0, razonSocial, razonComercial, nombres, apellidos, idTributario, correo, idUsuario);
        clienteDAO.registrarCliente(nuevoCliente);

        response.sendRedirect("cliente?action=listar");
    }

    private void mostrarIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    private void eliminarCliente(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        clienteDAO.eliminar(id);
        response.sendRedirect("cliente?action=listar");
    }

    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Cliente cliente = clienteDAO.obtenerPorId(id);
        request.setAttribute("cliente", cliente);
        request.getRequestDispatcher("vistas/editarCliente.jsp").forward(request, response);
    }

    private void actualizarCliente(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String razonSocial = request.getParameter("razonSocial");
        String razonComercial = request.getParameter("razonComercial");
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String idTributario = request.getParameter("idTributario");
        String correo = request.getParameter("correo");
        String idUsuario = request.getParameter("idUsuario");

        Cliente cliente = new Cliente(id, razonSocial, razonComercial, nombres, apellidos, idTributario, correo, idUsuario);
        clienteDAO.actualizar(cliente);
        response.sendRedirect("cliente?action=listar");
    }

}
