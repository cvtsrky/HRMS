package kodlamaio.hrms.entities.dtos;

import java.time.LocalDate;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JobAdvertisementAddDto {

	@JsonIgnore
	private int id;
	private int employerId;
	private int jobTitleId;
	private int openPositionCount;
	private int minSalary;
	private int maxSalary;
	private int cityId;
	private LocalDate lastApplyDate;
	private String description;
}
