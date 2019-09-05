

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Flight</title>    
        
        <g:javascript library="prototype" />     
        
        <script type="text/javascript">
          function get(airportField){
            var baseUrl = "${createLink(controller:'airport', action:'getJson')}"
            var url = baseUrl + "?iata=" + $F(airportField + "Iata")
            new Ajax.Request(url, {
              method: 'get',
              asynchronous: true,
              onSuccess: function(req) {update(req.responseText, airportField)}                          
            })
          }
          
          function update(json, airportField){
            var airport = eval( "(" + json + ")" )
            var output = $(airportField + "Text")
            output.innerHTML = airport.iata + " - " + airport.name
            var hiddenField = $(airportField + ".id")
            airport.id == null ? hiddenField.value = -1 : hiddenField.value = airport.id
          }
          
          function validate(){
            if( $F("departureAirport.id") == -1 ){
              alert("Please supply a valid Departure Airport")
              return false
            }
            
            if( $F("arrivalAirport.id") == -1 ){
              alert("Please supply a valid Arrival Airport")
              return false
            }
            
            return true
          }
          
        </script>
        
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Flight List</g:link></span>
        </div>
        <div class="body">
          
          
          
          
          
          
          
            <h1>Create Flight</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${flight}">
            <div class="errors">
                <g:renderErrors bean="${flight}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" onsubmit="return validate()" >
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
                                  

<div id="departureAirportText">[Type an Airport IATA Code]</div>
<input type="hidden" name="departureAirport.id" value="-1" id="departureAirport.id"/>          
<input type="text" name="departureAirportIata" id="departureAirportIata"/>
<input type="button" value="Find" onClick="get('departureAirport')"/>          
                                 


                                  
                                  <!-- >
                                    <g:select optionKey="id" from="${Airport.list()}" name="departureAirport.id" value="${flight?.departureAirport?.id}" ></g:select>
                                  < -->
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
                                  
  

<div id="arrivalAirportText">[Type an Airport IATA Code]</div>
<input type="hidden" name="arrivalAirport.id" value="-1" id="arrivalAirport.id"/>          
<input type="text" name="arrivalAirportIata" id="arrivalAirportIata"/>
<input type="button" value="Find" onClick="get('arrivalAirport')"/>  
                                  
                                  <!-- >                                
                                    <g:select optionKey="id" from="${Airport.list()}" name="arrivalAirport.id" value="${flight?.arrivalAirport?.id}" ></g:select>
                                    < -->
                                    
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
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
