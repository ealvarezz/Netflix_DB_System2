package netflix_engine.service;

import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import netflix_engine.mappers.EmployeeMapper;
import netflix_engine.model.Account;
import netflix_engine.model.Customer;
import netflix_engine.model.Employee;
import netflix_engine.model.FuegoOrder;
import netflix_engine.model.Movie;


@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;




	@Autowired
	private PlatformTransactionManager txManager;


	public List<Customer> returnMailingList(){
  	  List<Customer> customerList = employeeMapper.getMail();
  	  return customerList;
    }

    public List<Customer> getAllCustomers(){
      List<Customer> customerList = employeeMapper.getCustomers();
  	  return customerList;
    }

    public void addCustomer(Customer newCustomer) throws IOException {

    	TransactionStatus status = getStatus();

	  try{
		  employeeMapper.newCustomer(newCustomer.getLastName(),
			    	newCustomer.getFirstName(),
			    	newCustomer.getAddress(),
			    	newCustomer.getCity(),
			    	newCustomer.getState(),
			    	newCustomer.getZip(),
			    	newCustomer.getTelephone(),
			    	newCustomer.getEmail(),
			    	newCustomer.getCreditCard(),
			    	newCustomer.getPassword());

		  

	  } catch( Exception e ){
		  txManager.rollback(status);
		  e.printStackTrace();
	  }
	  
	  txManager.commit(status);
    }


    public Employee getEmployeeBySSN(int ssn){


    	return employeeMapper.getBySSN(ssn);
    }


	public void addCustomerAccount(Account newAccount) throws Exception {

		TransactionStatus status = getStatus();

		  try{
			  
			  employeeMapper.newAccount(
					  newAccount.getAcctType(),
					  newAccount.getAccountDate(),
					  newAccount.getCustomer().getEmail()
			  );

			 

		  } catch( Exception e ){
			  txManager.rollback(status);
		   e.printStackTrace();
		  }
		  txManager.commit(status);
		
	}
	
	private TransactionStatus getStatus(){
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		
		return txManager.getTransaction(def);
	}

	
	public void updateCustomerSettings(Account account) throws Exception {
		
		Integer personId = employeeMapper.getCustomerById(account.getCustomer().getEmail()).getPersonID();
		account.getCustomer().setPersonID(personId);
		
		TransactionStatus status = getStatus();

		  try{
			  
			  employeeMapper.updatePerson(account.getCustomer());
			  employeeMapper.updateCustomer(account.getCustomer());
			  employeeMapper.updateAccount(account);
			  
		  } catch( Exception e ){
			  txManager.rollback(status);
			  e.printStackTrace();
		  }
		  txManager.commit(status);
	}

	
	public void processCustomerOrder(FuegoOrder order) throws Exception {
		
		Integer accountNumber = employeeMapper.getAccount(order.getCustomerId()).getAcctNum();
		
		TransactionStatus status = getStatus();

		  try{
			  
			  employeeMapper.deleteFromQueue(order.getMovieId(), accountNumber);
			  employeeMapper.processOrder(order);
			  
			  
		  } catch( Exception e ){
			  txManager.rollback(status);
			  e.printStackTrace();
		  }
		  txManager.commit(status);
	}


	public void addMovieToDb(Movie movie) throws Exception {
		TransactionStatus status = getStatus();

		  try{
			  
			  employeeMapper.addMovie(movie);
			  
			  
		  } catch( Exception e ){
			  txManager.rollback(status);
			  e.printStackTrace();
		  }
		  txManager.commit(status);
		
	}


	public void editMovieInDb(Movie movie) throws Exception {
		TransactionStatus status = getStatus();

		  try{
			  
			  employeeMapper.editMovie(movie);
			  
			  
		  } catch( Exception e ){
			  txManager.rollback(status);
			  e.printStackTrace();
		  }
		  txManager.commit(status);
		
	}


	public void deleteMovieFromDb(String movieName) throws Exception {
		TransactionStatus status = getStatus();

		  try{
			  
			  employeeMapper.deleteMovie(movieName);
			  
			  
		  } catch( Exception e ){
			  txManager.rollback(status);
			  e.printStackTrace();
		  }
		  txManager.commit(status);
		
	}


	public void addEmployeeToDb(Employee employee) throws Exception {
		TransactionStatus status = getStatus();

		  try{
			  
			  
			  employeeMapper.addEmployee(employee);
			  
		  } catch( Exception e ){
			  txManager.rollback(status);
			  e.printStackTrace();
		  }
		  txManager.commit(status);
		
	}


	public void editEmployeeInDb(Employee employee) throws Exception {
		TransactionStatus status = getStatus();

		  try{
			  
			  employeeMapper.editEmployee(employee);
			  
			  
		  } catch( Exception e ){
			  txManager.rollback(status);
			  e.printStackTrace();
		  }
		  txManager.commit(status);
		
	}


	public void deteleEmployeeFromDb(Integer ssn) throws Exception {
		TransactionStatus status = getStatus();

		  try{
			  
			  employeeMapper.deleteEmployee(ssn);
			  
			  
		  } catch( Exception e ){
			  txManager.rollback(status);
			  e.printStackTrace();
		  }
		  txManager.commit(status);
		
	}


	public Movie getMovieByMoviename(String name) {
		
		return employeeMapper.getMovieByName(name);
	}

	
	public List<Account> getAllCustomerAccounts() {
		
		
		return employeeMapper.getAllAccounts();
	}

	
	public List<Movie> getAllCurrentMovies() {
		
		return employeeMapper.getAllMovies();
	}


	public List<Movie> getMostActiveMovies(int limit) {
		
		
		return employeeMapper.getActiveMovies(limit);
	}


	public List<Customer> getMostActiveUsers(int limit) {
		
		
		return employeeMapper.getActiveUsers(limit);
	}


	public List<Employee> getEmployeeList() {
		
		
		return employeeMapper.getAllEmployees();
	}


	public Employee getMostActiveEmployee() {
		
		return employeeMapper.getActiveEmployee();
	}


	public List<Customer> produceMailingList() {
		
		
		return employeeMapper.getMailingList();
	}


	public List<FuegoOrder> getAllOrdersByName(String name) {
		
		
		return employeeMapper.getOrdersByName(name);
	}


	public List<FuegoOrder> getAllOrdersBytype(String type) {
		
		
		return employeeMapper.getOrdersByType(type);
	}


	public List<FuegoOrder> getAllOrdersByCustomerName(String firstName, String lastName) {
		
		
		return employeeMapper.getOrdersByCustomerName(firstName, lastName);
	}
	
	
}
