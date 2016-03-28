package com.hotel.web.controller.admin;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.model.User;
import com.hotel.service.UserService;
import com.hotel.web.controller.BaseAction;

@Scope("prototype")
@Controller
@RequestMapping({"/admin/user"})
public class UserAction extends BaseAction
{

	// [start] 接口引用
//	@Resource(name = "roleService")
//	private RoleService roleService; 
	
	@Resource(name = "userService")
	private UserService userService; 

//	  @Resource(name="resourceService")
//	  private ResourceService resourceService;
//	  
//	  @Resource(name="organService")
//	  private OrganService organService;
//	  
//	  @Resource(name="faultService")
//	  private FaultService faultService;
//	  
//	  @Resource(name="logService")
//	  private LogService logService;
//	  
//	  @Resource(name="openstackService")
//	  private OpenstackService openstackService;
	  
	  
	// [end]
	
	// [started]
	/**
	 * 系统用户管理
	 *  
	 * @param request
	 * @param response
	 * @return 
	 */
	@RequestMapping(value = "/userList.do")
	public String userList(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		if (user.getPageNo() == null){
			user.setPageNo(1);
		}
		if (user.getPageSize() == null){
			user.setPageSize(10);
		}
		String temp = user.getSearchName();
		if (temp != null){
			temp = new String(temp.getBytes("ISO-8859-1"), "UTF-8");
			user.setSearchName("%"+temp+"%");
		}
		user.setOrgId(4);
		user.setTotalCount(userService.countUsers(user));
		request.getSession().setAttribute("users", userService.getUsers(user));
		user.setSearchName(temp);
		request.getSession().setAttribute("pageUser", user);
		return "web/admin/user/userList";
	}
	
	@RequestMapping(value = "/userInfo.do")
	public String userInfo(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		User u = new User();
		if(user.getId() == null || user.getId().intValue() == 0){
			u.setId(0);
			//u.setDescription("");
			u.setName("");
		}else{
			u = userService.getUserById(user.getId());
		}
		request.getSession().setAttribute("u", u);
		return "web/admin/user/userInfo";
	}
	/**
	 * 根据OrganId获取用户列表,返回json对象，包括状态值
	 * @param organId
	 * @param request
	 * @param response
	 * @return
	 */
//	@ResponseBody
//	@RequestMapping(value = "/jsonLoadUserListByOrganId.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
//	public JsonResult<User> jsonLoadUserListByOrganId(
//			User user,
//			@RequestParam(value = "organId", required = false) Integer organId,
//			HttpServletRequest request, HttpServletResponse response) {
//		JsonResult<User> js = new JsonResult<User>();
//		js.setCode(new Integer(1));
//		js.setMessage("获取数据失败!"); 
//		if(organId>1){
//			user.setOrgId(organId);
//		}
//		user.setUserType(1);
//		if (user.getPageNo() == null)
//			user.setPageNo(1);
//		user.setPageSize(Constants.DEFAULT_PAGE_SIZE);
//		try{
//			List<User> lc = userService.getUserList(user);
//			int totalCount = userService.getUserListCount(user); 
//			user.setTotalCount(totalCount);
//			js.setObj(user); 
//			js.setCode(0);
//			js.setList(lc); 
//			js.setMessage("获取数据成功!");
//		}
//		catch(Exception ex){
//			ex.printStackTrace();
//		}
//		return js;
//	}
	/**
	 * 根据OrganId获取用户列表,返回list对象,用于下拉列表显示
	 * @param organId
	 * @param request
	 * @param response
	 * @return
	 */
//	@ResponseBody
//	@RequestMapping(value = "/jsonLoadUserListByOrgId.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
//	public List<User> jsonLoadUserListByOrgId( 
//			User user,
//			@RequestParam(value = "organId", required = false) Integer organId,
//			HttpServletRequest request, HttpServletResponse response) {
//		List<User> list = new ArrayList<User>(); 
//		if(organId>1){
//			user.setOrgId(organId);
//		} 
//		try{
//			list = userService.getUserList(user); 
//		}
//		catch(Exception ex){
//			ex.printStackTrace();
//		}
//		return list;
//	}
	/**
	 * 系统用户管理--新增/编辑
	 *  
	 * @param request
	 * @param response
	 * @return 
	 */
//	@RequestMapping(value = "/userInfo.do")
//	public String UserAdd(
//			@RequestParam(value = "userId", required = true) Integer userId,
//			HttpServletRequest request, HttpServletResponse response){ 
//
//		User u = this.getLoginUser();
//		User user =  new User();
//		user.setId(userId);
//		List<Role> list = roleService.getRoleList(new Role());
//		if(userId>0){
//			user = userService.getUserById(userId); 
//		} else{
//			int roleId = 0;
//			roleId = list.get(0).getId();
//			user.setSex((byte) 0);
//			user.setRoleId(roleId);
//			user.setUserType(1);
//		}
//		request.setAttribute("user", u); 
//		request.setAttribute("userInfo", user);  
//		request.setAttribute("roleList", list);  
//		return "web/admin/user/userInfo";
//	} 
	/**
	 * 组织机构管理 
	 * 
	 * @param organ
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
//	@RequestMapping(value = "/organList.do", method = RequestMethod.GET, produces = { "text/html;charset=UTF-8" })
//	public String OrganInit(
//			Organ organ,
//			HttpServletRequest request, 
//			@RequestParam(value = "organId", required = false) Integer organId,
//			HttpServletResponse response) throws UnsupportedEncodingException {
//		if (organ.getSearchName() != null
//				&& organ.getSearchName().length() > 0) {
//			String searchName = new String(organ.getSearchName().getBytes(
//					"iso8859-1"), "utf-8");
//			organ.setSearchName(searchName);
//		}
//		if (organId != null) {
//			organ.setId(organId);
//		}
//		//organ.setParentId(1);
//		if (organ.getPageNo() == null)
//			organ.setPageNo(1);
//		organ.setPageSize(Constants.DEFAULT_PAGE_SIZE);
//
//		List<Organ> list = organService.getOrganList(organ);
//		int totalCount = organService.getOrganListCount(organ);
//		organ.setTotalCount(totalCount);
//		request.setAttribute("organ", organ);
//		request.setAttribute("organList", list);
//
//		return "web/admin/user/organList";
//	}
	/**
	 * 显示所有机构，按照树形结构显示
	 * 
	 * @param organ
	 * @param request
	 * @param response
	 * @return
	 */
//	@ResponseBody
//	@RequestMapping(value = "/jsonLoadOrganParent.do")
//	public List<Organ> getOrganParent(
//			@RequestParam(value = "rootId", required = false) Integer rootId,
//			@RequestParam(value = "id", required = false) String pid,
//			HttpServletRequest request, HttpServletResponse response) {
//		Integer parentId = null;
//		Organ organ = new Organ();
//		if (pid != null && !pid.equals("")) {
//			parentId = new Integer(pid);
//		} else {
//			parentId = rootId;
//		}
//		organ.setParentId(parentId);
//		List<Organ> list = new ArrayList<Organ>();
//		list = organService.getOrganListByParentId(organ);
//		for (Organ c : list) {
//			c.setText(c.getName());
//			Organ c1 = new Organ();
//			c1.setParentId(c.getId());
//			List<Organ> ls = organService.getOrganListByParentId(c1);
//			if (ls.size() > 0) {
//				ls = setChildren(ls);
//				c.setChildren(ls);
//				c.setState("open");
//			} else {
//				c.setChildren(new ArrayList<Organ>());
//				c.setState("open");
//			}
//		}
//		return list;// json.toString();
//	}

//	private List<Organ> setChildren(List<Organ> ls) {
//		// TODO Auto-generated method stub
//		for (Organ c : ls) {
//			c.setText(c.getName());
//			Organ c1 = new Organ();
//			c1.setParentId(c.getId());
//			List<Organ> lst = organService.getOrganListByParentId(c1);
//			if (lst.size() > 0) {
//				lst = setChildren(lst);
//				c.setChildren(lst);
//				c.setState("open");
//			} else {
//				c.setChildren(new ArrayList<Organ>());
//				c.setState("open");
//			}
//		}
//		return ls;// json.toString();
//	}
	/**
	 * 根据ParentId获取机构列表
	 * @param company
	 * @param request
	 * @param response
	 * @return
	 */
//	@ResponseBody
//	@RequestMapping(value = "/jsonLoadOrganListByParentId.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
//	public JsonResult<Organ> jsonLoadOrganListByParentId(
//			@RequestParam(value = "parentId", required = false) Integer parentId,
//			HttpServletRequest request, HttpServletResponse response) {
//		JsonResult<Organ> js = new JsonResult<Organ>();
//		js.setCode(new Integer(1));
//		js.setMessage("获取数据失败!");
//		Organ organ = new Organ(); 
//			organ.setParentId(parentId); 
//		if (organ.getPageNo() == null)
//			organ.setPageNo(1);
//		organ.setPageSize(Constants.DEFAULT_PAGE_SIZE);
//		try{
//			List<Organ> lc = organService.getOrganList(organ);
//			int totalCount = organService.getOrganListCount(organ);
//			for(Organ c : lc){
//				if(c.getParentName()==null){
//					c.setParentName("");
//				}
//			}
//			organ.setTotalCount(totalCount);
//			js.setObj(organ); 
//			js.setCode(0);
//			js.setList(lc); 
//			js.setMessage("获取数据成功!");
//		}
//		catch(Exception ex){
//			ex.printStackTrace();
//		}
//		return js;
//	}
	/**
	 * 系统角色管理--新增
	 *  
	 * @param request
	 * @param response
	 * @return 
	 */
//	@RequestMapping(value = "/organInfo.do")
//	public String OrganAdd(
//			@RequestParam(value = "organId", required = true) Integer organId,
//			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
//
//		User u = this.getLoginUser();
//		Organ organ =  new Organ();
//		organ.setId(organId);
//		if(organId>0){
//			organ = organService.getOrganById(organId); 
//		} 
//		request.setAttribute("user", u); 
//		request.setAttribute("organ", organ);  
//		return "web/admin/user/organInfo";
//	} 
	/**
	 * 系统角色管理
	 *  
	 * @param request
	 * @param response
	 * @return 
	 */
//	@RequestMapping(value = "/roleList.do")
//	public String RoleInit(
//			Role role,
//			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
//		if(role.getSearchName()!=null&&role.getSearchName().length()>0){
//			String searchName =  new String(role.getSearchName().getBytes("iso8859-1"), "utf-8");  
//			role.setSearchName(searchName); 
//		}
//		if (role.getPageNo() == null)
//			role.setPageNo(1);
//		role.setPageSize(Constants.DEFAULT_PAGE_SIZE);
//		List<Role> list = roleService.getRoleList(role);
//		int totalCount = roleService.getRoleListCount(role);
//		role.setTotalCount(totalCount);
//		User u = this.getLoginUser();
//		request.setAttribute("user", u); 
//		request.setAttribute("role", role); 
//		request.setAttribute("roleList", list); 
//		return "web/admin/user/roleList";
//	}
	
	/**
	 * 系统角色管理--新增
	 *  
	 * @param request
	 * @param response
	 * @return 
	 */
//	@RequestMapping(value = "/roleAdd.do")
//	public String RoleAdd(
//			@RequestParam(value = "roleId", required = true) Integer roleId,
//			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
//
//		User u = this.getLoginUser();
//		Role role =  new Role();
//		role.setId(roleId);
//		if(roleId>0){
//			role = roleService.getRoleById(roleId); 
//		}
//		List<ResourceConfig> list = resourceService.getResource(1);
//		request.setAttribute("user", u); 
//		request.setAttribute("role", role); 
//		request.setAttribute("resourceList", list); 
//		return "web/admin/user/roleAdd";
//	} 
	/**
	 * 系统日志管理
	 *  
	 * @param request
	 * @param response
	 * @return 
	 */
//	@RequestMapping(value = "/logList.do")
//	public String LogInit(
//			Log log,
//			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
//		if(log.getSearchName()!=null&&log.getSearchName().length()>0){
//			String searchName =  new String(log.getSearchName().getBytes("iso8859-1"), "utf-8");  
//			log.setSearchName(searchName); 
//		}
//		if (log.getPageNo() == null)
//			log.setPageNo(1);
//		log.setPageSize(Constants.DEFAULT_PAGE_SIZE);
//		List<Log> list = logService.getLogList(log);
//		int totalCount = logService.getLogListCount(log);
//		log.setTotalCount(totalCount);
//		User u = this.getLoginUser();
//		request.setAttribute("user", u); 
//		request.setAttribute("logInfo", log); 
//		request.setAttribute("logList", list); 
//		return "web/admin/user/logList";
//	}
	/**
	 * 故障现象管理
	 * @param role
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
//	@RequestMapping(value = "/faultList.do")
//	public String FaultInit(
//			Fault fault,
//			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
//		if(fault.getSearchName()!=null&&fault.getSearchName().length()>0){
//			String searchName =  new String(fault.getSearchName().getBytes("iso8859-1"), "utf-8");  
//			fault.setSearchName(searchName); 
//		}
//		if (fault.getPageNo() == null)
//			fault.setPageNo(1);
//		fault.setPageSize(Constants.DEFAULT_PAGE_SIZE);
//		List<Fault> list = faultService.getFaultList(fault);
//		int totalCount = faultService.getFaultListCount(fault);
//		fault.setTotalCount(totalCount);
//		User u = this.getLoginUser();
//		request.setAttribute("user", u); 
//		request.setAttribute("fault", fault); 
//		request.setAttribute("faultList", list); 
//		return "web/admin/user/faultList";
//	}
	/**
	 * 故障现象管理
	 * @param role
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
//	@RequestMapping(value = "/faultInfo.do")
//	public String FaultInfoInit(
//			@RequestParam(value = "faultId", required = true) Integer faultId,
//			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
//
//		User u = this.getLoginUser();
//		Fault fault =  new Fault();
//		fault.setId(faultId);
//		if(faultId>0){
//			fault = faultService.getFaultById(faultId); 
//		}
//		request.setAttribute("user", u); 
//		request.setAttribute("fault", fault); 
//		return "web/admin/user/faultInfo";
//	}
//	@ResponseBody
//	@RequestMapping(value = "/jsonSaveOrUpdateFault.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
//	public JsonResult<Fault> saveOrupdateFault(
//			Fault fault,
//			HttpServletRequest request,
//			HttpServletResponse response) {
//		JsonResult<Fault> js = new JsonResult<Fault>();
//		js.setCode(new Integer(1));
//		js.setMessage("保存失败!");
//		try{
//			faultService.saveOrUpdateFault(fault);
//			js.setCode(new Integer(0));
//			js.setMessage("保存成功!");
//			//日志
//			User u = this.getLoginUser();
//			int type = u.getUserType();
//			if(fault.getId()>0){
//				logService.saveLog(u, u.getName()+"修改了故障现象："+fault.getFault(), IpUtil.getIp(request), (byte)type, (byte)1);
//			}else{
//				logService.saveLog(u, u.getName()+"新增了故障现象："+fault.getFault(), IpUtil.getIp(request), (byte)type, (byte)1);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return js;
//	}
	/**
	 * 注册用户管理
	 *  
	 * @param request
	 * @param response
	 * @return 
	 */
//	@RequestMapping(value = "/customerList.do")
//	public String CustomerInit(
//			User user,
//			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
//		if(user.getSearchName()!=null&&user.getSearchName().length()>0){
//			String searchName =  new String(user.getSearchName().getBytes("iso8859-1"), "utf-8");  
//			user.setSearchName(searchName); 
//		}
//		if (user.getPageNo() == null)
//			user.setPageNo(1);
//		user.setPageSize(Constants.DEFAULT_PAGE_SIZE);
//		List<User> list = new ArrayList<User>();
//		int totalCount = 0;
//		user.setTotalCount(totalCount);
//		User u = this.getLoginUser();
//		request.setAttribute("user", u); 
//		request.setAttribute("customer", user); 
//		request.setAttribute("userList", list); 
//		return "web/admin/customer/customerList";
//	}
	/**
	 * 注册用户消息管理
	 *  
	 * @param request
	 * @param response
	 * @return 
	 */
//	@RequestMapping(value = "/messageList.do")
//	public String MessageInit(
//			User user,
//			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
//		if(user.getSearchName()!=null&&user.getSearchName().length()>0){
//			String searchName =  new String(user.getSearchName().getBytes("iso8859-1"), "utf-8");  
//			user.setSearchName(searchName); 
//		}
//		if (user.getPageNo() == null)
//			user.setPageNo(1);
//		user.setPageSize(Constants.DEFAULT_PAGE_SIZE);
//		List<User> list = new ArrayList<User>();
//		int totalCount = 0;
//		user.setTotalCount(totalCount);
//		User u = this.getLoginUser();
//		request.setAttribute("user", u); 
//		request.setAttribute("message", user); 
//		request.setAttribute("userList", list); 
//		return "web/admin/customer/messageList";
//	}
	// [end]
	
	// [start] 模块逻辑处理
	
		/**
		 * 新增或保存用户
		 * 
		 * @param role
		 * @param request
		 * @param response
		 * @return
		 */
//		@ResponseBody
//		@RequestMapping(value = "/jsonSaveOrUpdateUser.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
//		public JsonResult<User> jsonSaveOrUpdateUser(
//				User user, HttpServletRequest request,
//				HttpServletResponse response) {
//			JsonResult<User> js = new JsonResult<User>();
//			js.setCode(new Integer(1));
//			js.setMessage("保存失败!");
////			User sessionUser = this.getLoginUser();
//			User existuser = new User();
//			existuser.setUserType(user.getUserType());
////			boolean isInsert = false;
//			String password = user.getPassword();
//			try {
//				if (user.getId() == null || user.getId() == 0) {
////					isInsert = true;
//					existuser.setAccount(user.getAccount()); 
//					List<User> user1 = userService.getExistUser(existuser);
//					if(user1.size()>0){
//						js.setMessage("用户账号已存在!");
//						return js;
//					}
//					User u = EndecryptUtils.md5Password(user.getAccount(), user.getPassword());
//					if (u != null) {
//						user.setPassword(u.getPassword());
//						user.setSalt(u.getSalt());
//					}
//					user.setRegisterTime(new Date());
//					user.setFlag(1);
//				}else{
//					existuser.setAccount(user.getAccount());
//					existuser.setId(user.getId());
//					List<User> user1 = userService.getExistUser(existuser);
//					if(user1.size()>0){
//						js.setMessage("用户账号已存在!");
//						return js;
//					}
//					User u = userService.getUserById(user.getId());
//					if( u!= null){
//						user.setPassword(u.getPassword());
//						user.setSalt(u.getSalt());
//						user.setRegisterTime(u.getRegisterTime());
//						user.setFlag(1);
//					}
//				} 
//				userService.saveUser(user); 
//				//if(isInsert){
//					User osUser = openstackService.createOSUser(user, password);
//					//if(osUser != null){
//					//ogService.saveLog(sessionUser, sessionUser.getName()+"修改了用户："+sessionUser.getName(), IpUtil.getIp(request), (byte)type, (byte)1);
//				//}*/
//				js.setCode(new Integer(0));
//				js.setMessage("保存成功!");
//				//日志
//				User u = this.getLoginUser();
//				int type = u.getUserType();
//				if(user.getId()>0){
//					logService.saveLog(u, u.getName()+"修改了用户："+user.getName(), IpUtil.getIp(request), (byte)type, (byte)1);
//				}else{
//					logService.saveLog(u, u.getName()+"新增了用户："+user.getName(), IpUtil.getIp(request), (byte)type, (byte)1);
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			return js;
//		}
	/**
	 * 新增或保存juese
	 * 
	 * @param role
	 * @param request
	 * @param response
	 * @return
	 */
//	@ResponseBody
//	@RequestMapping(value = "/jsonSaveOrUpdateRole.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
//	public JsonResult<Role> saveOrupdateCompany(
//			Role role, HttpServletRequest request,
//			HttpServletResponse response) {
//		JsonResult<Role> js = new JsonResult<Role>();
//		js.setCode(new Integer(1));
//		js.setMessage("保存失败!");
//		Role existrole = new Role();
//		try {
//			if (role.getId() == null || role.getId() == 0) {
//				
//				existrole.setName(role.getName()); 
//				List<Role> role1 = roleService.getExistRole(existrole);
//				if(role1.size()>0){
//					js.setMessage("角色名称已存在!");
//					return js;
//				}
//			}else{
//				existrole.setName(role.getName());
//				existrole.setId(role.getId());
//				List<Role> role1 = roleService.getExistRole(existrole);
//				if(role1.size()>0){
//					js.setMessage("角色名称已存在!");
//					return js;
//				}
//			}  
//			roleService.saveRole(role);
//			js.setCode(new Integer(0));
//			js.setMessage("保存成功!");
//			//日志
//			User u = this.getLoginUser();
//			int type = u.getUserType();
//			if(role.getId()>0){
//				logService.saveLog(u, u.getName()+"修改了角色："+role.getName(), IpUtil.getIp(request), (byte)type, (byte)1);
//			}else{
//				logService.saveLog(u, u.getName()+"新增了角色："+role.getName(), IpUtil.getIp(request), (byte)type, (byte)1);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return js;
//	}
//	/**
//	 * 新增或保存机构
//	 * 
//	 * @param organ
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@ResponseBody
//	@RequestMapping(value = "/jsonSaveOrUpdateOrgan.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
//	public JsonResult<Organ> saveOrupdateOrgan(
//			Organ organ, HttpServletRequest request,
//			HttpServletResponse response) {
//		JsonResult<Organ> js = new JsonResult<Organ>();
//		js.setCode(new Integer(1));
//		js.setMessage("保存失败!");
//		Organ existorgan = new Organ();
//		try {
//			if (organ.getId() == null || organ.getId() == 0) {
//				Organ pOrgan = new Organ();
//				int level = 1;
//				if(organ.getParentId()>0){
//					pOrgan = organService.getOrganById(organ.getParentId());
//					level = pOrgan.getLevel()+1;
//				}
//				existorgan.setName(organ.getName()); 
//				List<Organ> organ1 = organService.getExistOrgan(existorgan);
//				if(organ1.size()>0){
//					js.setMessage("机构名称已存在!");
//					return js;
//				}
//				organ.setPath(organ.getParentId().toString());
//				organ.setLeaf(true);
//				organ.setLevel(level);
//				/*更改上级机构的leaf*/
//				Organ p_org = new Organ();
//				p_org.setId(organ.getParentId());
//				p_org.setLeaf(false);
//				organService.updateOrgan(p_org);
//			}else{
//				existorgan.setName(organ.getName());
//				existorgan.setId(organ.getId());
//				List<Organ> organ1 = organService.getExistOrgan(existorgan);
//				if(organ1.size()>0){
//					js.setMessage("机构名称已存在!");
//					return js;
//				} 
//			}  
//			organService.saveOrgan(organ);
//			js.setCode(new Integer(0));
//			js.setMessage("保存成功!");
//			//日志
//			User u = this.getLoginUser();
//			int type = u.getUserType();
//			if(organ.getId()>0){
//				logService.saveLog(u, u.getName()+"修改了机构："+organ.getName(), IpUtil.getIp(request), (byte)type, (byte)1);
//			}else{
//				logService.saveLog(u, u.getName()+"新增了机构："+organ.getName(), IpUtil.getIp(request), (byte)type, (byte)1);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return js;
//	}
//	
//	/**
//	 * 新增或保存juese
//	 * 
//	 * @param role
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@ResponseBody
//	@RequestMapping(value = "/jsonUpdateUserFlag.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
//	public JsonResult<User> updateUserFlag(
//			User user, HttpServletRequest request,
//			HttpServletResponse response) {
//		JsonResult<User> js = new JsonResult<User>();
//		js.setCode(new Integer(1));
//		js.setMessage("操作失败!");
//		User existuser = new User();
//		//参数判断
//		if (user.getId() == null || user.getId() == 0 || user.getFlag() == null) {
//			js.setMessage("参数不完整!");
//			return js;
//		}
//		existuser.setId(user.getId());
//		existuser.setFlag(user.getFlag());
//		int res = 0;
//		try {
//			res = userService.updateByPrimaryKeySelective(existuser);
//			existuser = userService.getUserById(existuser.getId());
//			boolean enabled = user.getFlag()==1?true:false;
//			openstackService.enableOSUser(existuser.getOsUserSn(), enabled);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		if(res > 0){
//			js.setCode(new Integer(0));
//			js.setMessage("操作成功!");
//			//日志
//			User u = this.getLoginUser();
//			int type = u.getUserType();
//			String op = "启用";
//			if(user.getFlag().intValue() == 0){
//				op = "禁用";
//			}
//			try {
//				logService.saveLog(u, u.getName()+op+"了用户："+user.getName(), IpUtil.getIp(request), (byte)type, (byte)1);
//			} catch (Exception e) {
//				// TODO: handle exception
//				e.printStackTrace();
//			}
//		}
//		return js;
//	}
	
 	// [end]
}
