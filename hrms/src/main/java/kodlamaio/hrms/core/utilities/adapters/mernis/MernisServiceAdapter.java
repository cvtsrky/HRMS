package kodlamaio.hrms.core.utilities.adapters.mernis;

import java.time.LocalDate;

import org.springframework.stereotype.Service;

import kodlamaio.hrms.fakeMernis.FakeMernisService;

@Service
public class MernisServiceAdapter implements UserCheckService {

	@Override
	public boolean checkIfRealPerson(long nationalityId, String firstName, String lastName, LocalDate birthYear) {
		FakeMernisService client = new FakeMernisService();
		
		boolean result = client.TCKimlikDogrula(nationalityId, firstName, lastName, birthYear);

		return result;
	}

}
