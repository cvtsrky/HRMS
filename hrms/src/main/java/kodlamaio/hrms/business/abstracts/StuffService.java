package kodlamaio.hrms.business.abstracts;

import java.util.List;

import kodlamaio.hrms.core.utilities.results.DataResult;
import kodlamaio.hrms.core.utilities.results.Result;
import kodlamaio.hrms.entities.concretes.Stuff;

public interface StuffService {
	DataResult<List<Stuff>> getAll();

	Result add(Stuff stuff);
}
