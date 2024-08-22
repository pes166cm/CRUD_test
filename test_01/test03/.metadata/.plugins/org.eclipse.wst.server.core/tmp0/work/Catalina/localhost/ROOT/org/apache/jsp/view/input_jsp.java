/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.43
 * Generated at: 2024-07-24 04:08:02 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.view;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class input_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = null;
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

      out.write('\r');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/master/header.jsp", out, false);
      out.write("\r\n");
      out.write("<section>\r\n");
      out.write("\t<div class=\"content\">\r\n");
      out.write("\t\t<p class=\"title\">투표하기</p>\r\n");
      out.write("\t\t<form action=\"inputProc.jsp\" name=\"frm\">\r\n");
      out.write("\t\t\t<table>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>주민번호</td>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" name=\"v_jumin\" id=\"v_jumin\"></td>\r\n");
      out.write("\t\t\t\t\t<td>입력>9901012000000</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>성명</td>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" name=\"v_name\" id=\"v_name\"></td>\r\n");
      out.write("\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>후보번호</td>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<select name=\"c_no\" id=\"c_no\">\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"0\">후보번호를 선택하세요.</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"1\">후보1번(김후보)</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"2\">후보2번(이후보)</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"3\">후보3번(박후보)</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"4\">후보4번(조후보)</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"5\">후보5번(최후보)</option>\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>투표시간</td>\r\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" name=\"v_time\" id=\"v_time\"></td>\r\n");
      out.write("\t\t\t\t\t<td>입력예) 9시 30분 => 0910으로 입력</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>투표장소</td>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<select name=\"v_area\" id=\"v_area\">\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"0\">투표장소를 선택하세요.</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"1\">제1투표장</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"2\">제2투표장</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"3\">제3투표장</option>\r\n");
      out.write("\t\t\t\t\t\t\t<option value=\"4\">제4투표장</option>\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td>유권자확인</td>\r\n");
      out.write("\t\t\t\t\t<td>\r\n");
      out.write("\t\t\t\t\t\t<input type=\"radio\" name=\"v_confirm\" id=\"v_confirm\" value=\"Y\">확인\r\n");
      out.write("\t\t\t\t\t\t<input type=\"radio\" name=\"v_confirm\" id=\"v_confirm\" value=\"N\">미확인\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t<td></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td colspan=\"3\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"submit\" value=\"투표하기\" onclick=\"return check()\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"reset\" value=\"다시하기\">\r\n");
      out.write("\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t</div>\r\n");
      out.write("</section>\r\n");
      out.write("<script>\r\n");
      out.write("\tfunction check(){\r\n");
      out.write("\t\tif(document.querySelector(\"#v_jumin\").value == \"\"){\r\n");
      out.write("\t\t\talert(\"주민등록번호를 입력하세요.\");\r\n");
      out.write("\t\t\tdocument.querySelector(\"#v_jumin\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(document.querySelector(\"#v_name\").value == \"\"){\r\n");
      out.write("\t\t\talert(\"이름을 입력하세요.\");\r\n");
      out.write("\t\t\tdocument.querySelector(\"#v_name\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif(document.querySelector(\"#c_no\").value == \"0\"){\r\n");
      out.write("\t\t\talert(\"후보번호를 선택하세요.\");\r\n");
      out.write("\t\t\tdocument.querySelector(\"#c_no\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\treturn true;\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
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