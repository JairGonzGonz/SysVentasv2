package Controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import DAO.ProductoDAO;
import DAO.ProductoDAOImpl;
import modelo.Producto;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductoServlet extends HttpServlet {

    private ProductoDAO productoDAO;

    public void init() {
        productoDAO = new ProductoDAOImpl();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductoServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductoServlet at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        String action = request.getParameter("action");
        if (action == null) {
            action = "index";
        }

        switch (action) {
            case "listar":
                listarProductos(request, response);
                break;
            case "mostrarFormularioRegistro":
                mostrarFormularioRegistro(request, response);
                break;
            case "actualizar":
                mostrarFormularioEditar(request, response);
                break;
            case "ver":
                verProducto(request, response);
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
        //processRequest(request, response);
        String action = request.getParameter("action");
        if ("actualizar".equals(action)) {
            try {
                actualizarProducto(request, response);
            } catch (ParseException ex) {
                Logger.getLogger(ProductoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if ("registrar".equals(action)) {
            registrarProducto(request, response);
        }
    }

    private void listarProductos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Producto> productos = productoDAO.listarProductos();
        request.setAttribute("productos", productos);
        RequestDispatcher dispatcher = request.getRequestDispatcher("vistas/GestionProductos.jsp");
        dispatcher.forward(request, response);
    }

    private void mostrarFormularioRegistro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("vistas/crearProducto.jsp");
        dispatcher.forward(request, response);
    }

    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Producto producto = productoDAO.obtenerPorId(id);
        request.setAttribute("producto", producto);
        RequestDispatcher dispatcher = request.getRequestDispatcher("vistas/editarProducto.jsp");
        dispatcher.forward(request, response);
    }

    private void verProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Producto producto = productoDAO.obtenerPorId(id);
        request.setAttribute("producto", producto);
        RequestDispatcher dispatcher = request.getRequestDispatcher("vistas/verProducto.jsp");
        dispatcher.forward(request, response);
    }

    private void registrarProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String descripcion = request.getParameter("Descripcion");
            String resumida = request.getParameter("Resumida");
            int idUnidadMedida = Integer.parseInt(request.getParameter("IDunidadMedida"));
            String UnidadMedida = request.getParameter("UnidadMedida");
            int idClasificacion = Integer.parseInt(request.getParameter("IDClasificacion"));
            String clasificacion = request.getParameter("clasificacion");
            float porcentajeImpuesto1 = Float.parseFloat(request.getParameter("porcentajeImpuesto1"));
            float porcentajeImpuesto2 = Float.parseFloat(request.getParameter("porcentajeImpuesto2"));
            float precioCosto = Float.parseFloat(request.getParameter("precioCosto"));
            float precioVenta = Float.parseFloat(request.getParameter("precioVenta"));
            float stockMinimo = Float.parseFloat(request.getParameter("stockMinimo"));
            float stock = Float.parseFloat(request.getParameter("stock"));
            String observacion = request.getParameter("Observacion");

            // Conversión de cadena a Timestamp
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String fechaRegistroStr = request.getParameter("fechaRegistro");
            Date fechaRegistroDate = dateFormat.parse(fechaRegistroStr);
            Timestamp fechaRegistro = new Timestamp(fechaRegistroDate.getTime());

            String idUsuario = request.getParameter("IdUsuario");
            boolean activo = Boolean.parseBoolean(request.getParameter("Activo"));

            Producto nuevoProducto = new Producto(
                    0, descripcion, resumida, idUnidadMedida, idClasificacion, porcentajeImpuesto1, porcentajeImpuesto2, precioCosto,
                    precioVenta, stockMinimo, stock, observacion, fechaRegistro, idUsuario, activo, UnidadMedida, clasificacion
            );
            productoDAO.registrarProducto(nuevoProducto);
            response.sendRedirect("producto?action=listar");
        } catch (NumberFormatException | ParseException e) {
            e.printStackTrace();
        }
    }

    private void actualizarProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        // Similar a registrarProducto pero con lógica de actualización
        try {
            int idProducto = Integer.parseInt(request.getParameter("idProducto"));
            String descripcion = request.getParameter("Descripcion");
            String resumida = request.getParameter("Resumida");
            int idUnidadMedida = Integer.parseInt(request.getParameter("IDunidadMedida"));
            int idClasificacion = Integer.parseInt(request.getParameter("IDClasificacion"));
            float porcentajeImpuesto1 = Float.parseFloat(request.getParameter("porcentajeImpuesto1"));
            float porcentajeImpuesto2 = Float.parseFloat(request.getParameter("porcentajeImpuesto2"));
            float precioCosto = Float.parseFloat(request.getParameter("precioCosto"));
            float precioVenta = Float.parseFloat(request.getParameter("precioVenta"));
            float stockMinimo = Float.parseFloat(request.getParameter("stockMinimo"));
            float stock = Float.parseFloat(request.getParameter("stock"));
            String observacion = request.getParameter("Observacion");

            // Conversión de cadena a Timestamp
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String fechaRegistroStr = request.getParameter("fechaRegistro");
            Date fechaRegistroDate = dateFormat.parse(fechaRegistroStr);
            Timestamp fechaRegistro = new Timestamp(fechaRegistroDate.getTime());
            String idUsuario = request.getParameter("IDUsuario");
            boolean activo = Boolean.parseBoolean(request.getParameter("Activo"));
            String UnidadMedida = request.getParameter("UnidadMedida");
            String clasificacion = request.getParameter("clasificacion");

            Producto producto = new Producto(idProducto, descripcion, resumida, idUnidadMedida, idClasificacion, porcentajeImpuesto1, porcentajeImpuesto2, precioCosto,
                    precioVenta, stockMinimo, stock, observacion, fechaRegistro, idUsuario, activo, UnidadMedida, clasificacion
            );
            productoDAO.actualizar(producto);
            response.sendRedirect("producto?action=listar");
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    private void mostrarIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("vistas/index.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
