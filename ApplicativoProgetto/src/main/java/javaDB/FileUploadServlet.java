package javaDB;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
/* The Java file upload Servlet example */

import java.io.IOException;
import java.io.File;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Part;

@WebServlet(name = "FileUploadServlet", urlPatterns = { "/fileuploadservlet" })
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class FileUploadServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Ottieni il nome del file caricato
        Part filePart = request.getPart("file");
        String fileName = getFileName(filePart);

        // Ottieni il percorso del file di destinazione
        String filePath = request.getParameter("filePath");

        // Ottieni il nome del file host
        String fileNamehost = request.getParameter("filehost");

        // Ottieni il nome del file evento
        String fileNameev = request.getParameter("fileev");

        // Componi il percorso del file di destinazione
        String destinationPath = filePath;
        if (!fileNamehost.equals("null")) {
            destinationPath += ("profilepic/");
            fileName = fileNamehost + ".png";
        } else {
            destinationPath += ("eventspic/" + fileNameev + "/");
            fileName = "1.png";

            File directory = new File(destinationPath);
            if (!directory.exists()) {
                directory.mkdirs(); // Crea tutte le directory nel percorso specificato
            }

        }

        // Scrivi il file nella directory di destinazione
        filePart.write(destinationPath + fileName);

        // Invia una risposta al client
        response.getWriter().print("Il file stato caricato correttamente.");
    }

    // Metodo ausiliario per ottenere il nome del file da un Part
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] elements = contentDisposition.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

}
