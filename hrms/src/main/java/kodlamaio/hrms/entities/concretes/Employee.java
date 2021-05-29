package kodlamaio.hrms.entities.concretes;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name="employees")
@EqualsAndHashCode(callSuper = false)
@PrimaryKeyJoinColumn(name="id")
public class Employee extends User{
	
	@Column(name="first_name", nullable = false)
	private String firstName;
	
	@Column(name="last_name", nullable = false)
	private String lastName;
}
