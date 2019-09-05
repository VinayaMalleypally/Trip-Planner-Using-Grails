

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Flight</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Flight List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Flight</g:link></span>
        </div>
        <div class="body">
            <h1>Show Flight</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${flight.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Flight Number:</td>
                            
                            <td valign="top" class="value">${flight.flightNumber}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Airline:</td>
                            
                            <td valign="top" class="value"><g:link controller="airline" action="show" id="${flight?.airline?.id}">${flight?.airline}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Departure Date:</td>
                            
                            <td valign="top" class="value">${flight.departureDate}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Departure Airport:</td>
                            
                            <td valign="top" class="value"><g:link controller="airport" action="show" id="${flight?.departureAirport?.id}">${flight?.departureAirport}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Arrival Date:</td>
                            
                            <td valign="top" class="value">${flight.arrivalDate}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Arrival Airport:</td>
                            
                            <td valign="top" class="value"><g:link controller="airport" action="show" id="${flight?.arrivalAirport?.id}">${flight?.arrivalAirport}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Trip:</td>
                            
                            <td valign="top" class="value"><g:link controller="trip" action="show" id="${flight?.trip?.id}">${flight?.trip}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form controller="flight">
                    <input type="hidden" name="id" value="${flight?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
