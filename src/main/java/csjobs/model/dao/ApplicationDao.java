package csjobs.model.dao;

import java.util.List;

import csjobs.model.Application;
import csjobs.model.File;
import csjobs.model.Job;
import csjobs.model.User;

public interface ApplicationDao {

	Application getApplication(Long id);

	Application getApplication(Job job, User applicant);

	Application saveApplication(Application application);

	File saveFile(File file);

	File getFiles(Long id);

	List<Application> getApplications(Long jobid);
}
