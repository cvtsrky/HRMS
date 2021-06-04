package kodlamaio.hrms.business.concretes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kodlamaio.hrms.business.abstracts.JobAdvertisementService;
import kodlamaio.hrms.core.utilities.dtoConverter.DtoConverterService;
import kodlamaio.hrms.core.utilities.results.DataResult;
import kodlamaio.hrms.core.utilities.results.Result;
import kodlamaio.hrms.core.utilities.results.SuccessDataResult;
import kodlamaio.hrms.core.utilities.results.SuccessResult;
import kodlamaio.hrms.dataAccess.abstracts.JobAdvertisementDao;
import kodlamaio.hrms.entities.concretes.JobAdvertisement;
import kodlamaio.hrms.entities.dtos.JobAdvertisementAddDto;
import kodlamaio.hrms.entities.dtos.JobAdvertisementDto;

@Service
public class JobAdvertisementManager implements JobAdvertisementService{
	
	private JobAdvertisementDao jobAdvertisementDao;
	private DtoConverterService dtoConverterService;
	
	@Autowired
	public JobAdvertisementManager(JobAdvertisementDao jobAdvertisementDao,DtoConverterService dtoConverterService) {
		super();
		this.jobAdvertisementDao = jobAdvertisementDao;
		this.dtoConverterService = dtoConverterService;
	}

	@Override
	public DataResult<List<JobAdvertisementDto>> getByIsActiveTrue() {
		
		return new SuccessDataResult<List<JobAdvertisementDto>>(dtoConverterService.dtoConverter
				(jobAdvertisementDao.getByIsActiveTrue(), JobAdvertisementDto.class)
				,"Listed By Active JobAdvertisement");
	}

	@Override
	public DataResult<List<JobAdvertisementDto>> getByIsActiveTrueOrderByCreateDate() {
		return new SuccessDataResult<List<JobAdvertisementDto>>
		(this.dtoConverterService.dtoConverter(this.jobAdvertisementDao.getByIsActiveTrueOrderByCreateDate(), 
				JobAdvertisementDto.class),"Data Listed");
	}

	@Override
	public DataResult<List<JobAdvertisementDto>> getByIsActiveTrueAndEmployer_CompanyName(String companyName) {
		return new SuccessDataResult<List<JobAdvertisementDto>>
		(this.dtoConverterService.dtoConverter(this.jobAdvertisementDao.getByIsActiveTrueAndEmployer_CompanyName(companyName), 
				JobAdvertisementDto.class),"Listed By CompanyName");
	}

	@Override
	public Result add(JobAdvertisementAddDto jobAdvertisementDto) {
		this.jobAdvertisementDao.save((JobAdvertisement) dtoConverterService.dtoClassConverter(jobAdvertisementDto, JobAdvertisement.class));
		return new SuccessResult("JobAdvertisement Added");
	}


	@Override
	public Result delete(JobAdvertisement jobAdvertisement) {
		this.jobAdvertisementDao.delete(jobAdvertisement);
		return new SuccessResult("JobAdvertisement Deleted");
	}


}
