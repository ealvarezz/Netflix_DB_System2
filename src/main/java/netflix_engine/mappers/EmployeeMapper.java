package netflix_engine.mappers;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import netflix_engine.model.Account;
import netflix_engine.model.Customer;
import netflix_engine.model.Employee;
import netflix_engine.model.FuegoOrder;
import netflix_engine.model.Movie;


public interface EmployeeMapper {
	public List<Customer> getMail();
	public List<Customer> getCustomers();

	public Customer getCustomerById(@Param("email") String email);
	
	public void newCustomer(@Param(value = "lastName") String lastName,
							@Param(value = "firstName") String firstName,
							@Param(value = "address") String address,
							@Param(value = "city") String city,
							@Param(value = "state") String state,
							@Param(value = "zip") String zip,
							@Param(value = "telephone") String telephone,
							@Param(value = "email") String email,
							@Param(value = "creditCard") String creditCard,
							@Param(value = "password") String password);
	public void newAccount(
				@Param(value = "accType") String accType,
				@Param(value = "accDate") Date accDate,
				@Param(value = "customerId") String customerId
			);

	public void newCustomer();
	
	public Employee getBySSN(@Param("SSN") Integer id);
	
	public void updateCustomer(@Param(value = "customer") Customer customer);
	
	public void updatePerson(@Param(value = "customer") Customer customer);
	
	public void updateAccount(@Param(value = "account") Account account);
	
	public void processOrder(@Param(value = "order") FuegoOrder order);
	
	public void deleteFromQueue(
				@Param(value = "movieId") Integer movieId,
				@Param(value = "accountId") Integer accountId
			);
	
	public Account getAccount(@Param("email") String email);
	
	public void addEmployee(@Param("employee") Employee employee);
	
	public void editEmployee(@Param("employee") Employee employee);
	
	public void deleteEmployee(@Param("SSN") Integer SSN);
	
	
	public void addMovie(@Param("movie") Movie movie);
	
	public void editMovie(@Param("movie") Movie movie);
	
	public void deleteMovie(@Param("name") String name);
	
	public Movie getMovieByName(@Param("name") String name);
	
	public List<Account> getAllAccounts();

}
