package netflix_engine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import netflix_engine.mappers.CustomerMapper;
import netflix_engine.model.Account;
import netflix_engine.model.Customer;
import netflix_engine.model.FuegoOrder;
import netflix_engine.model.Movie;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper customerMapper;
    
    @Autowired
	private PlatformTransactionManager txManager;
    
    public Customer getCustomerById(String email) {
		
		return customerMapper.getCustomerById(email);
	}

	public List<FuegoOrder> getOrdersByEmail(String email) {
		
		
		return customerMapper.getCustomerOrders(email);
	}

	public List<Movie> getCustomerWishList(Integer id) {
		
		return customerMapper.getWishList(id);
	}

	
	public Account getCustomerAccount(String email) {
		
		return customerMapper.getAccount(email);
	}
	
	public void addToQueue(int accNum, int movieId) {
		customerMapper.addToWishList(accNum, movieId);
	}

	public List<Movie> getMovieListByType(String mType) {
		return customerMapper.getMoviesByType(mType);
	}

	public List<Movie> getBestSellerMovies(Integer limit) {
		
		
		return customerMapper.getBestSeller(limit);
	}
	
	public List<Movie> findMovie(String keyword) {
		return customerMapper.searchMovie(keyword);
	}


	public void returnHeldMovie(FuegoOrder order) throws Exception {
		TransactionStatus status = getStatus();

		  try{
			  
			  customerMapper.returnMovie(order);
			  
			  
		  } catch( Exception e ){
			  txManager.rollback(status);
			  e.printStackTrace();
		  }
		  txManager.commit(status);
		
	}
	
	private TransactionStatus getStatus(){
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		return txManager.getTransaction(def);
	}


	public List<FuegoOrder> getPastOrdersByEmail(String email) {
		
		return customerMapper.getPastOrders(email);
	}


	public List<FuegoOrder> getAllOrdersByEmail(String email) {
		
		return customerMapper.getAllOrders(email);
	}


	public void deleteCustomerAccount(String email) throws Exception {
		
		TransactionStatus status = getStatus();

		  try{
			  
			  customerMapper.deleteAccount(email);
			  
			  
		  } catch( Exception e ){
			  txManager.rollback(status);
			  e.printStackTrace();
		  }
		  txManager.commit(status);
		
	}

	


	public void rateCurrentMovie(String email, Integer movieId, Integer rate) throws Exception {
		TransactionStatus status = getStatus();
		
		  try{
			  
			  customerMapper.rateMovie(email, movieId, rate);
			  
			  
		  } catch( Exception e ){
			  txManager.rollback(status);
			  e.printStackTrace();
		  }
		  txManager.commit(status);
		
	}


	public List<Movie> returnRecommendedMovies(String email) {
		
		return customerMapper.getMovieSuggestions(email);
	}
}
