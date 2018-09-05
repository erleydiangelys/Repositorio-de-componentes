package upload;


import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class ServletUpload
 */

@WebServlet("/UploadServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 4,   // 4MB
        maxRequestSize = 1024 * 1024 * 4 // 4MB
        )
public class ServletUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    File dir = new File( "C:\\Users\\Fernando Willian\\Desktop\\" );// diretório de upload
        
	    //se o diretório não existe ele cria
	    if( !dir.isDirectory() ){
	    	//lembre-se de usar o mkdirs, com s, para poder dar certo salvar em qualquer lugar
	        dir.mkdirs();
	    }
	         
	    for(Part part: request.getParts()){
	    	//Esse é um feedback de como funciona os metodos do Part
	        response.getWriter().println("=========================================================");
	        response.getWriter().println("Name do campo file: "+part.getName() );
	        response.getWriter().println("Tamanho: "+part.getSize()+" bytes" );
	        response.getWriter().println("Content type: "+part.getContentType()  );
	        // o metodo getFileName retorna o nome e a extensão do arquivo
	        response.getWriter().println( "Nome do arquivo: " + this.getFileName(part) );       
	             
	             
	        for(String headerName : part.getHeaderNames()){
	            response.getWriter().println("---------------------------------------------"  );
	            response.getWriter().println("Header name: "+ headerName );
	            response.getWriter().println( part.getHeader( headerName ) );
	            response.getWriter().println("---------------------------------------------"  );
	        }
	 
	         
	        //Aqui voce especifica o caminho absoluto ex: "C://n2s//Sara//" + "dogge.jpg"
	        File arquivo = new File( dir.getAbsolutePath() + "/" + getFileName(part) );
	        //grava o arquivo no disco
	        part.write( arquivo.getAbsolutePath() );
	        response.getWriter().println("=========================================================");
	    }
	}

	public String getFileName(Part part) {
	    String header = part.getHeader( "content-disposition" );
	    for( String tmp : header.split(";") ){
	        if( tmp.trim().startsWith("filename") ){
	            return tmp.substring( tmp.indexOf("=")+2 , tmp.length()-1 );
	        }
	    }
	    return null;
	}

}
