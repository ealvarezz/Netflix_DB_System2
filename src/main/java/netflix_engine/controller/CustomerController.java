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
		 
		 Account acct = customerService.getCustomerAccount(data.getCustomerId());
		 
		 int accNum = acct.getAcctNum();
		 int movieId = data.getMovieId();
		 
		 customerService.addToQueue(accNum, movieId);
		 
		 return new Status("OK", "Added to Wish List", null);
	 }
	 
	 
	 @RequestMapping(value="movie_list_by_type", method = RequestMethod.POST)
		public @ResponseBody Object getMovieListByType(@RequestBody Movie movie) {
		 
		 List<Movie> movieList = customerService.getMovieListByType(movie.getMovieType());
		 return new Status("OK", "Here is the Movie List By Type", movieList);
	 }



}

