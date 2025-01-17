/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.43
 * Generated at: 2024-08-02 05:34:42 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import vo.LlistVO;
import java.util.ArrayList;
import dao.StudentDAO;

public final class llist_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("vo.LlistVO");
    _jspx_imports_classes.add("dao.StudentDAO");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	StudentDAO dao = new StudentDAO();
	ArrayList<LlistVO> list = dao.getLlist();

      out.write("    \r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/master/header.jsp", out, false);
      out.write("\r\n");
      out.write("<p id=\"p_title\">학생 성적 목록 조회</p>\r\n");
      out.write("<table>\r\n");
      out.write("\t");
if(list != null){ 
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td>학생코드</td>\r\n");
      out.write("\t\t<td>학생이름</td>\r\n");
      out.write("\t\t<td>주민번호</td>\r\n");
      out.write("\t\t<td>과목명</td>\r\n");
      out.write("\t\t<td>유형</td>\r\n");
      out.write("\t\t<td>교수명</td>\r\n");
      out.write("\t\t<td>중간고사</td>\r\n");
      out.write("\t\t<td>기말고사</td>\r\n");
      out.write("\t\t<td>출석</td>\r\n");
      out.write("\t\t<td>과제</td>\r\n");
      out.write("\t\t<td>기타</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");
for(LlistVO vo : list){ 
      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td>");
      out.print(vo.getStudent_id() );
      out.write("</td>\r\n");
      out.write("\t\t<td>");
      out.print(vo.getStudent_name() );
      out.write("</td>\r\n");
      out.write("\t\t<td>");
      out.print(vo.getJumin() );
      out.write("</td>\r\n");
      out.write("\t\t<td>");
      out.print(vo.getSubject_name() );
      out.write("</td>\r\n");
      out.write("\t\t<td>");
      out.print(vo.getClassification() );
      out.write("</td>\r\n");
      out.write("\t\t<td>");
      out.print(vo.getProfessor_name() );
      out.write("</td>\r\n");
      out.write("\t\t<td>");
      out.print(vo.getMid_term() );
      out.write("</td>\r\n");
      out.write("\t\t<td>");
      out.print(vo.getFinal_term() );
      out.write("</td>\r\n");
      out.write("\t\t<td>");
      out.print(vo.getAttend() );
      out.write("</td>\r\n");
      out.write("\t\t<td>");
      out.print(vo.getReport() );
      out.write("</td>\r\n");
      out.write("\t\t<td>");
      out.print(vo.getEtc() );
      out.write("</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\t");

		}
	}else{
		out.print("<tr><td colspan='12'>조회된 자료가 없습니다.</td></tr>");
	}
	
      out.write("\r\n");
      out.write("</table>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/master/footer.jsp", out, false);
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
