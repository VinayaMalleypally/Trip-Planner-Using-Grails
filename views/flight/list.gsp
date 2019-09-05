

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Flight List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Flight</g:link></span>
        </div>
        <div class="body">
            <h1>Flight List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="flightNumber" title="Flight Number" />
                        
                   	        <th>Airline</th>
                   	    
                   	        <g:sortableColumn property="departureDate" title="Departure Date" />
                        
                   	        <th>Departure Airport</th>
                   	    
                   	        <g:sortableColumn property="arrivalDate" title="Arrival Date" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${flightList}" status="i" var="flight">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${flight.id}">${flight.id?.encodeAsHTML()}</g:link></td>
                        
                            <td>${flight.flightNumber?.encodeAsHTML()}</td>
                        
                            <td>${flight.airline?.encodeAsHTML()}</td>
                        
                            <td>${flight.departureDate?.encodeAsHTML()}</td>
                        
                            <td>${flight.departureAirport?.encodeAsHTML()}</td>
                        
                            <td>${flight.arrivalDate?.encodeAsHTML()}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Flight.count()}" />
            </div>
        </div>
    </body>
</html>
