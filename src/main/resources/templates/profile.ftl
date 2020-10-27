<#import "parts/common.ftl" as c>

<@c.page>
    <h4>Profile page</h4>
    <h5>${username}</h5>
    ${message?ifExists}
<form  method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Password:</label>
        <div class="col-sm-6">
            <input type="password" name="password" placeholder="Password"/>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label">Email:</label>
        <div class="col-sm-6">
            <input type="email" name="email" placeholder="some@some.com" value="${email!''}"/>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <div class="form-group row">
        <button class="btn btn-primary" type="submit">Save</button>
    </div>
</form>
</@c.page>