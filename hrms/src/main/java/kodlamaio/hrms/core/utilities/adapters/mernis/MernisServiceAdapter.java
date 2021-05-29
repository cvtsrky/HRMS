package kodlamaio.hrms.core.utilities.adapters.mernis;

import org.springframework.stereotype.Service;

import kodlamaio.hrms.fakeMernis.FakeMernisService;

@Service
public class MernisServiceAdapter implements UserCheckService {

	@Override
	public boolean checkIfRealPerson(long nationalityId, String firstName, String lastName, int birthYear) {
		FakeMernisService client = new FakeMernisService();
		
		boolean result = client.TCKimlikDogrula(nationalityId, firstName, lastName, birthYear);

		return result;
	}

}
