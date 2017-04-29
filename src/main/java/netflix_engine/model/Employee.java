package netflix_engine.model;

/**
Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| SSN        | int(11)      | NO   | PRI | NULL    |       |
| PersonId   | int(11)      | NO   | PRI | NULL    |       | -foreign key to Person class
| StartDate  | date         | NO   |     | NULL    |       |
| HourlyRate | decimal(5,2) | NO   |     | NULL    |       |
| Position   | char(10)     | YES  |     | NULL    |       |
| Password   | char(40)     | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+----
**/




import java.sql.Date;
/* Try importing this below if the one above doesn't work
 * 				import java.util.Date;
 * */
 
import java.math.BigDecimal;
import netflix_engine.model.Person;



	public class Employee extends Person {


		private int ssn;
		private Date startDate;
		private BigDecimal HourlyRate;
		private String position;
		private String password;


		public int getSsn() {
			return ssn;
		}
		public void setSsn(int ssn) {
			this.ssn = ssn;
		}
		public Date getStartDate() {
			return startDate;
		}
		public void setStartDate(Date startDate) {
			this.startDate = startDate;
		}
		public BigDecimal getHourlyRate() {
			return HourlyRate;
		}
		public void setHourlyRate(BigDecimal hourlyRate) {
			HourlyRate = hourlyRate;
		}
		public String getPosition() {
			return position;
		}
		public void setPosition(String position) {
			this.position = position;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
	
}
