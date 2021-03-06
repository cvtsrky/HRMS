package kodlamaio.hrms.business.abstracts;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kodlamaio.hrms.core.utilities.results.DataResult;
import kodlamaio.hrms.core.utilities.results.Result;
import kodlamaio.hrms.entities.dtos.ResumeAddDto;
import kodlamaio.hrms.entities.dtos.ResumeGetDto;

public interface ResumeService {

	Result add(ResumeAddDto resumeDto);

	DataResult<List<ResumeGetDto>> getAll();

	DataResult<List<ResumeGetDto>> findAllByCandidateId(int id);

	Result saveImage(MultipartFile file, int resumeId);
}
