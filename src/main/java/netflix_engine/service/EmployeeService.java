package netflix_engine.service;


import java.io.IOException;
import java.util.List;

import netflix_engine.model.Account;
import netflix_engine.model.Customer;
import netflix_engine.model.Employee;
import netflix_engine.model.FuegoOrder;
import netflix_engine.model.Movie;

public interface EmployeeService {

	List<Customer> returnMailingList();

	List<Customer> getAllCustomers();



	
	Employee getEmployeeBySSN(int ssn);

	void addCustomer(Customer newCustomer) throws IOException;

	void addCustomerAccount(Account newAccount) throws Exception;

	void updateCustomerSettings(Account account) throws Exception;
	
	void processCustomerOrder(FuegoOrder order) throws Exception;

	void addMovieToDb(Movie movie) throws Exception;
	
	void editMovieInDb(Movie movie) throws Exception;
	
	void deleteMovieFromDb(String movieName) throws Exception;
	
	Movie getMovieByMoviename(String name);
	
	void addEmployeeToDb(Employee employee) throws Exception;
	
	void editEmployeeInDb(Employee employee) throws Exception;
	
	void deteleEmployeeFromDb(Integer ssn) throws Exception;
	
	List<Account> getAllCustomerAccounts();

}
