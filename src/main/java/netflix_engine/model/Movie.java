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
	
	private Integer id;
	private String movieType;
	private String name;
	private BigDecimal fee;
	private Integer numCopes;
	private BigDecimal rating;
	private Integer totalRating;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
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
		return fee;
	}
	public void setFee(BigDecimal fee) {
		this.fee = fee;
	}
	public Integer getNumCopes() {
		return numCopes;
	}
	public void setNumCopes(Integer numCopes) {
		this.numCopes = numCopes;
	}
	public BigDecimal getRating() {
		return rating;
	}
	public void setRating(BigDecimal rating) {
		this.rating = rating;
	}
	public Integer getTotalRating() {
		return totalRating;
	}
	public void setTotalRating(Integer totalRating) {
		this.totalRating = totalRating;
	}
	
	
}
