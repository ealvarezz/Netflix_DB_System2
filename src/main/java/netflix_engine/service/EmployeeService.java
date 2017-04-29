package netflix_engine.service;


import java.io.IOException;
import java.util.List;
import netflix_engine.model.Customer;
import netflix_engine.model.Employee;

public interface EmployeeService {

	List<Customer> returnMailingList();

	List<Customer> getAllCustomers();



	void addCustomer(Customer C);

	Employee getEmployeeBySSN(int ssn);

	void addCustomer(Customer newCustomer) throws IOException;






}
