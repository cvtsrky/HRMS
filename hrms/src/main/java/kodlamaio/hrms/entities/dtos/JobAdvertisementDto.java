package kodlamaio.hrms.entities.dtos;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JobAdvertisementDto {
	
	private String employerCompanyName;
	private String jobTitlePosition;
	private int openPositionCount;
	private LocalDate lastApplyDate;
	private String description;
}
