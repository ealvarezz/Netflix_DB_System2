package netflix_engine.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import netflix_engine.model.Employee;
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
	 public @ResponseBody String newCustomer(@RequestBody Customer newCustomer) {


		try {
			employeeService.addCustomer(newCustomer);
			return "hey";

		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		return "ERROR";
	}



	 @RequestMapping(value="employee_login_submit", method = RequestMethod.POST)
		public @ResponseBody Object confirmEmployeeLogin(@RequestBody Employee employee) {

			int SSN = employee.getSsn();
			String attemptPassword = employee.getPassword();

			Employee vEmployee = employeeService.getEmployeeBySSN(SSN);
			

			if(vEmployee == null){
				return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			} else {
				String verifyPassword = vEmployee.getPassword();
				if(verifyPassword == null || !verifyPassword.equals(attemptPassword))
					return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
				else
					return new ResponseEntity<>(HttpStatus.OK);
			}

		}

}
