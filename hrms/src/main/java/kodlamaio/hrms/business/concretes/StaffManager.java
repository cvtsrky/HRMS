package kodlamaio.hrms.business.concretes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kodlamaio.hrms.business.abstracts.StaffService;
import kodlamaio.hrms.core.utilities.results.DataResult;
import kodlamaio.hrms.core.utilities.results.Result;
import kodlamaio.hrms.core.utilities.results.SuccessDataResult;
import kodlamaio.hrms.core.utilities.results.SuccessResult;
import kodlamaio.hrms.dataAccess.abstracts.StaffDao;
import kodlamaio.hrms.entities.concretes.Staff;

@Service
public class StaffManager implements StaffService {

	private StaffDao staffDao;

	@Autowired
	public StaffManager(StaffDao stuffdao) {
		super();
		this.staffDao = stuffdao;
	}

	@Override
	public DataResult<List<Staff>> getAll() {

		return new SuccessDataResult<List<Staff>>(this.staffDao.findAll(), "Datalar listelendi");
	}

	@Override
	public Result add(Staff staff) {
		this.staffDao.save(staff);
		return new SuccessResult("Eklendi");
	}

}
