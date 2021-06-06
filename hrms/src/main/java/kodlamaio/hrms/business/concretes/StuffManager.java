package kodlamaio.hrms.business.concretes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kodlamaio.hrms.business.abstracts.StuffService;
import kodlamaio.hrms.core.utilities.results.DataResult;
import kodlamaio.hrms.core.utilities.results.Result;
import kodlamaio.hrms.core.utilities.results.SuccessDataResult;
import kodlamaio.hrms.core.utilities.results.SuccessResult;
import kodlamaio.hrms.dataAccess.abstracts.StuffDao;
import kodlamaio.hrms.entities.concretes.Stuff;

@Service
public class StuffManager implements StuffService {

	private StuffDao stuffdao;

	@Autowired
	public StuffManager(StuffDao stuffdao) {
		super();
		this.stuffdao = stuffdao;
	}

	@Override
	public DataResult<List<Stuff>> getAll() {

		return new SuccessDataResult<List<Stuff>>(this.stuffdao.findAll(), "Datalar listelendi");
	}

	@Override
	public Result add(Stuff stuff) {
		this.stuffdao.save(stuff);
		return new SuccessResult("Eklendi");
	}

}
