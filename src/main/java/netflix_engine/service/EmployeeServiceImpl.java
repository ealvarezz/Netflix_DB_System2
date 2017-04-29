package netflix_engine.service;

import org.springframework.stereotype.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import netflix_engine.mappers.EmployeeMapper;
import netflix_engine.model.Customer;
import netflix_engine.model.Employee;


@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
    private EmployeeMapper employeeMapper;
	
	public List<Customer> returnMailingList(){
  	  List<Customer> customerList = employeeMapper.getMail();
  	  return customerList;
    }

    public List<Customer> getAllCustomers(){
      List<Customer> customerList = employeeMapper.getCustomers();
  	  return customerList;
    }
    
    public void addCustomer(Customer C) {
    	//employeeMapper.newCustomer(C);
    }
    
    public Employee getEmployeeBySSN(int ssn){
    	
    	
    	return employeeMapper.getBySSN(ssn);
    }
}
