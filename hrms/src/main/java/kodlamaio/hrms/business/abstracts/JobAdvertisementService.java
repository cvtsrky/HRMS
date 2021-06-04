package kodlamaio.hrms.business.abstracts;

import java.util.List;

import kodlamaio.hrms.core.utilities.results.DataResult;
import kodlamaio.hrms.core.utilities.results.Result;
import kodlamaio.hrms.entities.concretes.JobAdvertisement;
import kodlamaio.hrms.entities.dtos.JobAdvertisementAddDto;
import kodlamaio.hrms.entities.dtos.JobAdvertisementDto;

public interface JobAdvertisementService {
	
	Result add(JobAdvertisementAddDto jobAdvertisementDto);
	Result delete(JobAdvertisement jobAdvertisement);
	DataResult<List<JobAdvertisementDto>> getByIsActiveTrue();
	DataResult<List<JobAdvertisementDto>> getByIsActiveTrueOrderByCreateDate();
	DataResult<List<JobAdvertisementDto>> getByIsActiveTrueAndEmployer_CompanyName(String companyName);
}
