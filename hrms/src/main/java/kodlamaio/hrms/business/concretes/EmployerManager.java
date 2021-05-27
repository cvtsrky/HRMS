package kodlamaio.hrms.business.concretes;

import java.util.List;

import org.springframework.stereotype.Service;

import kodlamaio.hrms.business.abstracts.EmployerService;
import kodlamaio.hrms.core.utilities.results.DataResult;
import kodlamaio.hrms.core.utilities.results.ErrorResult;
import kodlamaio.hrms.core.utilities.results.Result;
import kodlamaio.hrms.core.utilities.results.SuccessDataResult;
import kodlamaio.hrms.core.utilities.results.SuccessResult;
import kodlamaio.hrms.dataAccess.abstracts.EmployerDao;
import kodlamaio.hrms.entities.concretes.Employer;

@Service
public class EmployerManager implements EmployerService{
	
	private EmployerDao employerDao;

	public EmployerManager(EmployerDao employerDao) {
		super();
		this.employerDao = employerDao;
	}

	@Override
	public DataResult<List<Employer>> getAll() {
		
		return new SuccessDataResult<List<Employer>>(this.employerDao.findAll(),"Datalar listelendi");
	}

	@Override
	public Result add(Employer employer) {
		if(!checkIfEmailExists(employer.getEmail())) {
			return new ErrorResult("Email already exist");
		}
		if(!checkIfEqualEmailAndDomain(employer.getEmail(), employer.getWebAddress()))
		{
			return new ErrorResult("Invalid mail adress");
		}
		if(!validationForEmployer(employer)) {
			return new ErrorResult("Missing information");
		}
		
		this.employerDao.save(employer);
		return new SuccessResult("Employer added");
	}

	@Override
	public DataResult<Employer> getByEmail(String email) {
		
		return new SuccessDataResult<Employer>(this.employerDao.findByEmail(email));
	}
	
	private boolean checkIfEmailExists(String email) {
		if(this.employerDao.findByEmail(email) !=null) {
			return false;
		}
		return true;
		
	}
	
	private boolean validationForEmployer(Employer employer) {
		
		if(employer.getCompanyName() == null && employer.getWebAddress()== null && employer.getEmail()== null
				&& employer.getPhoneNumber() == null && employer.getPassword() == null) {
			return false;
					
		}
		return true;
	}
	
	private boolean checkIfEqualEmailAndDomain(String email, String website) {
		String[] emailArr = email.split("@", 2);
		String domain = website.substring(4, website.length());

		if (emailArr[1].equals(domain)) {

			return true;
		}

		return false;
	}
}
