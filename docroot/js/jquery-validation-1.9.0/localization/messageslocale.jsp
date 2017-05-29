<%@page import="com.liferay.portal.kernel.util.LocaleUtil"%>
<%@page import="java.util.Locale"%>
<%@page contentType="application/javascript" pageEncoding="UTF-8"%>

/*
 * Mime Type : application/javascript
 */

<%    
    String languageId = request.getParameter("languageId");
        
    if(languageId==null || languageId== "") {
          languageId = "en_GB";
    }
    Locale locale = LocaleUtil.fromLanguageId(languageId);
    String language = locale.getLanguage();
    String extLocaleFile = "messages_" + language + ".js";
%>
<jsp:include page="<%=extLocaleFile%>" />