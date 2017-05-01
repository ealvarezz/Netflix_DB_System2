package netflix_engine.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import netflix_engine.model.Account;
import netflix_engine.model.Customer;
import netflix_engine.model.FuegoOrder;
import netflix_engine.model.Movie;

public interface CustomerMapper {
	
	public Customer getCustomerById(@Param("email") String email);
	
	public List<FuegoOrder> getCustomerOrders(@Param("email") String email);
	
	public List<Movie> getWishList(@Param("id") Integer id);
	
	public Account getAccount(@Param("email") String email);
	
	public void addToWishList(@Param("actId") int actId, @Param("movieId") int movieId);
	
	public List<Movie> getMoviesByType(@Param("movieType") String movieType);
	
	public List<Movie> getBestSeller(@Param("limit") Integer limit);
	
	public List<Movie> searchMovie(@Param("keyword") String keyword);
}
