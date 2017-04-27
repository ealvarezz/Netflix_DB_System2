package netflix_engine.model;
/**
 * +---------+---------+------+-----+---------+-------+
| Field   | Type    | Null | Key | Default | Extra |
+---------+---------+------+-----+---------+-------+
| MovieId | int(11) | NO   | PRI | NULL    |       |
| ActorId | int(11) | NO   | PRI | NULL    |       |
+---------+---------+------+-----+---------+-------+
 **/


public class AppearedIn {
	private int movieId;
	private int actorId;
	
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public int getActorId() {
		return actorId;
	}
	public void setActorId(int actorId) {
		this.actorId = actorId;
	}
}
