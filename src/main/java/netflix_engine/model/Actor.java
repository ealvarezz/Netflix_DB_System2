package netflix_engine.model;

import java.math.BigDecimal;

/**
*+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| Id          | int(11)      | NO   | PRI | NULL    | auto_increment |
| Name        | char(64)     | NO   |     | NULL    |                |
| Rating      | decimal(3,2) | YES  |     | 0.00    |                |
| Age         | int(11)      | YES  |     | NULL    |                |
| Gender      | char(1)      | YES  |     | NULL    |                |
| TotalRating | int(11)      | YES  |     | 0       |                |
+-------------+--------------+------+-----+---------+----------------+
 */


public class Actor {
	private int Id;
	private String name;
	private BigDecimal rating;
	private int age;
	private String gender;
	private int totalRating;
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BigDecimal getRating() {
		return rating;
	}
	public void setRating(BigDecimal rating) {
		this.rating = rating;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getTotalRating() {
		return totalRating;
	}
	public void setTotalRating(int totalRating) {
		this.totalRating = totalRating;
	}
	
	
}
