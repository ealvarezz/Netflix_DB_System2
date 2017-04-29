package netflix_engine.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import netflix_engine.model.Customer;
import netflix_engine.model.Employee;


public interface EmployeeMapper {
	public List<Customer> getMail();
	public List<Customer> getCustomers();
	public void newCustomer();
	public Employee getBySSN(@Param("SSN") int id);
}
