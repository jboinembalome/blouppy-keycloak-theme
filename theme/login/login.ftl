<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("loginTitleHtml",(realm.displayNameHtml!''))}
    <#elseif section = "form">
        <#include "logo.ftl">

        <#if realm.password>
            <form id="kc-form-login" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">
                    <div class="kc-form-title">${msg("passwordLogin")}</div>
                    <div class="${properties.kcInputWrapperClass!} textbox">
                        <#if usernameEditDisabled??>
                            <input id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                            <i class="notranslate secondary-text material-icons md-24" aria-hidden="true" data-mat-icon-type="font">mail</i>
                        <#else>
                            <input id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>" />
                            <i class="notranslate secondary-text material-icons md-24" aria-hidden="true" data-mat-icon-type="font">mail</i>
                        </#if>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcInputWrapperClass!} textbox">
                        <input id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" placeholder='${msg("passwordPlaceHolder")}' />
                        <i class="material-icons md-24">vpn_key</i>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox">
                                <label>
                                    <#if login.rememberMe??>
                                        <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3" checked> ${msg("rememberMe")}
                                    <#else>
                                        <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3"> ${msg("rememberMe")}
                                    </#if>
                                </label>
                            </div>
                        </#if>
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span><a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <div class="${properties.kcFormButtonsWrapperClass!}">
                            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                        </div>
                     </div>
                </div>
            </form>
        </#if>
    <#elseif section = "info" >
        <#if realm.password && social.providers??>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <div class="kc-form-title">${msg("oauthLogin")}</div>
            <div id="kc-social-providers">
                <ul>
                    <#list social.providers as p>
                            <#if p.providerId = "facebook">
                            <a href="${p.loginUrl}" id="zocial-${p.alias}" class="fa fa-facebook"></a>
                             <#elseif p.providerId = "google">
                            <a href="${p.loginUrl}" id="zocial-${p.alias}" class="fa fa-google"></a>
                            <#elseif p.providerId = "github">
                            <a href="${p.loginUrl}" id="zocial-${p.alias}" class="fa fa-github"></a>
                            <#else>
                            <a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span class="text">${p.displayName}</span></a>
                            </#if>
                    </#list>
                </ul>
            </div>
        </#if>

        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <span>${msg("noAccount")} <a href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
