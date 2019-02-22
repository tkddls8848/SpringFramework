package com.kitri.project.security.user;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class UserDTO extends User{
	
	private String userid;
	public UserDTO(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities, String memID) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		this.userid=memID;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String memID) {
		this.userid = memID;
	}

	@Override
	public String toString() {
		return "UserDTO [Userid=" + userid + "]";
	}
	
}
