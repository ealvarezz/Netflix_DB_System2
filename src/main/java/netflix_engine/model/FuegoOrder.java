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
| STATE      | char(8)   | YES  |     | NULL              |                             |
+------------+-----------+------+-----+-------------------+-----------------------------+
 *
 */


public class FuegoOrder {
	private int orderId;
	private int movieId;
	private int customerId;
	private Timestamp timeDate;
	private Date returnDate;
	private int employeeId;
	private	String state;
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
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
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
