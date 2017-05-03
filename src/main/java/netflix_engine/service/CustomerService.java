package netflix_engine.service;

import java.util.List;

import netflix_engine.model.Account;
import netflix_engine.model.Customer;
import netflix_engine.model.FuegoOrder;
import netflix_engine.model.Movie;

public interface CustomerService {
	
	Customer getCustomerById(String email);
	
	List<FuegoOrder> getOrdersByEmail(String email);
	
	List<FuegoOrder> getPastOrdersByEmail(String email);
	
	List<FuegoOrder> getAllOrdersByEmail(String email);
	
	List<Movie> getCustomerWishList(Integer id);
	
	Account getCustomerAccount(String email);
	
	void addToQueue(int accNum, int movieId);
	
	List<Movie> getMovieListByType(String mType);
	
	List<Movie> getBestSellerMovies(Integer limit);
	
	List<Movie> findMovie(String keyword);
	
	void returnHeldMovie(FuegoOrder order) throws Exception;
	
	void deleteCustomerAccount(String email) throws Exception;
	
	List<Movie> returnRecommendedMovies(String email);
	
	void rateCurrentMovie(String email, Integer movieId, Integer rate) throws Exception;
}
