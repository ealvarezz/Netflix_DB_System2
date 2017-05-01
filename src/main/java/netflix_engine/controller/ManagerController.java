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
	
	@RequestMapping(value="addMovie", method = RequestMethod.GET)
	   public @ResponseBody void addMovie() {
	 	 
	   }

}
