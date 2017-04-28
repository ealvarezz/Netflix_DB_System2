package netflix_engine.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import netflix_engine.model.Customer;
import netflix_engine.model.Movie;
import netflix_engine.service.CustomerService;
import util.DbErrors.CustomerErrors;

@Controller
@SessionAttributes("Customer")

public class CustomerController {

    @Autowired
    private CustomerService customerService;
    
    @RequestMapping(value="getallmovielist", method = RequestMethod.POST)
	 public @ResponseBody String allMoviesList(@RequestBody Customer customer) {
    	
    	String email = customer.getEmail();
    	List<List<Movie>> allMovies = new ArrayList<List<Movie>>();
    	
    	return "Litness";

	}
    
    
}
