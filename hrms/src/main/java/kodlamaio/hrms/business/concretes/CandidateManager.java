package kodlamaio.hrms.business.concretes;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kodlamaio.hrms.business.abstracts.CandidateService;
import kodlamaio.hrms.core.utilities.adapters.mernis.UserCheckService;
import kodlamaio.hrms.core.utilities.results.DataResult;
import kodlamaio.hrms.core.utilities.results.ErrorResult;
import kodlamaio.hrms.core.utilities.results.Result;
import kodlamaio.hrms.core.utilities.results.SuccessDataResult;
import kodlamaio.hrms.core.utilities.results.SuccessResult;
import kodlamaio.hrms.dataAccess.abstracts.CandidateDao;
import kodlamaio.hrms.entities.concretes.Candidate;

@Service
public class CandidateManager implements CandidateService {
	private CandidateDao candidateDao;
	private UserCheckService userCheckService;

	@Autowired
	public CandidateManager(CandidateDao candidateDao, UserCheckService userCheckService) {
		super();
		this.candidateDao = candidateDao;
		this.userCheckService = userCheckService;
	}

	@Override
	public DataResult<List<Candidate>> getAll() {

		return new SuccessDataResult<List<Candidate>>(this.candidateDao.findAll(), "Data listelendi");
	}

	@Override
	public Result add(Candidate candidate) {
		if(!validationForCandidate(candidate)) {
			return new ErrorResult("Missing or wrong information");
		}
		if(!checkIfRealPerson(candidate))
		{
			return new ErrorResult("Invalid person");
		}
		if(!checkIfEmailExist(candidate.getEmail())) {
			return new ErrorResult("Email already exist");
		}
		if(!checkIfNationalityId(candidate.getNationalId()))
		{
			return new ErrorResult("NationalId already exist");
		}
		this.candidateDao.save(candidate);
		return new SuccessResult("Candidate added");
	}

	@Override
	public DataResult<Candidate> getByNationalId(String nationalId) {
		
		return new SuccessDataResult<Candidate>(this.candidateDao.findByNationalId(nationalId));
	}

	@Override
	public DataResult<Candidate> getByEmail(String email) {
		
		return new SuccessDataResult<Candidate>(this.candidateDao.findByEmail(email));
	}
	
	private boolean checkIfEmailExist(String email) {
		if(this.candidateDao.findByEmail(email) != null) {
			return false;
		}
		else {
			return true;
		}
	}
	
	private boolean checkIfRealPerson(Candidate candidate) {
		if(!this.userCheckService.checkIfRealPerson(Long.parseLong(candidate.getNationalId()), 
				candidate.getFirstName().toUpperCase(new Locale("tr")),candidate.getLastName().toUpperCase(new Locale("tr")),
				candidate.getBirthYear() )) {
			return false;
		}
		else {
			return true;
		}
	}
	
	private boolean checkIfNationalityId(String nationalId) {
		if(this.candidateDao.findByNationalId(nationalId)!=null) {
			return false;
		}
		return true;
	}
	
	private boolean validationForCandidate(Candidate candidate) {
		if(candidate.getFirstName()==null && candidate.getLastName()==null&& 
				candidate.getNationalId()==null&&candidate.getEmail()==null&&candidate.getBirthYear()==null) {
			return false;
		}
		else {
			return true;
		}
	}
}
