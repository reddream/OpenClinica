<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:setBundle basename="org.akaza.openclinica.i18n.workflow" var="resworkflow"/>    
<fmt:setBundle basename="org.akaza.openclinica.i18n.words" var="resword"/> 

<!-- User Box -->
 	
	<div align="right" class="userbox">

	<!-- These DIVs define shaded box borders -->
		<div class="box_T"><div class="box_L"><div class="box_R"><div class="box_B"><div class="box_TL"><div class="box_TR"><div class="box_BL"><div class="box_BR">

			<div class="userboxtext_center">

	<!-- User Box contents -->
			<div class="userboxtext">		
				<c:if test="${userBean != null && userBean.id > 0}">
					<b><fmt:message key="user" bundle="${resword}"/>:</b>&nbsp; <c:out value="${userBean.name}" />
					<br>
					<c:choose>
					<c:when test='${(isAdminServlet == "admin" && userBean.techAdmin) || (!userRole.role.active && userBean.techAdmin)}'>
					<b><fmt:message key="technical_administrator" bundle="${resworkflow}"/></b>
		            </c:when>
		            <c:when test='${(isAdminServlet == "admin" && userBean.sysAdmin) || (!userRole.role.active && userBean.sysAdmin)}'>
					<b><fmt:message key="business_administrator" bundle="${resworkflow}"/></b>
		            </c:when>
		            
		            <c:otherwise>
					<c:if test="${study.status.name != 'removed' && study.status.name != 'auto-removed'}">
		            <c:choose>
		            <c:when test='${study.parentStudyId > 0}'>
		            <b><fmt:message key="study" bundle="${resword}"/>:</b> &nbsp; <c:out value="${study.parentStudyName}" /> 
					<br><b><fmt:message key="site" bundle="${resword}"/>:</b> &nbsp; <c:out value="${study.name}" />
					</c:when>
					<c:otherwise>
					<b><fmt:message key="study" bundle="${resword}"/>:</b> &nbsp; <c:out value="${study.name}" />
					</c:otherwise>
					</c:choose>
					
					<br>
					<b><fmt:message key="protocol_ID" bundle="${resword}"/>:</b>&nbsp; <c:out value="${study.identifier}" />
					<br>
					<b><fmt:message key="role" bundle="${resword}"/>:</b>&nbsp; <c:out value="${userRole.role.description}" />
					<br>
					</c:if>
	                </c:otherwise>
					</c:choose>
					<img src="images/UserBox_line.gif" width="161" height="1" vspace="4"><br>
					<span class="logout"><fmt:message key="change_study_site" bundle="${resworkflow}"/></span>
				</c:if>
	  			<span class="logout"><a href="${pageContext.request.contextPath}/pages/logout"><fmt:message key="log_out" bundle="${resword}"/></a></span>			
	          
				</div>

	<!-- End User Box contents -->

			<br></div>

		</div></div></div></div></div></div></div></div>

	</div>
  
<!-- End User Box -->

				</td>
			</tr>
		</table>
<!-- End Header Table -->
