<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> User Name :</label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       value="<#if user??>${user.username}</#if>" placeholder="User name"/>
            </div>
            <#if usernameError??>
                <div class="${(usernameError??)?string('', 'invalid-feedback')}">
                    ${usernameError}
                </div>
            </#if>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Password:</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control ${(passwordError??)?string('is-invalid', '')}"
                       placeholder="Password"/>
            </div>
            <#if passwordError??>
                <div class="${(passwordError??)?string('', 'invalid-feedback')}">
                    ${passwordError}
                </div>
            </#if>
        </div>
        <#if isRegisterForm>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> Retype password:</label>
                <div class="col-sm-6">
                    <input type="password" name="password2" class="form-control ${(password2Error??)?string('is-invalid', '')}"
                           placeholder="Retype password"/>
                </div>
                <#if password2Error??>
                    <div class="${(password2Error??)?string('', 'invalid-feedback')}">
                        ${password2Error}
                    </div>
                </#if>
            </div>

        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                       value="<#if user??>${user.email}</#if>" placeholder="some@some.com"/>
            </div>
        </div>
            <#if emailError??>
                <div class="${(emailError??)?string('', 'invalid-feedback')}">
                    ${emailError}
                </div>
            </#if>
            <div class="col-sm-6">
                <div class="g-recaptcha" data-sitekey="6Lfj29sZAAAAAM_J-_9QfE5dQplQgTVNqnXWNhDY"></div>
                <#if captchaError??>
                    <div class="alert alert-danger" role="alert">
                        ${captchaError}
                    </div>
                </#if>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div class="form-group row">
            <#if !isRegisterForm><a href="/registration">Add new user</a></#if>
        </div>
        <div class="form-group row">
            <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
        </div>
    </form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button class="btn btn-primary" type="submit">Sign Out"</button>
</form>
</#macro>