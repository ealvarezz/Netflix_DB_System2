package netflix_engine.service;


import java.io.IOException;
import java.util.List;
import netflix_engine.model.Customer;

public interface EmployeeService {

	List<Customer> returnMailingList();

	List<Customer> getAllCustomers();

	void addCustomer(Customer newCustomer) throws IOException;

}
