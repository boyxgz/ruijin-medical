<%@ page import="com.surelution.ruijin.Reservation" %>



<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'endReservation', 'error')} required">
	<label for="endReservation">
		<g:message code="reservation.endReservation.label" default="End Reservation" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endReservation" precision="day"  value="${reservationInstance?.endReservation}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="reservation.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: reservationInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationNum', 'error')} required">
	<label for="reservationNum">
		<g:message code="reservation.reservationNum.label" default="Reservation Num" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="reservationNum" type="number" value="${reservationInstance.reservationNum}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'reservationTime', 'error')} required">
	<label for="reservationTime">
		<g:message code="reservation.reservationTime.label" default="Reservation Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="reservationTime" precision="day"  value="${reservationInstance?.reservationTime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: reservationInstance, field: 'schedule', 'error')} required">
	<label for="schedule">
		<g:message code="reservation.schedule.label" default="Schedule" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="schedule" name="schedule.id" from="${com.surelution.ruijin.Schedule.list()}" optionKey="id" required="" value="${reservationInstance?.schedule?.id}" class="many-to-one"/>
</div>

