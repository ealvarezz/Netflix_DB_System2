package netflix_engine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

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
   
   @RequestMapping(value="login", method = RequestMethod.GET)
   public @ResponseBody String login() {

 	  return "/WEB-INF/resources/jsp/login.jsp";
   }


	 @RequestMapping(value="addcustomer", method = RequestMethod.POST)
	 public @ResponseBody String newCustomer(@RequestBody Customer newCustomer) {

						 System.out.println(newCustomer.getPersonID());
						 System.out.println(newCustomer.getFirstName());
						 System.out.println(newCustomer.getLastName());
						 System.out.println(newCustomer.getAddress());
						 System.out.println(newCustomer.getCity());
						 System.out.println(newCustomer.getState());
						 System.out.println(newCustomer.getZip());
						 System.out.println(newCustomer.getTelephone());
						 System.out.println(newCustomer.getEmail());
						 System.out.println(newCustomer.getPassword());
						 System.out.println(newCustomer.getCreditCard());
						 System.out.println(newCustomer.getRating());
						 return "hey";

		 }
}
