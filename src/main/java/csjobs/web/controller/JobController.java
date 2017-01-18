package csjobs.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;

import csjobs.model.Degree;
import csjobs.model.Job;
import csjobs.model.User;
import csjobs.model.dao.JobDao;
import csjobs.model.dao.UserDao;
import csjobs.web.editor.UserPropertyEditor;


@Controller
public class JobController {

	@Autowired
	private UserDao userDao;
	
	@Autowired
    private WebApplicationContext context;

	@Autowired
	private JobDao jobDao;
	
	@InitBinder
    public void initBinder( WebDataBinder binder )
    {
        binder.registerCustomEditor( User.class,
            (UserPropertyEditor) context.getBean( "userPropertyEditor" ) );
        
        binder.registerCustomEditor( Date.class,
                new CustomDateEditor( new SimpleDateFormat( "M/d/yyyy" ), true ) );
    }

	@RequestMapping({ "/index.html", "/job/list.html" })
	public String list(ModelMap models) {
		models.put("openJobs", jobDao.getOpenJobs());
		return "job/list";
	}

	@RequestMapping("/job/view.html")
	public String view(@RequestParam Long jobid, ModelMap models) {
		models.put("job", jobDao.getJob(jobid));
		return "job/view";
	}

	@RequestMapping("/job/viewjob.html")
	public String viewjob(@RequestParam Long jobid, ModelMap models) {

		models.put("job", jobDao.getJob(jobid));
		return "job/viewjob";

	}
	
	
	@RequestMapping(value = "/addjob.html", method = RequestMethod.GET)
	public String addjob(ModelMap models, HttpSession session) {
		models.put("newjobs", new Job());
		models.put("reviewers", userDao.getUser());
		return "addjob";
	}

	@RequestMapping(value = "/addjob.html", method = RequestMethod.POST)
	public String addjobs(@ModelAttribute Job job, @RequestParam Long chair,
			@RequestParam Long[] Mem, ModelMap models, HttpSession session) {
		// List<Job> job1 = new ArrayList<Job>();
		List<User> newmembers = new ArrayList<User>();
		for (int i = 0; i < Mem.length; i++) {
			newmembers.add(userDao.getUser(Mem[i]));
		}

		// adding chair to committee
		if (!newmembers.contains(userDao.getUser(chair))) {
			newmembers.add(userDao.getUser(chair));
		}
		job.setCommitteeChair(userDao.getUser(chair));
		job.setCommitteeMembers(newmembers);
		jobDao.saveJob(job);

		return "redirect:admin.html";
	}

	@RequestMapping(value = "/editjob.html", method = RequestMethod.GET)
	public String editjob(ModelMap models, HttpSession session,
			@RequestParam Long jobid) {
		models.put("newjobsedit", jobDao.getJob(jobid));
		models.put("reviewers", userDao.getUser());
		return "edit";
	}

	@RequestMapping(value = "/editjob.html", method = RequestMethod.POST)
	public String editjobs(@ModelAttribute Job jobid, @RequestParam Long committeeChair,
			@RequestParam Long[] committeeMembers, ModelMap models,
			 HttpSession session) {
		List<User> newmembers = new ArrayList<User>();
		for (int i = 0; i < committeeMembers.length; i++) {
			newmembers.add(userDao.getUser(committeeMembers[i]));
		}

		// adding chair to committee
		if (!newmembers.contains(userDao.getUser(committeeChair))) {
			newmembers.add(userDao.getUser(committeeChair));
		}
		jobid.setCommitteeMembers(newmembers);
		jobDao.saveJob(jobid);

		return "redirect:admin.html";
	}

}
