import grails.converters.*

class AirportController {
  def geocoderService
  def scaffold = Airport
  
  def getJson = {
    def airport = Airport.findByIata(params.iata)
    
    if(!airport){
      airport = new Airport(id:-1, iata:params.iata, name:"Not found")
    }
    
    render airport as JSON
  }
 
  def geocode = {
    def result = geocoderService.geocodeAirport(params.iata)
    render result as JSON
  }
  
  def map = {
    [airportList: Airport.list()]
  }
  
  def update = {
      def airport = Airport.get( params.id )
      if(airport) {
          def results = geocoderService.geocodeAirport(params.iata)    
          airport.properties = params + results
          if(!airport.hasErrors() && airport.save()) {
              flash.message = "Airport ${params.id} updated"
              redirect(action:show,id:airport.id)
          }
          else {
              render(view:'edit',model:[airport:airport])
          }
      }
      else {
          flash.message = "Airport not found with id ${params.id}"
          redirect(action:edit,id:params.id)
      }
  }

  def save = {
      def results = geocoderService.geocodeAirport(params.iata)    
      def airport = new Airport(params + results)
      if(!airport.hasErrors() && airport.save()) {
          flash.message = "Airport ${airport.id} created"
          redirect(action:show,id:airport.id)
      }
      else {
          render(view:'create',model:[airport:airport])
      }
  }  
  
  
}