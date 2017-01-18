package csjobs.web.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.security.SecureRandom;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import csjobs.model.Application;
import csjobs.model.Degree;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.ApplicationDao;
import csjobs.model.dao.JobDao;

@Controller
@SessionAttributes("application")
public class ApplicationControllerS {

	@Autowired
	private JobDao jobDao;

	@Autowired
	private ApplicationDao applicationDao;

	@Autowired
	private ServletContext context;
	
	

	private File getFileDirectory() {
		String path = context.getRealPath("/WEB-INF/files");
		return new File(path);

	}

	@RequestMapping(value = "/application/apply.html", method = RequestMethod.GET)
	public String apply(@RequestParam Long jobId, HttpSession session,
			ModelMap models, Authentication authentication) {
		Job job = jobDao.getJob(jobId);
		User applicant = (User) authentication.getPrincipal();
		Application application = applicationDao.getApplication(job, applicant);

		if (application != null && application.isSubmitted()) {
			models.put("errorCode", "error.application.submitted");
			return "error";
		}

		if (application == null)
			application = new Application(job, applicant);

		models.put("application", application);
		return "application/apply";
	}

	@RequestMapping(value = "/application/apply.html", method = RequestMethod.POST)
	public String apply(@ModelAttribute Application application,
			SessionStatus sessionStatus,
			@RequestParam(required = false) MultipartFile file0,
			@RequestParam(required = false) MultipartFile file1,
			@RequestParam(required = false) MultipartFile file2,
			Authentication authentication)
			throws IllegalStateException, IOException {
		
		Date date = new Date();
		User appl = (User) authentication.getPrincipal();
		
		

		csjobs.model.File file = new csjobs.model.File();
		if (null != file0) {
			file0.transferTo(new File(getFileDirectory(),"cv" + appl.getId()+application.getJob().getId()+file0
					.getOriginalFilename()));
			file.setDate(date);
			file.setOwner(application.getApplicant());
			file.setName("cv" + appl.getId()+application.getJob().getId()+file0.getOriginalFilename());
			file.setSize(file0.getSize());
			file.setType(file0.getContentType());
			csjobs.model.File filecv = applicationDao.saveFile(file);
			application.setCv(filecv);
		}

		if (null != file1) {
			file1.transferTo(new File(getFileDirectory(), "rs" + appl.getId()+application.getJob().getId()+file1
					.getOriginalFilename()));
			file.setDate(date);
			file.setOwner(application.getApplicant());
			file.setName("rs" + appl.getId()+application.getJob().getId()+file1.getOriginalFilename());
			file.setSize(file1.getSize());
			file.setType(file1.getContentType());
			csjobs.model.File filers = applicationDao.saveFile(file);
			application.setResearchStatement(filers);
		}

		if (null != file2) {
			file2.transferTo(new File(getFileDirectory(),"ts" + appl.getId()+application.getJob().getId()+file2
					.getOriginalFilename()));
			file.setDate(date);
			file.setOwner(application.getApplicant());
			file.setName("ts" + appl.getId()+application.getJob().getId()+file2.getOriginalFilename());
			file.setSize(file2.getSize());
			file.setType(file2.getContentType());
			csjobs.model.File filets = applicationDao.saveFile(file);
			application.setTeachingStatement(filets);
		}

		application = applicationDao.saveApplication(application);
		sessionStatus.setComplete();
		return "redirect:addDegree.html?applicationId=" + application.getId();
	}

	@RequestMapping(value = "/application/addDegree.html", method = RequestMethod.GET)
	public String addDegree(@RequestParam Long applicationId, ModelMap models) {
		models.put("application", applicationDao.getApplication(applicationId));
		models.put("degree", new Degree());
		return "application/addDegree";
	}

	@RequestMapping(value = "/application/addDegree.html", method = RequestMethod.POST)
	public String addDegree(@RequestParam String[] name,
			@RequestParam String[] school, @RequestParam int[] year,
			@ModelAttribute Application applications, BindingResult result,
			SessionStatus sessionStatus) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		List<Degree> degrees = new ArrayList<Degree>();
		for (int i = 0; i < name.length; i++) {
			Degree d = new Degree();
			d.setName(name[i]);
			d.setSchool(school[i]);
			d.setYear(year[i]);
			degrees.add(d);
		}
		applications.setDegrees(degrees);
		applications.setSubmitDate(date);
		applications = applicationDao.saveApplication(applications);
		sessionStatus.setComplete();
		return "redirect:../applicant.html?applicationId="
				+ applications.getId();

	}

}
