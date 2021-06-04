package kodlamaio.hrms.api.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kodlamaio.hrms.business.abstracts.JobAdvertisementService;
import kodlamaio.hrms.core.utilities.results.DataResult;
import kodlamaio.hrms.core.utilities.results.Result;
import kodlamaio.hrms.entities.dtos.JobAdvertisementAddDto;
import kodlamaio.hrms.entities.dtos.JobAdvertisementDto;

@RestController
@RequestMapping("api/jobAdvertisements")
public class JobAdvertisementController {
	private JobAdvertisementService jobAdvertisementService;

	public JobAdvertisementController(JobAdvertisementService jobAdvertisementService) {
		super();
		this.jobAdvertisementService = jobAdvertisementService;
	}
	
	@PostMapping("/add")
	public Result add(@Valid @RequestBody JobAdvertisementAddDto jobAdvertisementAddDto) {
		return this.jobAdvertisementService.add(jobAdvertisementAddDto);
	}
	
	
	@GetMapping("/getByIsActiveTrue")
	public DataResult<List<JobAdvertisementDto>> getByIsActiveTrue()
	{
		return this.jobAdvertisementService.getByIsActiveTrue();
	}
	
	@GetMapping("/getByIsActiveTrueOrderByCreateDate")
	public DataResult<List<JobAdvertisementDto>> getByIsActiveTrueOrderByCreateDate()
	{
		return this.jobAdvertisementService.getByIsActiveTrueOrderByCreateDate();
	}
	
	@GetMapping("/getByIsActiveTrueAndEmployer_CompanyName")
	public DataResult<List<JobAdvertisementDto>> getByIsActiveTrueAndEmployer_CompanyName(@RequestParam String companyName)
	{
		return this.jobAdvertisementService.getByIsActiveTrueAndEmployer_CompanyName(companyName);
	}
}
