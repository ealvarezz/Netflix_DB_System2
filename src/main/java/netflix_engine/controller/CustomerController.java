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
import netflix_engine.service.CustomerService;
import util.DbErrors.CustomerErrors;

@Controller
@SessionAttributes("Customer")

public class CustomerController {

    @Autowired
    private CustomerService customerService;

    /**
     *
     * This will basically perform a query from the mapper's xml file
     * It calls the store procedure in the database.
     *
     */
    @RequestMapping(value="customerList", method = RequestMethod.GET)
    public @ResponseBody List<Customer> returnMailingList() {
      System.out.println("CUSTOMERCONTROLLLLLLEEERRR\n");
  	  List<Customer> customerList =  customerService.returnMailingList();

  	  return customerList;
    }


    @RequestMapping(value="allcustomerList", method = RequestMethod.GET)
    public @ResponseBody List<Customer> getAllCustomers() {
      System.out.println("CUSTOMERCONTROLLLLLLEEERRR\n");
  	  List<Customer> customerList =  customerService.getAllCustomers();

  	  return customerList;
    }
}
