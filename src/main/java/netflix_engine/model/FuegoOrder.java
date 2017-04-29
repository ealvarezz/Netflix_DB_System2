package netflix_engine.model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 * +------------+-----------+------+-----+-------------------+-----------------------------+
| Field      | Type      | Null | Key | Default           | Extra                       |
+------------+-----------+------+-----+-------------------+-----------------------------+
| OrderId    | int(11)   | NO   | PRI | NULL              | auto_increment              |
| MovieId    | int(11)   | NO   | PRI | NULL              |                             |
| CustomerId | char(64)  | NO   | PRI | NULL              |                             |
| TimeDate   | timestamp | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
| ReturnDate | date      | YES  |     | NULL              |                             |
| EmployeeId | int(11)   | YES  | MUL | NULL              |                             |
| STATE      | char(8)   | YES  |     | Held              |                             |
+------------+-----------+------+-----+-------------------+-----------------------------+
 *
 */


public class FuegoOrder {
	private Integer orderId;
	private Integer movieId;
	private String customerId;
	private Timestamp timeDate;
	private Date returnDate;
	private Integer employeeId;
	private	String state;
	private Movie movie;
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getMovieId() {
		return movieId;
	}
	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public Timestamp getTimeDate() {
		return timeDate;
	}
	public void setTimeDate(Timestamp timeDate) {
		this.timeDate = timeDate;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	public Integer getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}

	

}
