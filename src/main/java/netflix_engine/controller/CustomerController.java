package netflix_engine.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import netflix_engine.general.Status;
import netflix_engine.model.Account;
import netflix_engine.model.Customer;
import netflix_engine.model.Employee;
import netflix_engine.model.FuegoOrder;
import netflix_engine.model.Movie;
import netflix_engine.service.CustomerService;
import util.DbErrors.CustomerErrors;

@Controller
@SessionAttributes("Customer")

public class CustomerController {

	@Autowired
	private CustomerService customerService;


	@RequestMapping(value="getallmovielist", method = RequestMethod.POST)
	public @ResponseBody Customer allMoviesList(@RequestBody Customer customer) {

		String email = customer.getEmail();
		Customer entCustomer = customerService.getCustomerById(email);


		return entCustomer;

	}

	@RequestMapping(value="login_submit", method = RequestMethod.POST)
	public @ResponseBody Object confirmLogin(@RequestBody Customer customer) {

		String email = customer.getEmail();
		String attemptPassword = customer.getPassword();

		Customer vCustomer = customerService.getCustomerById(email);
		if(vCustomer == null){
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		} else {
			String verifyPassword = vCustomer.getPassword();
			if(verifyPassword == null || !verifyPassword.equals(attemptPassword))
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			else
				return new ResponseEntity<>(HttpStatus.OK);
		}
	}
	
	@RequestMapping(value="getcustomerorders", method = RequestMethod.POST)
	public @ResponseBody List<FuegoOrder> getCurrentOrders(@RequestBody Customer customer) {

		String email = customer.getEmail();
		List<FuegoOrder> orders = customerService.getOrdersByEmail(email);


		return orders;

	}
	
	@RequestMapping(value="getallcustomerorders", method = RequestMethod.POST)
	public @ResponseBody List<FuegoOrder> getAllCurrentOrders(@RequestBody Customer customer) {

		String email = customer.getEmail();
		List<FuegoOrder> orders = customerService.getAllOrdersByEmail(email);


		return orders;

	}
	
	@RequestMapping(value="getpastcustomerorders", method = RequestMethod.POST)
	public @ResponseBody List<FuegoOrder> getPastCurrentOrders(@RequestBody Customer customer) {

		String email = customer.getEmail();
		List<FuegoOrder> orders = customerService.getPastOrdersByEmail(email);


		return orders;

	}
	
	@RequestMapping(value="getwishlist", method = RequestMethod.POST)
	public @ResponseBody List<Movie> getWishList(@RequestBody Customer customer) {
		
		String email = customer.getEmail();
		Customer vCustomer = customerService.getCustomerById(email);
		Integer id = vCustomer.getPersonID();
	


		return customerService.getCustomerWishList(id);

	}
	
	@RequestMapping(value="accountsettings", method = RequestMethod.POST)
	public @ResponseBody Object getAccountSetting(@RequestBody Customer customer) {
		
		String email = customer.getEmail();
		
		Customer vCustomer = customerService.getCustomerById(email);
	
		if(vCustomer == null)
			return new Status("error", "no account found with this email");

		Account raccount =  customerService.getCustomerAccount(email);
		
		return new Status("OK", "Account found", raccount);

	}
	
	
	 @RequestMapping(value="add_to_queue", method = RequestMethod.POST)
		public @ResponseBody Object addToQueue(@RequestBody FuegoOrder data) {
		 
		 try{
			 Account acct = customerService.getCustomerAccount(data.getCustomerId());
			 int accNum = acct.getAcctNum();
			 int movieId = data.getMovieId();
			 
			 customerService.addToQueue(accNum, movieId);
			 
		 }catch(Exception e){
			 return new Status("error", "You already have this movie on queue", null);
		 }
		 
		 
		 return new Status("OK", "Added to Wish List", null);
	 }
	 
	 
	 @RequestMapping(value="movie_list_by_type", method = RequestMethod.POST)
		public @ResponseBody Object getMovieListByType(@RequestBody Movie movie) {
		 
		 List<Movie> movieList = customerService.getMovieListByType(movie.getMovieType());
		 return new Status("OK", "Here is the Movie List By Type", movieList);
	 }
	 
	 
	 @RequestMapping(value="getbestseller", method = RequestMethod.POST)
		public @ResponseBody Object getBestSeller(@RequestBody Movie movie) {
		 
		 List<Movie> list = customerService.getBestSellerMovies(movie.getNumCopies());
		 return new Status("OK", "These are the best seller movies", list);
	 }

	 @RequestMapping(value="searchmovie", method = RequestMethod.POST)
		public @ResponseBody Object findMovie(@RequestBody Movie movie) {
		 
		 String keyword = movie.getName();
		 List<Movie> list = customerService.findMovie(keyword);
		 return new Status("OK", "Movies Containing" + keyword, list);
	 }
	 
	 @RequestMapping(value="returnmovie", method = RequestMethod.POST)
		public @ResponseBody Object returnMovie(@RequestBody FuegoOrder order) {
		 
		 
		 if(order == null || customerService.getCustomerById(order.getCustomerId()) == null)
			 return new Status("error","Something went wrong");

		try {
			customerService.returnHeldMovie(order);

		}
		catch (Exception e) {			
			
			return new Status("error",e.getMessage());
			
		}

		return new Status("OK","Movie was returned just fine");
	 }
	 
	 @RequestMapping(value="deleteaccount", method = RequestMethod.POST)
		public @ResponseBody Object returnMovie(@RequestBody Customer customer) {
		 

		try {
			customerService.deleteCustomerAccount(customer.getEmail());

		}
		catch (Exception e) {			
			
			return new Status("error",e.getMessage());
			
		}

		return new Status("OK","Account was deleted successfully!");
	 }
	 
	 @RequestMapping(value="ratemovie", method = RequestMethod.POST)
		public @ResponseBody Object returnMovie(@RequestBody Rate rate) {
		 

		try {
			customerService.rateCurrentMovie(rate.getEmail(), rate.getMovieId(), rate.getRate());

		}
		catch (Exception e) {			
			
			return new Status("error",e.getMessage());
			
		}

		return new Status("OK","Thank you for rating!");
	 }
	 
	 @RequestMapping(value="recomendedlist", method = RequestMethod.POST)
		public @ResponseBody List<Movie> getMovieListByType(@RequestBody Customer customer) {
		 
		 return customerService.returnRecommendedMovies(customer.getEmail());
	 }
	 
	 private static class Rate{
		 
		 Integer rate;
		 String email;
		 Integer movieId;
		 
		 public Rate(){}
		 
		 public Integer getRate() {
			return rate;
		}

		public void setRate(Integer rate) {
			this.rate = rate;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public Integer getMovieId() {
			return movieId;
		}

		public void setMovieId(Integer movieId) {
			this.movieId = movieId;
		}
		 
		 
		 
	 }

}

