/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.43
 * Generated at: 2024-07-17 07:47:32 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dao.ThisDAO;

public final class insert_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("dao.ThisDAO");
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

	ThisDAO dao = new ThisDAO();
	int custno = dao.getMaxCustno();
 
      out.write("    \r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/master/header.jsp", out, false);
      out.write("\r\n");
      out.write("<section>\r\n");
      out.write("\t<p id=\"table_title\">회원등록</p>\r\n");
      out.write("\t<form action=\"insertPros.jsp\" name=\"frm\">\r\n");
      out.write("\t\t<table>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>회원번호(자동발생)</td>\r\n");
      out.write("\t\t\t\t<td><input type=\"number\" readonly=\"readonly\" name=\"custno\" id=\"custno\" value=\"");
      out.print( custno );
      out.write("\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>회원성명</td>\r\n");
      out.write("\t\t\t\t<td><input type=\"text\" name=\"custname\" id=\"custname\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>회원전화</td>\r\n");
      out.write("\t\t\t\t<td><input type=\"text\" name=\"phone\" id=\"phone\"></td>\r\n");
      out.write("\t\t\t</tr>\t\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>회원주소</td>\r\n");
      out.write("\t\t\t\t<td><input type=\"text\" name=\"address\" id=\"address\"></td>\r\n");
      out.write("\t\t\t</tr>\t\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>가입일자</td>\r\n");
      out.write("\t\t\t\t<td><input type=\"date\" name=\"joindate\" id=\"joindate\">\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>고객등급(A:VIP, B:일반, C:직원)</td>\r\n");
      out.write("\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t<select name=\"grade\" id=\"grade\">\r\n");
      out.write("\t\t\t\t\t\t<option value=\"0\">회원등급선택</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"A\">VIP</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"B\">일반</option>\r\n");
      out.write("\t\t\t\t\t\t<option value=\"C\">직원</option>\r\n");
      out.write("\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td>도시코드</td>\r\n");
      out.write("\t\t\t\t<td><input type=\"text\" name=\"city\" id=\"city\"></td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td colspan=\"2\">\r\n");
      out.write("\t\t\t\t\t<input type=\"submit\" value=\"등록하기\" onclick=\"returncheck()\"> \r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t</form>\r\n");
      out.write("</section>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/master/footer.jsp", out, false);
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\tfunction check(){\r\n");
      out.write("\t\tif(document.querySelector(\"#custname\").value.trim().length == 0 ){\r\n");
      out.write("\t\t\talert(\"이름을 입력하세요.\");\r\n");
      out.write("\t\t\tdocument.querySelector(\"#custname\").value=\"\";\r\n");
      out.write("\t\t\tdocument.querySelector(\"#custname\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(document.querySelector(\"#phone\").value.trim().length == 0){\r\n");
      out.write("\t\t\talert(\"전화번호를 입력하세요.\");\r\n");
      out.write("\t\t\tdocument.querySelector(\"#phone\").value=\"\";\r\n");
      out.write("\t\t\tdocument.querySelector(\"#phone\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(document.querySelector(\"#address\").value.trim().length == 0){\r\n");
      out.write("\t\t\talert(\"주소를 입력하세요.\");\r\n");
      out.write("\t\t\tdocument.querySelector(\"#address\").value=\"\";\r\n");
      out.write("\t\t\tdocument.querySelector(\"#address\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(document.querySelector(\"#joindate\").value.trim().length == 0){\r\n");
      out.write("\t\t\talert(\"날짜를 입력하세요.\");\r\n");
      out.write("\t\t\tdocument.querySelector(\"#joindate\").value=\"\";\r\n");
      out.write("\t\t\tdocument.querySelector(\"#joindate\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(document.querySelector(\"#grade\").value == 0){\r\n");
      out.write("\t\t\talert(\"등급을 선택하세요.\");\r\n");
      out.write("\t\t\tdocument.querySelector(\"#grade\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(document.querySelector(\"#city\").value.trim().length == 0){\r\n");
      out.write("\t\t\talert(\"도시코드를 입력하세요.\");\r\n");
      out.write("\t\t\tdocument.querySelector(\"#city\").value=\"\";\r\n");
      out.write("\t\t\tdocument.querySelector(\"#city\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("</script>");
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
