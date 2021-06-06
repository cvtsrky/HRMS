package kodlamaio.hrms.dataAccess.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kodlamaio.hrms.entities.concretes.Stuff;

@Repository
public interface StuffDao extends JpaRepository<Stuff,Integer>{

}
