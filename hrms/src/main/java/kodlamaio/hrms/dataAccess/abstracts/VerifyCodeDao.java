package kodlamaio.hrms.dataAccess.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kodlamaio.hrms.entities.concretes.VerifyCode;

@Repository
public interface VerifyCodeDao extends JpaRepository<VerifyCode, Integer> {

	VerifyCode getByVerifyCode(String Code);

	boolean existsByVerifyCode(String Code);

}
