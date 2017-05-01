package netflix_engine.service;

import java.util.List;

import netflix_engine.model.Account;
import netflix_engine.model.Customer;
import netflix_engine.model.FuegoOrder;
import netflix_engine.model.Movie;

public interface CustomerService {
	
	Customer getCustomerById(String email);
	
	List<FuegoOrder> getOrdersByEmail(String email);
	
	List<Movie> getCustomerWishList(Integer id);
	
	Account getCustomerAccount(String email);
	
	void addToQueue(int accNum, int movieId);
	
	List<Movie> getMovieListByType(String mType);
	
	List<Movie> getBestSellerMovies(Integer limit);
	
	List<Movie> findMovie(String keyword);
}
