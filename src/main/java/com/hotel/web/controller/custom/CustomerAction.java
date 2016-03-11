package com.hotel.web.controller.custom;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.web.controller.BaseAction;

/**
 * 个人中心逻辑控制器
 * 
 * @author liqiang
 * @update liqiang
 *
 */
@Scope("prototype")
@Controller
@RequestMapping("/customer/user")
public class CustomerAction extends BaseAction{
	
//	@Resource(name = "customerService")
//	private CustomerService customerService;
//
//	@Resource(name = "configService")
//	private ConfigService configService; 
//	
//	@Resource(name = "orderService")
//	private OrderService orderService;  
//	
//	@Resource(name = "vmOrderService")
//	private VMOrderService vmOrderService;  
//	
//	@Resource(name = "logService")
//	private LogService logService; 
//
//	@Resource(name = "openstackService")
//	private OpenstackService openstackService; 
//
//	@Resource(name = "orderSerialService")
//	private OrderSerialNoService orderSerialService; 
//	
//	@Resource(name = "userService")
//	private UserService userService;
//	/**
//	 * 虚拟机管理
//	 *  
//	 * @param request
//	 * @param response
//	 * @return 
//	 */
//	@RequestMapping(value = "/vmwareList.do")
//	public String VMWareInit(
//			OSServerVM osvm,
//			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
//		if (osvm.getPageNo() == null)
//			osvm.setPageNo(1);
//		osvm.setPageSize(Constants.DEFAULT_PAGE_SIZE);
//		User user = this.getLoginUser(); 
//		VMOrder order = new VMOrder();
//		order.setUserId(user.getId());
//		List<VMOrder> orderlist = vmOrderService.getVMOrderList(order);
//		List<String> serverIdList = new ArrayList<String>();
//		for(VMOrder o : orderlist){
//			if(o.getVmUuid()!=null&&o.getVmUuid().length()>0){
//				serverIdList.add(o.getVmUuid());
//			}
//		}
//		List<? extends Server> serverlist =  openstackService.getOSServerList(user,serverIdList);
//		List<OSServerVM> list = new ArrayList<OSServerVM>();
//		int totalCount = 0;
//
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		if(null != serverlist){
//			totalCount = serverlist.size();
//			for(Server osServer :serverlist){
//				if(osServer != null){
//					OSServerVM server = new OSServerVM();
//					server.setId(osServer.getId());
//					if(osServer.getStatus()!=null){
//						server.setStatus(osServer.getStatus().name());
//					}
//					if(osServer.getCreated()!=null){
//						server.setCreated(sdf.format(osServer.getCreated()));
//					}
//					if(osServer.getUpdated()!=null){
//						server.setUpdated(sdf.format(osServer.getUpdated()));
//					}
//					server.setName(osServer.getName());
//					if(osServer.getImage()!=null){
//						server.setImageId(osServer.getImage().getId());
//					}
//					server.setTenantId(osServer.getTenantId()); 
//					if( osServer.getAddresses()!=null){
//						if(osServer.getAddresses().getAddresses()!=null){
//							List<? extends Address> ipList = osServer.getAddresses().getAddresses().get("private");
//							if(ipList!=null){
//								if(ipList.size()>0){
//									server.setMacaddr(ipList.get(0).getMacAddr());
//									for(Address a :ipList){
//										if(a.getType().equals("fixed")){
//											server.setIpv4(a.getAddr());
//										}else if(a.getType().equals("floating")){
//											server.setIpv6(a.getAddr());
//										}
//									} 
//								}
//							}
//						}
//					}
//					list.add(server);
//				}
//			} 
//		}
//		osvm.setTotalCount(totalCount); 
//
//		request.setAttribute("user", user); 
//		request.setAttribute("OSServerVM", osvm); 
//		request.setAttribute("OSServerList", list);
//		return "web/customer/vmware/vmwareList";
//	}	
//	/**
//	 * 订单管理
//	 *  
//	 * @param request
//	 * @param response
//	 * @return 
//	 */
//	@RequestMapping(value = "/orderList.do")
//	public String OrderInit(
//			VMOrder order,
//			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
//		if(order.getSearchName()!=null&&order.getSearchName().length()>0){
//			String searchName =  new String(order.getSearchName().getBytes("iso8859-1"), "utf-8");  
//			order.setSearchName(searchName); 
//		}  
//		if (order.getPageNo() == null)
//			order.setPageNo(1);
//		User u = this.getLoginUser();
//		order.setPageSize(Constants.DEFAULT_PAGE_SIZE); 
//		order.setType(2);
//		order.setState((byte) 0);//加载所有订单
//		order.setUserId(u.getId());
//		List<VMOrder> list = vmOrderService.getVMOrderList(order);
//		int totalCount = vmOrderService.getVMOrderListCount(order);
//		order.setTotalCount(totalCount); 
//		request.setAttribute("user", u); 
//		request.setAttribute("OrderList", list);
//		request.setAttribute("order", order);
//		return "web/customer/order/orderList";
//	}
//
//	/**
//	 * 新建订单、虚拟机
//	 *  
//	 * @param request
//	 * @param response
//	 * @return 
//	 */
//	@RequestMapping(value = "/vmwareAdd.do")
//	public String VMWareAdd(
//			@RequestParam(value = "orderId", required = false) Integer orderId,
//			HttpServletRequest request, HttpServletResponse response){  
//		User u = this.getLoginUser();
//		ItemConfig cpuConfig = configService.getItemConfigByKey("CPU"); 
//		ItemConfig hdConfig = configService.getItemConfigByKey("HARDDISK"); 
//		ItemConfig memConfig = configService.getItemConfigByKey("MEMORY");   
//		List<? extends Image> imgList = openstackService.getImages();
//		List<? extends Flavor> configList  = openstackService.getOSFlavorList(true);
//		VMOrder temp = new VMOrder();
//		temp.setType(1);
//		List<VMOrder> caseList = vmOrderService.getVMOrderList(temp);
//		VMOrder order = new VMOrder();
//		order.setId(orderId);
//		order.setType(2);
//		if(orderId>0){
//			order = vmOrderService.getVMOrderById(order);
//			if(order.getItemList()!=null){
//				List<VMOrderDetail> itemList = order.getItemList();
//				if(itemList.size()>0){ 
//					for(VMOrderDetail o :itemList){
//						if(o.getItemId() == hdConfig.getId()){
//							order.setDiskCount(o.getItemQty());
//						}
//						if(o.getItemId() == cpuConfig.getId()){
//							order.setCpuCount(o.getItemQty());
//						}
//						if(o.getItemId() == memConfig.getId()){
//							order.setRamCount(o.getItemQty());
//						} 
//					} 
//				}
//			}
//		}else{
//			order.setState((byte) 0);
//			order.setCpuCount(1); 
//			order.setDiskCount(0);
//			order.setRamCount(64);
//			order.setUserId(u.getId());
//		}
//
//		request.setAttribute("user", u); 
//		request.setAttribute("order", order); 
//		request.setAttribute("cpuConfig", cpuConfig); 
//		request.setAttribute("hdConfig", hdConfig); 
//		request.setAttribute("memConfig", memConfig);  
//		request.setAttribute("imgList", imgList); 
//		request.setAttribute("configList", configList); 
//		request.setAttribute("caseList", caseList); 
//		request.setAttribute("order", order);  
//		return "web/customer/order/orderInfo";
//	}
//	/**
//	 * 工单管理
//	 *  
//	 * @param request
//	 * @param response
//	 * @return 
//	 */
//	@RequestMapping(value = "/issueList.do")
//	public String IssueInit(
//			Issue issue,
//			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
//		if(issue.getSearchName()!=null&&issue.getSearchName().length()>0){
//			String searchName =  new String(issue.getSearchName().getBytes("iso8859-1"), "utf-8");  
//			issue.setSearchName(searchName); 
//		}
//		if (issue.getPageNo() == null)
//			issue.setPageNo(1);
//		issue.setPageSize(Constants.DEFAULT_PAGE_SIZE);
//		issue.setSubmitterId(this.getLoginUser().getId());
//		List<Issue> list = customerService.getIssueList(issue);
//		int totalCount = customerService.getIssueListCount(issue);
//		issue.setTotalCount(totalCount);
//		User u = this.getLoginUser();
//		request.setAttribute("user", u); 
//		request.setAttribute("issueList", list);
//		request.setAttribute("issue", issue);
//		return "web/customer/order/issueList";
//	}
//	
//	/**
//	 * 工单信息详情
//	 * @param faultId
//	 * @param dealClick
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping(value = "/issueInfo.do")	
//	public String IssueInfo(
//			@RequestParam(value = "issueId", required = true) Integer issueId,
//			HttpServletRequest request, HttpServletResponse response){ 
//		Issue issue = new Issue();
//		if(issueId>0){
//			issue = customerService.getIssueById(issueId);
//		}else{
//			issue.setId(0);
//		}
//		request.setAttribute("issueInfo", issue);
//		return "web/customer/order/issueInfo";
//	}
//	/**
//	 * 工单保存
//	 * @param issue
//	 * @param request
//	 * @param response
//	 * @return
//	 * @throws UnsupportedEncodingException
//	 */
//	@ResponseBody
//	@RequestMapping(value = "/jsonSaveOrUpdateIssue.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
//	public JsonResult<Issue> saveOrUpdateFault(
//			Issue issue,
//			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
//		JsonResult<Issue> js = new JsonResult<Issue>();
//		js.setCode(new Integer(1));
//		js.setMessage("保存失败!");
//		try{
//			User u = this.getLoginUser();
//			issue.setSubmitterId(u.getId());
//			customerService.saveOrUpdateIssue(issue);
//			js.setCode(new Integer(0));
//			js.setMessage("保存成功!");
//			//日志
//			int type = u.getUserType();
//			String msg = "";
//			if(issue.getState()==0){
//				msg = "保存了工单草稿：";
//			}else{
//				msg = "提交了工单：";
//			}
//			if(issue.getId()>0){
//				logService.saveLog(u, u.getName()+"修改了工单草稿："+issue.getContent(), IpUtil.getIp(request), (byte)type, (byte)1);
//			}else{
//				logService.saveLog(u, u.getName()+msg+issue.getContent(), IpUtil.getIp(request), (byte)type, (byte)1);
//			}
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		return js;
//	}
//	/**
//	 * 修改工单状态：提交
//	 * @param id
//	 * @param request
//	 * @param response
//	 * @return
//	 * @throws UnsupportedEncodingException
//	 */
//	@ResponseBody
//	@RequestMapping(value = "/jsonUpdateIssue.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
//	public JsonResult<Issue> IssueCommit(
//			@RequestParam(value = "id", required = true) Integer id,
//			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
//		JsonResult<Issue> js = new JsonResult<Issue>();
//		js.setCode(new Integer(1));
//		js.setMessage("提交失败!");
//		try{
//			Issue issue = new Issue();
//			issue.setId(id);
//			issue.setState((byte) 1);
//			customerService.updateIssueState(issue);
//			js.setCode(new Integer(0));
//			js.setMessage("提交成功!");
//			//日志
//			User u = this.getLoginUser();
//			int type = u.getUserType();
//			Issue i = orderService.getIssueById(id);
//			logService.saveLog(u, u.getName()+"提交了工单："+i.getContent(), IpUtil.getIp(request), (byte)type, (byte)1);
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		return js;
//	}
//	@ResponseBody
//	@RequestMapping(value = "/jsonLoadFault.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
//	public List<Fault> loadFault(
//			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
//		List<Fault> list = customerService.getFaultList();
//		return list;
//	}
// 
//	// [start] 订单管理模块列表加载
//	
//	/**
//	 * 新增或保存订单
//	 * 
//	 * @param order
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@ResponseBody
//	@RequestMapping(value = "/jsonsaveOrUpdateOrder.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
//	public JsonResult<VMOrder> jsonsaveOrUpdateOrder(
//			VMOrder order, HttpServletRequest request,
//			HttpServletResponse response) {
//		JsonResult<VMOrder> js = new JsonResult<VMOrder>();
//		js.setCode(new Integer(1));
//		js.setMessage("保存失败!");  
//		try { 
//			if (order.getId() == null || order.getId() == 0) {
//				order.setId(0);
//			}
//			User u = this.getLoginUser();
//			if(order.getState() == 1){
//				order.setSubmitTime(new Date());
//			}
//			order.setVmOrderTime(new Date()); 
//			vmOrderService.saveOrupdateVMOrder(order);
//			Map<String, Object> map = GeneralUtil.getSerialNoPars(1);
//			orderSerialService.updateOrderSerialNo(map);
//			js.setCode(new Integer(0));
//			js.setMessage("保存成功!");
//			//日志 
//			int type = u.getUserType();
//			if(order.getId()>0){
//				logService.saveLog(u, u.getName()+"修改了订单："+order.getVmOrderSn(), IpUtil.getIp(request), (byte)type, (byte)1);
//			}else{
//				logService.saveLog(u, u.getName()+"新增了订单："+order.getVmOrderSn(), IpUtil.getIp(request), (byte)type, (byte)1);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return js;
//	}
//	 
//	/**
//	 * 提交订单
//	 * 
//	 * @param order
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@ResponseBody
//	@RequestMapping(value = "/jsonUpdateOrder.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
//	public JsonResult<VMOrder> jsonCheckOrder(
//			@RequestParam(value = "orderId", required = true) Integer orderId,
//			HttpServletRequest request,
//			HttpServletResponse response) {
//		JsonResult<VMOrder> js = new JsonResult<VMOrder>();
//		js.setCode(new Integer(1));
//		js.setMessage("提交失败!");  
//		try { 
//			VMOrder order = new VMOrder();
//			order.setId(orderId); 
//			order.setState((byte) 1);
//			vmOrderService.checkOrder(order);
//			js.setCode(new Integer(0));
//			js.setMessage("提交成功!");
//			//日志
//			User u = this.getLoginUser();
//			int type = u.getUserType();
//			logService.saveLog(u, u.getName()+"提交了订单："+order.getVmOrderSn(), IpUtil.getIp(request), (byte)type, (byte)1);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return js;
//	}
//	/**
//	 * 修改密码页面
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@RequestMapping(value = "/psdChange.do")	
//	public String psdChange(
//			HttpServletRequest request, HttpServletResponse response){ 
//		User u = this.getLoginUser();
//		User user = userService.getUserById(u.getId());
//		request.setAttribute("userInfo", user);
//		return "web/customer/set/psdChange";
//	}
//	/**
//	 * 修改密码操作
//	 * @param user
//	 * @param request
//	 * @param response
//	 * @return
//	 */
//	@ResponseBody
//	@RequestMapping(value = "/jsonUpdatePsd.do",method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })	
//	public JsonResult<User> updatePsd(
//			User user,
//			HttpServletRequest request, HttpServletResponse response){ 
//		JsonResult<User> json = new JsonResult<User>();
//		json.setCode(new Integer(1));
//		json.setMessage("修改密码失败!"); 
////		User existuser = new User();
//		try{
////			existuser.setAccount(user.getAccount());
////			existuser.setId(user.getId());
////			List<User> user1 = userService.getExistUser(existuser);
////			if(user1.size()>0){
////				json.setMessage("用户账号已存在!");
////				return json;
////			}
//			/*检验原密码是否正确*/
//			User user2 = userService.getUserById(user.getId());
//			ReturnResult<User> res = userService.login(user2.getAccount(), user.getOldPassword(), false, user2.getUserType());
//		    if(res.getCode()==1){
//		    	User sessionUser = (User)res.getResultObject();
////		    	String newPassword = user.getPassword(); 
//		    	/*新密码加密*/
//		    	User u = EndecryptUtils.md5Password(user.getAccount(), user.getPassword());
//				if (u != null) {
//					int type = sessionUser.getUserType();
//					user.setPassword(u.getPassword());
//					user.setSalt(u.getSalt());
//					userService.updatePsd(user);
//					json.setCode(new Integer(0));
//			    	json.setMessage("修改密码成功！");
////			    	if(openstackService.changeOSUserPassword(sessionUser.getOsUserSn(), newPassword)){
//						logService.saveLog(u, "用户："+u.getName()+" 修改了密码", IpUtil.getIp(request), (byte)type, (byte)1);
////			    	}else{
////						logService.saveLog(u, "用户："+u.getName()+" 修改了密码，失败", IpUtil.getIp(request), (byte)type, (byte)1);
////			    	}
//				}
//		    }else{//不正确
//		    	json.setMessage("初始密码不正确！");
//		    }
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		return json;
//	}
	// [end]
}

