<%@ page import="com.surelution.ruijin.Doctor" %>

<div class="fieldcontain ${hasErrors(bean: doctorInstance, field: 'address', 'error')} ">
	<dl class="dl-horizontal">
		<dt>
			<label for="address">
		        <g:message code="doctor.address.label" default="Address" />
	        </label>
		</dt>
		<dd>
			<div class="col-xs-8">
				<g:textField name="address" value="${doctorInstance?.address}" class="form-control"/>
			</div>
		</dd>
	</dl>
</div>

<div class="fieldcontain ${hasErrors(bean: doctorInstance, field: 'description', 'error')} ">
	<dl class="dl-horizontal">
		<dt>
			<label for="description">
		      <g:message code="doctor.description.label" default="Description" />
	       </label>
		</dt>
		<dd>
			<div class="col-xs-8">
				<g:textField name="description" value="${doctorInstance?.description}" class="form-control"/>
			</div>
		</dd>
	</dl>
</div>

<div class="fieldcontain ${hasErrors(bean: doctorInstance, field: 'inquiries', 'error')} required">
	<dl class="dl-horizontal">
		<dt>
			<label for="inquiries">
		        <g:message code="doctor.inquiries.label" default="Inquiries" />
	        </label>
		</dt>
		<dd>
			<div class="col-xs-8">
			   <g:field name="inquiries" type="number" value="${doctorInstance.inquiries}" class="form-control" required=""/>
			</div>
		</dd>
	</dl>
</div>

<div class="fieldcontain ${hasErrors(bean: doctorInstance, field: 'name', 'error')} ">
	<dl class="dl-horizontal">
		<dt>
			<label for="name">
	        	<g:message code="doctor.name.label" default="Name" />
	        	<span class="required-indicator">*</span>
	        </label>
		</dt>
		<dd>
			<div class="col-xs-8">
			    <g:textField name="name" id="name" value="${doctorInstance?.name}" class="form-control"/>
			</div>
		</dd>
	</dl>
</div>

<div class="fieldcontain ${hasErrors(bean: doctorInstance, field: 'reservations', 'error')} required">
	<dl class="dl-horizontal">
		<dt>
			<label for="reservations">
		<g:message code="doctor.reservations.label" default="Reservations" />
		
	</label>
		</dt>
		<dd>
			<div class="col-xs-8">
			   <g:field name="reservations" type="number" value="${doctorInstance.reservations}" class="form-control" required=""/>
			</div>
		</dd>
	</dl>
</div>

<div class="fieldcontain ${hasErrors(bean: doctorInstance, field: 'skills', 'error')} ">
	<dl class="dl-horizontal">
		<dt>
			<label for="skills">
		<g:message code="doctor.skills.label" default="Skills" />
		
	</label>
		</dt>
		<dd>
			<div class="col-xs-8">
			<g:textField name="skills" value="${doctorInstance?.skills}" class="form-control"/>
			</div>
		</dd>
	</dl>
</div>

<div class="fieldcontain ${hasErrors(bean: doctorInstance, field: 'title', 'error')} ">
	<dl class="dl-horizontal">
		<dt>
			<label for="title">
		<g:message code="doctor.title.label" default="Title" />
		
	</label>
		</dt>
		<dd>
			<div class="col-xs-8">
			<g:textField name="title" value="${doctorInstance?.title}" class="form-control"/>
			</div>
		</dd>
	</dl>
</div>

