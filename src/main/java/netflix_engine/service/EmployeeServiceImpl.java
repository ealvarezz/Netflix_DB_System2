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


@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;

	//@Autowired
	//private SqlSession sqlSession;


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

}
