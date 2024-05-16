package javaDB;

import java.io.IOException;
import java.util.Collection;
import java.io.File;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig // Enable multipart form data processing

public class FileInputServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get all uploaded parts
        Collection<Part> parts = request.getParts();

        // Process each uploaded file
        for (Part part : parts) {
            if (part.getName().equals("media") && part.getSize() > 0) { // Check for "media" field and non-empty files

                String fileName = part.getSubmittedFileName(); // Get original filename
                String fullPath = getServletContext().getRealPath("/") + File.separator + fileName; // Construct full path

                // Optional: Save the uploaded file (replace with your logic)
                part.write(fullPath);

                // Access the full path for further processing
                System.out.println("Full path of uploaded file: " + fullPath);
            }
        }

        // Forward to a JSP or perform other actions based on processing results
        RequestDispatcher dispatcher = request.getRequestDispatcher("your_jsp.jsp");
        dispatcher.forward(request, response);
    }
}
