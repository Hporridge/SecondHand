package ahualy.neepu.dao;


import ahualy.neepu.bean.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {

	int addUser(User user);
	
	int deleteUserById(int id);
	
	int updateUserById(User user);

	User queryUserById(int id);

	User queryUserBy(String email);

	List<User> queryUserList();
}
