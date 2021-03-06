<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" uri="page" %> 
<%
   String path =  request.getContextPath();
request.setAttribute("path", path);
%>
<table class="table table-striped table-bordered table-hover" id="sample_6">
							<thead>
							<tr>
								<!-- <th>代理商编号</th> -->
								<th>代理商名称</th>
								<th>开户行名称</th>
								<th>银行卡号码</th>
								<th>联行号</th>
								<th>身份证号码</th>
								<th>开户名</th>
								<th>手机号码</th>
								<th>是否对公对私</th>
								<!-- <th>创建时间</th> -->
								<th>状态</th>
								<th>
									 操作
								</th>
							</tr>
							</thead>
							<tbody id="tableContent">
							
						  <c:forEach var="item" items="${pager.result}"> 
						   <tr>
									<%-- <td class="parent_id_parse" title="agentNo">${item.agentNo}</td> --%>
									<td class="parent_id_parse" title="agentNo">${item.agentName}</td>
									<td class="parent_id_parse" title="bankName">${item.bankName}</td>
									<td class="parent_id_parse" title="bankCard">${item.bankCard}</td>
									<td class="parent_id_parse" title="bankCode">${item.bankCode}</td>
									<td class="parent_id_parse" title="idCard">${item.idCard}</td>
									<td class="parent_id_parse" title="name">${item.name}</td>
									<td class="parent_id_parse" title="mobile">${item.mobile}</td>
									<c:if test="${item.accountType=='1'}">
										<td class="parent_id_parse">对公</td>
									</c:if>
									<c:if test="${item.accountType == null || item.accountType=='0' }">
										<td class="parent_id_parse">对私</td>
									</c:if>
									<%-- <td class="date_time_parse">${item.createTime}</td> --%>
									<c:if test="${item.status=='1'}">
										<td class="parent_id_parse">启用</td>
									</c:if>
									<c:if test="${item.status=='2'}">
										<td class="parent_id_parse">禁用</td>
									</c:if>
							<td>
								<a onclick="javascript:todetail('${item.id}');"><span class="label label-default">查看详情</span></a>
								<a href="${path}/adminManage/agentbankcard/${item.id}"><span class="label label-info">修改</span></a>
						   		<c:if test="${item.status == 2}"><a onclick="javascript:updateStatus(this);" status="1" value="${item.id}"><span class="label label-success">启用</span></a></c:if>
								<c:if test="${item.status == 1}"><a onclick="javascript:updateStatus(this);" status="2" value="${item.id}"><span class="label label-danger">禁用</span></a></c:if>
								<a href="${path}/adminManage/agentbankcard/link/${item.agentNo}"><span class="label label-primary">变更记录</span></a>
 									
							</td> 
						 </tr>
					</c:forEach>
					<c:if test="${pager.result.size() == 0}">
						<tr>
							<td class="page-nodata" colspan="20">查无数据！</td>
						</tr>
					</c:if>
			</tbody>
			</table>
			<script type="text/javascript">
						dataOpr();
						
						//显示详情
						function todetail(id){
							$.ajax({
								   type: "POST",
								   url: "agentbankcard/detail/"+id,
								   success: function(msg){
									   var btn = {success:{   
									       label: "关闭",
									       className: "btn-success",
									       callback: function() {
									       }
									     }};
									   bootbox.dialog({
										   message: msg,
										   title: "详情列表",
										   onEscape: function() {},
										   className: "green-haze",
										   buttons: btn
										 });
								   }
							});
						}
			</script>
			<page:page curPage="${pager.pageNo}" totalPages="${pager.totalPages}"  totalCounts="${pager.totalCount }"/>				