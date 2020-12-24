<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("registerWithTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("registerWithTitleHtml",(realm.displayNameHtml!''))?no_esc}
    <#elseif section = "form">
        <#include "logo.ftl">

        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
          <input type="text" readonly value="this is not a login form" style="display: none;">
          <input type="password" readonly value="this is not a login form" style="display: none;">

          <div class="kc-form-title">${msg("formRegister")}</div>

          <#if !realm.registrationEmailAsUsername>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">                
                <div class="${properties.kcInputWrapperClass!} textbox">
                    <input type="text" id="username" class="${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" placeholder="${msg("username")}" />
                    <i class="notranslate secondary-text material-icons md-24" aria-hidden="true" data-mat-icon-type="font">face</i>
                </div>
            </div>
          </#if>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcInputWrapperClass!} textbox">
                    <input type="text" id="firstName" class="${properties.kcInputClass!}" name="firstName" value="${(register.formData.firstName!'')}" placeholder="${msg("firstName")}" />
                    <i class="notranslate secondary-text material-icons md-24" aria-hidden="true" data-mat-icon-type="font">account_circle</i>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcInputWrapperClass!} textbox">
                    <input type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName" value="${(register.formData.lastName!'')}" placeholder="${msg("lastName")}" />
                    <i class="notranslate secondary-text material-icons md-24" aria-hidden="true" data-mat-icon-type="font">account_circle</i>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcInputWrapperClass!} textbox">
                    <input type="text" id="email" class="${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" placeholder=${msg("email")} />
                    <i class="notranslate secondary-text material-icons md-24" aria-hidden="true" data-mat-icon-type="font">mail</i>
                </div>
            </div>

            <#if passwordRequired>
            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcInputWrapperClass!} textbox">
                    <input type="password" id="password" class="${properties.kcInputClass!}" name="password" placeholder="${msg("password")}" />
                    <i class="notranslate secondary-text material-icons md-24" aria-hidden="true" data-mat-icon-type="font">vpn_key</i>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                <div class="${properties.kcInputWrapperClass!} textbox">
                    <input type="password" id="password-confirm" class="${properties.kcInputClass!}" name="password-confirm" placeholder="${msg("passwordConfirm")}" />
                    <i class="notranslate secondary-text material-icons md-24" aria-hidden="true" data-mat-icon-type="font">vpn_key</i>
                </div>
            </div>
            </#if>

            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a href="${url.loginUrl}">${msg("backToLogin")?no_esc}</a></span>
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
