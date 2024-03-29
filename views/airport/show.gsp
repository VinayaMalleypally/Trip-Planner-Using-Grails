

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Airport</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Airport List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Airport</g:link></span>
        </div>
        <div class="body">
            <h1>Show Airport</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${airport.id}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${airport.name}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Iata:</td>
                            
                            <td valign="top" class="value">${airport.iata}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">City:</td>
                            
                            <td valign="top" class="value">${airport.city}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">State:</td>
                            
                            <td valign="top" class="value">${airport.state}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Country:</td>
                            
                            <td valign="top" class="value">${airport.country}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Lat:</td>
                            
                            <td valign="top" class="value">${airport.lat}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Lng:</td>
                            
                            <td valign="top" class="value">${airport.lng}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${airport?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
