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
@SessionAttributes("Employee")
public class EmployeeController {

	@Autowired
    private EmployeeService employeeService;
	

	/**
    *
    * This will basically perform a query from the mapper's xml file
    * It calls the store procedure in the database.
    *
    */
   @RequestMapping(value="customerList", method = RequestMethod.GET)
   public @ResponseBody List<Customer> returnMailingList() {
 	  List<Customer> customerList = employeeService.returnMailingList();

 	  return customerList;
   }


   @RequestMapping(value="allcustomerList", method = RequestMethod.GET)
   public @ResponseBody List<Customer> getAllCustomers() {
 	  List<Customer> customerList =  employeeService.getAllCustomers();

 	  return customerList;
   }

//   @RequestMapping(value="login", method = RequestMethod.GET)
//   public @ResponseBody String login() {

 	 // return "redirect:resources/jsp/login.jsp";
   //}


	 @RequestMapping(value="addcustomer", method = RequestMethod.POST)
	 public @ResponseBody Object newCustomer(@RequestBody Account newAccount) {
		 
		
		 
		 if(newAccount == null || newAccount.getCustomer() == null)
			 return new Status("error","Something went wrong");

		try {
			
			employeeService.addCustomer(newAccount.getCustomer());
			employeeService.addCustomerAccount(newAccount);
			
			

		}
		catch (Exception e) {			
			
			return new Status("error",e.getMessage());
			
		}

		return new Status("OK","Inertion was good");
	}



	 @RequestMapping(value="employee_login_submit", method = RequestMethod.POST)
		public @ResponseBody Object confirmEmployeeLogin(@RequestBody Employee employee) {

			Integer SSN = employee.getSsn();
			String attemptPassword = employee.getPassword();

			Employee vEmployee = employeeService.getEmployeeBySSN(SSN);
			String position;

			if(vEmployee == null){
				return new Status("error","There is no user with that ID");
			} else {
				String verifyPassword = vEmployee.getPassword();
				position = vEmployee.getPosition();
				
				if(verifyPassword == null || !verifyPassword.equals(attemptPassword))
					return new Status("error","Wrong password bruh!");
				else
					return new Status("OK",position.toLowerCase());
			}

		}
	 
	 @RequestMapping(value="update_account", method = RequestMethod.POST)
		public @ResponseBody Object updateCustomer(@RequestBody Account account) {
		 
		 try{
			 employeeService.updateCustomerSettings(account);
		 }
		 catch (Exception e) {

				
				return new Status("error",e.getMessage());
				
			}

			return new Status("OK","Update was good");
	 }
	 
	 @RequestMapping(value="process_order", method = RequestMethod.POST)
		public @ResponseBody Object processCustomerOrder(@RequestBody FuegoOrder order) {
		 
		 try{
			 employeeService.processCustomerOrder(order);
		 }
		 catch (Exception e) {
				
				
				return new Status("error",e.getMessage());
				
			}

			return new Status("OK","Update was good");
	 }

}
