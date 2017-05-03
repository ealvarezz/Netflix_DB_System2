package netflix_engine.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.http.*;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.annotation.JsonProperty;

import netflix_engine.model.Employee;
import netflix_engine.model.FuegoOrder;
import netflix_engine.model.Movie;
import netflix_engine.model.Person;
import netflix_engine.general.Status;
import netflix_engine.model.Account;
import netflix_engine.model.Customer;
import netflix_engine.service.EmployeeService;

@Controller
@SessionAttributes("Manager")
public class ManagerController {
	
	@Autowired
    private EmployeeService employeeService;
	
	@RequestMapping(value="manager/addmovie", method = RequestMethod.POST)
	   public @ResponseBody Object addMovie(@RequestBody Movie movie) {
		
		if(movie.getMovieType() == null|| movie.getFee() == null){
			
			if(employeeService.getMovieByMoviename(movie.getName()) == null)
				return new Status("error", "Please provide all info to add a new movie");
			
		}
		
		try{
			 employeeService.addMovieToDb(movie);
		 }
		 catch (Exception e) {

				
				return new Status("error",e.getMessage());
				
			}

			return new Status("OK","Movie was added correctly");
	 	 
	}
	
	@RequestMapping(value="manager/editmovie", method = RequestMethod.POST)
	   public @ResponseBody Object editMovie(@RequestBody Movie movie) {
	 	 
		if(employeeService.getMovieByMoviename(movie.getName()) == null)
			return new Status("error", "There is no movie with that name");
		
		try{
			 employeeService.editMovieInDb(movie);
		 }
		 catch (Exception e) {

				
				return new Status("error",e.getMessage());
				
			}

			return new Status("OK","Movie was updated correctly");
	}
	
	@RequestMapping(value="manager/deletemovie", method = RequestMethod.POST)
	   public @ResponseBody Object deleteMovie(@RequestBody Movie movie) {
		
		if(employeeService.getMovieByMoviename(movie.getName()) == null)
			return new Status("error", "There is no movie with that name");
		
		try{
			 employeeService.deleteMovieFromDb(movie.getName());
		 }
		 catch (Exception e) {

				
				return new Status("error",e.getMessage());
				
			}

			return new Status("OK","Movie was deleted correctly");
	 	 
	}
	
	@RequestMapping(value="manager/addemployee", method = RequestMethod.POST)
	   public @ResponseBody Object addEmployee(@RequestBody Employee employee) {
		
		try{
			 employeeService.addEmployeeToDb(employee);
		 }
		 catch (Exception e) {

				
				return new Status("error",e.getMessage());
				
			}

			return new Status("OK","Employee was added correctly");
	 	 
	}
	
	@RequestMapping(value="manager/editemployee", method = RequestMethod.POST)
	   public @ResponseBody Object editEmployee(@RequestBody Employee employee) {
	 	 
		if(employeeService.getEmployeeBySSN(employee.getSsn()) == null)
			return new Status("error", "Employee with specified ssn does not exist");
		
		try{
			 employeeService.editEmployeeInDb(employee);
		 }
		 catch (Exception e) {

				
				return new Status("error",e.getMessage());
				
			}

			return new Status("OK","Employee was updated successfully");
		
	}
	
	@RequestMapping(value="manager/deleteemployee", method = RequestMethod.POST)
	   public @ResponseBody Object deleteEmployee(@RequestBody Employee employee) {
		
		if(employeeService.getEmployeeBySSN(employee.getSsn()) == null)
			return new Status("error", "Employee with specified ssn does not exist");
		
		try{
			 employeeService.deteleEmployeeFromDb(employee.getSsn());
		 }
		 catch (Exception e) {

				
				return new Status("error",e.getMessage());
				
			}

			return new Status("OK","Employee was deleted successfully");
	 	 
	}
	
	@RequestMapping(value="allmovies", method = RequestMethod.GET)
	   public @ResponseBody List<Movie> listAllMovies() {
		
		return employeeService.getAllCurrentMovies();
	 	 
	}
	
	@RequestMapping(value="manager/activemovies", method = RequestMethod.POST)
	   public @ResponseBody List<Movie> listAllActiveMovies(@RequestBody Stuff limit) {
		
		return employeeService.getMostActiveMovies(limit.getLimit());
	 	 
	}
	
	@RequestMapping(value="manager/activeusers", method = RequestMethod.POST)
	   public @ResponseBody List<Customer> listAllActiveUsers(@RequestBody Stuff limit) {
		
		return employeeService.getMostActiveUsers(limit.getLimit());
	 	 
	}
	
	@RequestMapping(value="manager/getallemployees", method = RequestMethod.GET)
	   public @ResponseBody List<Employee> getAllEmployees() {
		
		return employeeService.getEmployeeList();
	 	 
	}
	
	@RequestMapping(value="manager/getactiveemployee", method = RequestMethod.GET)
	   public @ResponseBody Employee getActiveEmployees() {
		
		return employeeService.getMostActiveEmployee();
	 	 
	}
	
	@RequestMapping(value="manager/searchemployee", method = RequestMethod.POST)
	   public @ResponseBody Employee getEmployeeBySSN(@RequestBody Employee employee) {
		
		return employeeService.getEmployeeBySSN(employee.getSsn());
	 	 
	}
	
	@RequestMapping(value="manager/ordersbyname", method = RequestMethod.POST)
	   public @ResponseBody List<FuegoOrder> getOrdersByName(@RequestBody Movie movie) {
		
		return employeeService.getAllOrdersByName(movie.getName());
	 	 
	}
	
	@RequestMapping(value="manager/ordersbytype", method = RequestMethod.POST)
	   public @ResponseBody List<FuegoOrder> getOrdersByType(@RequestBody Movie movie) {
		
		return employeeService.getAllOrdersBytype(movie.getMovieType());
	 	 
	}
	
	@RequestMapping(value="manager/ordersbycustomer", method = RequestMethod.POST)
	   public @ResponseBody List<FuegoOrder> getEmployeeBySSN(@RequestBody Person person) {
		
		return employeeService.getAllOrdersByCustomerName(person.getFirstName(), person.getLastName());
	 	 
	}
	
	@RequestMapping(value="manager/moviebyname", method = RequestMethod.POST)
	   public @ResponseBody Movie getEmployeeBySSN(@RequestBody Movie movie) {
		
		return employeeService.getMovieByMoviename(movie.getName());
	 	 
	}
	
	
	
	private static class Stuff{
		
		private int limit;
		
		public Stuff(){}

		public int getLimit() {
			return limit;
		}

		public void setLimit(int limit) {
			this.limit = limit;
		}
		
	}

}
