package ejb_local_package;

import java.util.List;

import interface_package.IUserServices;

import javax.ejb.Local;

import dto_package.UserDTO;


@Local
public interface IUserServicesLocal extends IUserServices{

	

}
