package netflix_engine.mappers;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import netflix_engine.model.Account;
import netflix_engine.model.Customer;
import netflix_engine.model.Employee;


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
	
	public Employee getBySSN(@Param("SSN") int id);
	
	public void updateCustomer(@Param(value = "customer") Customer customer);
	
	public void updatePerson(@Param(value = "customer") Customer customer);
	
	public void updateAccount(@Param(value = "account") Account account);

}
