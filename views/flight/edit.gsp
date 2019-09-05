

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Flight</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Flight List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Flight</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Flight</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${flight}">
            <div class="errors">
                <g:renderErrors bean="${flight}" as="list" />
            </div>
            </g:hasErrors>
            <g:form controller="flight" method="post" >
                <input type="hidden" name="id" value="${flight?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="flightNumber">Flight Number:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:flight,field:'flightNumber','errors')}">
                                    <input type="text" id="flightNumber" name="flightNumber" value="${fieldValue(bean:flight,field:'flightNumber')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="airline">Airline:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:flight,field:'airline','errors')}">
                                    <g:select optionKey="id" from="${Airline.list()}" name="airline.id" value="${flight?.airline?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="departureDate">Departure Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:flight,field:'departureDate','errors')}">
                                    <g:datePicker name="departureDate" value="${flight?.departureDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="departureAirport">Departure Airport:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:flight,field:'departureAirport','errors')}">
                                    <g:select optionKey="id" from="${Airport.list()}" name="departureAirport.id" value="${flight?.departureAirport?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="arrivalDate">Arrival Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:flight,field:'arrivalDate','errors')}">
                                    <g:datePicker name="arrivalDate" value="${flight?.arrivalDate}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="arrivalAirport">Arrival Airport:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:flight,field:'arrivalAirport','errors')}">
                                    <g:select optionKey="id" from="${Airport.list()}" name="arrivalAirport.id" value="${flight?.arrivalAirport?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="trip">Trip:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:flight,field:'trip','errors')}">
                                    <g:select optionKey="id" from="${Trip.list()}" name="trip.id" value="${flight?.trip?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
