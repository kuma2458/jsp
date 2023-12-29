package controller;

import dao.StudentDAO;

public class HandlerMapping {
	private static HandlerMapping instance= new HandlerMapping();
	
	private HandlerMapping() {}

	public static HandlerMapping getInstance() {
		if(instance==null)
			instance=new HandlerMapping();
		return instance;
		
	}

	public Controller createController(String command) {
		Controller controller = null;
		
		switch(command) {
			case "login.do":
				controller=new LoginController();
				break;
			case "main.do":
				controller=new MainController();
				break;
			case "registerStudentView.do":
				controller=new StudentRegisterViewController();
				break;	
			case "studentRegister.do":
				controller=new StudentRegisterController();
				break;	
			case "deleteStudent.do":
				controller=new StudentDeleteController();
				break;
			case "updateView.do":
				controller=new StudentUpdateViewController();
				break;	
			case "studentUpdate.do":
				controller=new StudentUpdateController();
				break;	
			case "logout.do":
				controller=new LogoutController();
				break;	
			case "majorMain.do":
				controller=new MajorMainController();
				break;	
			case "majorInsert.do":
				controller=new MajorInsertController();
				break;
			case "majorUpdate.do":
				controller=new MajorUpdateController();
				break;
			case "majorDelete.do":
				controller=new MajorDeleteController();
				break;
				
		}
		
		return controller;
	
	}
	
	
}
