package javaDB;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
/* The Java file upload Servlet example */

import java.io.IOException;
import java.io.File;

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
        if(fileName != null){
            if(!fileName.isEmpty()){
                // Ottieni il percorso del file di destinazione
                String filePath = request.getParameter("filePath");

                // Ottieni il nome del file host
                String fileNamehost = request.getParameter("filehost");

                // Ottieni il nome del file evento
                String fileNameev = request.getParameter("fileev");

                // Componi il percorso del file di destinazione
                String destinationPath = filePath;
                if (!fileNameev.equals("null")) {
                    destinationPath += ("eventspic/" + fileNameev + "/");
                    fileName = "1.png";
                    File directory = new File(destinationPath);
                    if (!directory.exists()) {
                        directory.mkdirs(); // Crea tutte le directory nel percorso specificato
                    }

                } else {
                    destinationPath += ("profilepic/");
                    fileName = fileNamehost + ".png";


                }

                // Scrivi il file nella directory di destinazione
                filePart.write(destinationPath + fileName);

                // Invia una risposta al client
                response.sendRedirect("addimage.jsp?messaggio=Immagine Caricata Correttamente!");
            }else{
                response.sendRedirect("addimage.jsp?messaggio=Seleziona Un Immagine!");
            }
        }else{
            response.sendRedirect("addimage.jsp?messaggio=Seleziona Un Immagine!");
        }
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
