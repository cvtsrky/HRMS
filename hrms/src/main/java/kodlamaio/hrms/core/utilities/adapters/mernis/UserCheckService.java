package kodlamaio.hrms.core.utilities.adapters.mernis;

public interface UserCheckService {
	boolean checkIfRealPerson(long nationalityId, String firstName, String lastName,int birthYear);
}
