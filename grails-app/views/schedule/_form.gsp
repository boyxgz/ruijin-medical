<%@ page import="com.surelution.ruijin.Schedule" %>



<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'doctor', 'error')} required">
	<label for="doctor">
		<g:message code="schedule.doctor.label" default="Doctor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="doctor" name="doctor.id" from="${com.surelution.ruijin.Doctor.list()}" optionKey="id" required="" value="${scheduleInstance?.doctor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="schedule.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${scheduleInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'wokingTime', 'error')} required">
	<label for="wokingTime">
		<g:message code="schedule.wokingTime.label" default="Woking Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="wokingTime" precision="day"  value="${scheduleInstance?.wokingTime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: scheduleInstance, field: 'wokingType', 'error')} required">
	<label for="wokingType">
		<g:message code="schedule.wokingType.label" default="Woking Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="wokingType" name="wokingType.id" from="${com.surelution.ruijin.WokingType.list()}" optionKey="id" required="" value="${scheduleInstance?.wokingType?.id}" class="many-to-one"/>
</div>

