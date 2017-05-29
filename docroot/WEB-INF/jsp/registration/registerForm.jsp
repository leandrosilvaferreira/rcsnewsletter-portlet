<%-- 
    Document   : registerForm
    Created on : Aug 14, 2012, 10:45:59 AM
    Author     : marcoslacoste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@taglib prefix="portlet" uri="http://java.sun.com/portlet" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<fmt:setBundle basename="Language"/>
<portlet:defineObjects />


<%--
    URLs
    ##################
--%>
<portlet:resourceURL id='register' var='registerUrl'/>
<portlet:resourceURL id='showUnregisterForm' var='showUnregisterFormUrl'/>


<%--
    Header and Actions
    ##################
--%>


<%--
    Edit Form
    #########
--%>


<form:form id="register-form-${namespace}"  cssClass="newsletter-forms-form" modelAttribute="registerForm" >
    <form:hidden path="categoryId"  />
    <table>
        <c:if test="${showNameFields}">
        <tr>
            <td><label><fmt:message key="newsletter.registration.firstname" /></label></td>
            <td><form:input path="firstName"  cssClass="field-long" /></td>
        </tr>
        <tr>
            <td><label><fmt:message key="newsletter.registration.lastname" /></label></td>
            <td><form:input path="lastName"  cssClass="field-long" /></td>
        </tr>
        </c:if>
        <tr>
            <td><label><fmt:message key="newsletter.registration.email" />*</label></td>
            <td><form:input path="email"  cssClass="field-long required custom-email" /></td>
        </tr>
        <c:if test="${!(registerForm.categoryId eq 0)}">
        <tr>
            <td colspan="2">
                <hr>
            </td>
        </tr>
        <tr>
            <td><a href="javascript:loadUnregisterView()"><fmt:message key="newsletter.registration.link.unregister" /></a> </td>
            <td>
                <input id="btn-register-<portlet:namespace/>" type="button" onclick="registerEmail()"  value="<fmt:message key="newsletter.registration.button.register" />" />
            </td>
        </tr>
        </c:if>
    </table>
</form:form>


<%--
    Dialogs
    ##################
--%>
<div style="display:none">

</div>


<script type="text/javascript">
    
    
    jQuery(document).ready(function(){
        styleUI();
        initEvents();
        clearMessages();
        
        <c:if test="${registerForm.categoryId eq 0}">
               showErrors(['<fmt:message key="newsletter.registration.settings.error.nolistfound" />']);
        </c:if>
    });
    
    /**
     * Apply styles to UI
     */
    function styleUI(){
        // styles on buttons
        jQuery('#newsletter-registration-panel-<portlet:namespace/> input[type="button"]').button();
        
    }
    
    
    /**
     * Init UI events
     */
    function initEvents(){
        
        
        // click on 'Remove' button
//         jQuery('#btn-register-<portlet:namespace/>').click(function(){
//         	alert('hello');
//             clearMessages();
//             clearErrors();
//             // validate form
//              var form = jQuery('#register-form-${namespace}');
//              if (form.valid()){ 
                 
//                     // send data via ajax
//                     jQuery.ajax({
//                         url: '${registerUrl}'
//                         ,type: 'POST'
//                         ,data: form.serialize()
//                         ,success: function(response){
//                             if (response.success){
//                             	alert('Sucesso!');
//                                 showMessages(response.messages);
//                                 form.resetForm();
//                                 $('#register-form-${namespace} .error').text('');
//                             }else{
//                             	alert('Erro');
//                                 showErrors(response.validationKeys);
//                             }
//                         }
//                         ,failure: function(response){
//                             // TODO: display errors here
//                             alert(response);
//                         }
//                     });
//              }
//         });
        
          
    }
    
    
    /**
     *  Loads unregister view
     */
    function loadUnregisterView(){
        clearMessages();
        clearErrors();
        $('#newsletter-registration-panel-<portlet:namespace/>').load('${showUnregisterFormUrl}');
    }
    
    function registerEmail(){
        clearMessages();
        clearErrors();
        // validate form
         var form = jQuery('#register-form-${namespace}');
         if (form.valid()){ 
             
                // send data via ajax
                jQuery.ajax({
                    url: '${registerUrl}'
                    ,type: 'POST'
                    ,data: form.serialize()
                    ,success: function(response){
                        if (response.success){
                            showMessages(response.messages);
                            form.resetForm();
                            $('#register-form-${namespace} .error').text('');
                        }else{
                            showErrors(response.validationKeys);
                        }
                    }
                    ,failure: function(response){
                        // TODO: display errors here
                        alert(response);
                    }
                });
         }
    }
</script>