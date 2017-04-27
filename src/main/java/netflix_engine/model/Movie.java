package netflix_engine.model;

import java.math.BigDecimal;

/**
 * +-------------+---------------+------+-----+---------+----------------+
| Field       | Type          | Null | Key | Default | Extra          |
+-------------+---------------+------+-----+---------+----------------+
| Id          | int(11)       | NO   | PRI | NULL    | auto_increment |
| MovieType   | char(10)      | YES  |     | NULL    |                |
| Name        | char(64)      | NO   |     | NULL    |                |
| Fee         | decimal(65,2) | NO   |     | NULL    |                |
| NumCopies   | int(11)       | YES  |     | NULL    |                |
| Rating      | decimal(3,2)  | YES  |     | NULL    |                |
| TotalRating | int(11)       | YES  |     | 0       |                |
+-------------+---------------+------+-----+---------+----------------+
 *
 */


public class Movie {
	
	private int id;
	private String movieType;
	private String name;
	private BigDecimal Fee;
	private int NumCopes;
	private BigDecimal rating;
	private int totalRating;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMovieType() {
		return movieType;
	}
	public void setMovieType(String movieType) {
		this.movieType = movieType;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BigDecimal getFee() {
		return Fee;
	}
	public void setFee(BigDecimal fee) {
		Fee = fee;
	}
	public int getNumCopes() {
		return NumCopes;
	}
	public void setNumCopes(int numCopes) {
		NumCopes = numCopes;
	}
	public BigDecimal getRating() {
		return rating;
	}
	public void setRating(BigDecimal rating) {
		this.rating = rating;
	}
	public int getTotalRating() {
		return totalRating;
	}
	public void setTotalRating(int totalRating) {
		this.totalRating = totalRating;
	}
}
