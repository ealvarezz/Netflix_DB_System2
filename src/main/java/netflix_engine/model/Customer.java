package netflix_engine.model;

/**
 * Field      | Type     | Null | Key | Default | Extra |
+------------+----------+------+-----+---------+-------+
| Email      | char(64) | NO   | PRI | NULL    |       |
| PersonId   | int(11)  | NO   | PRI | NULL    |       | -foreign key to Person class
| CreditCard | char(20) | YES  |     | NULL    |       |
| Rating     | int(11)  | YES  |     | NULL    |       |
| Password   | char(40) | YES  |     | NULL    |       |
+------------+----------+------+-----+---------+-------+

 *
 */

public class Customer extends Person {
	
	private String email;
	private String password;
	private String creditCard;
	private int rating;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCreditCard() {
		return creditCard;
	}
	public void setCreditCard(String creditCard) {
		this.creditCard = creditCard;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	
	
	
	
}
