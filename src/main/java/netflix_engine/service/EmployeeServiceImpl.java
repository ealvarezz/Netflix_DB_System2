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
import org.springframework.transaction.annotation.Transactional;

import netflix_engine.mappers.EmployeeMapper;
import netflix_engine.model.Customer;


@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;
	
	//@Autowired
	//private SqlSession sqlSession;
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	private String xmlLink = "netflix_engine/mappers/EmployeeMapper.xml";


	public List<Customer> returnMailingList(){
  	  List<Customer> customerList = employeeMapper.getMail();
  	  return customerList;
    }

    public List<Customer> getAllCustomers(){
      List<Customer> customerList = employeeMapper.getCustomers();
  	  return customerList;
    }

    public void addCustomer(Customer newCustomer) throws IOException {
    	
    	
	
		
      //InputStream inputStream = Resources.getResourceAsStream(xmlLink);
	  //SqlSessionFactory sqlSessionFactory = 
	    //      new SqlSessionFactoryBuilder().build(inputStream);
	  SqlSession session = sqlSessionFactory.openSession();
	  
	  try{
		  EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);
		  mapper.newCustomer(newCustomer.getLastName(),
			    	newCustomer.getFirstName(),
			    	newCustomer.getAddress(),
			    	newCustomer.getCity(),
			    	newCustomer.getState(),
			    	newCustomer.getZip(),
			    	newCustomer.getTelephone(),
			    	newCustomer.getEmail(),
			    	newCustomer.getCreditCard(),
			    	newCustomer.getPassword());
		  
		  session.commit();

	  } catch( Exception e ){
	   e.printStackTrace();
	  } 
	  session.close();
    }
    	
    	
    	    
}
