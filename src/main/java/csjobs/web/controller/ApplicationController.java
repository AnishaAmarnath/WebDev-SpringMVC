package csjobs.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import csjobs.model.dao.ApplicationDao;

@Controller
public class ApplicationController {

    @Autowired
    private ApplicationDao applicationDao;
    
    @Autowired
	private ServletContext context;
    
    private File getFileDirectory() {
		String path = context.getRealPath("/WEB-INF/files");
		return new File(path);

	}

    @RequestMapping("/application/view.html")
    public String view( @RequestParam Long jobid, ModelMap models )
    {
        models.put( "application", applicationDao.getApplication( jobid ) );
        return "application/view";
    }
        
    @RequestMapping("/viewApplicants.html")
    public String viewApplicants( @RequestParam Long jobid, ModelMap models )
    {
        models.put( "applicationView", applicationDao.getApplications( jobid ));
        return "viewApplicants";
    }
    
    @RequestMapping("/download.html")
    public String downloadfile(@RequestParam Long fileid,HttpServletResponse response) throws IOException
    {
    	
    	csjobs.model.File name=applicationDao.getFiles(fileid);
    	response.setContentType( name.getType());
        response.setHeader( "Content-Disposition",
            "attachment; filename="+ name.getName());
    	FileInputStream in = new FileInputStream(getFileDirectory()+"/"+name.getName());
    	OutputStream out = response.getOutputStream();
    	byte buffer[] = new byte[2048];
        int bytesRead;
        while( (bytesRead = in.read( buffer )) > 0 )
            out.write( buffer, 0, bytesRead );

        in.close();
    	return null;
    }


}
