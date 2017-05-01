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

import netflix_engine.model.Employee;
import netflix_engine.model.FuegoOrder;
import netflix_engine.model.Movie;
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

}
