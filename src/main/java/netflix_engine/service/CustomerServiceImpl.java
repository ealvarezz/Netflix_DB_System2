package netflix_engine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import netflix_engine.mappers.CustomerMapper;
import netflix_engine.model.Customer;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper customerMapper;

    public List<Customer> returnMailingList(){
      System.out.println("IIIIIIIIIIIIIIIIIIIIIIII");
  	  List<Customer> customerList = customerMapper.getMail();
      System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaa");
  	  return customerList;
    }

    public List<Customer> getAllCustomers(){
      System.out.println("IIIIIIIIIIIIIIIIIIIIIIII");
      List<Customer> customerList = customerMapper.getCustomers();
      System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaa");
  	  return customerList;
    }

}
