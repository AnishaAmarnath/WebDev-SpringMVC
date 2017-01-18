/*package csjobs.web.validator;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import csjobs.model.User;
import csjobs.model.dao.JobsDao;

@Component
public class LoginValidator implements Validator {
	@Autowired
	private JobDao jobsdao;
	
	@Override
	public boolean supports(Class<?> classes) {
		return User.class.isAssignableFrom(classes);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User user= (User)	target;
		if((StringUtils.hasText(user.getEmail())) && (StringUtils.hasText(user.getPassword())))
		{
			User users=jobsdao.getApplicants(user.getEmail(), user.getPassword());
			
			if(users==null)
			{
			errors.rejectValue("email", "error.field.nomatch");
			errors.rejectValue("password", "error.field.nomatch");
				
			}
		}
		if(!StringUtils.hasText(user.getPassword()))
			errors.rejectValue("password", "error.field.empty");
		if(!StringUtils.hasText(user.getEmail()))
			errors.rejectValue("email", "error.field.empty");
		
	}

}
*/