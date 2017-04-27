package netflix_engine.model;

/**
 * +-----------+---------+------+-----+---------+-------+
| Field     | Type    | Null | Key | Default | Extra |
+-----------+---------+------+-----+---------+-------+
| AccountId | int(11) | NO   | PRI | NULL    |       |
| MovieId   | int(11) | NO   | PRI | NULL    |       |
+-----------+---------+------+-----+---------+-------+
 **/

public class Queued {
	
	private int accountId;
	private int movieId;
	
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
}
