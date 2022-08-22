class ServicesSerializer
  attr_reader :services, :total_services

  def initialize(services, total_services: false)
    @services = services
    @total_services = total_services
  end

  def attributes
    all_services = services.map do |service|
      {
        service_id: service.id,
        service_name: service.name
      }
    end
    response = { services: all_services }

    response.tap do
      response[:total_services] = (total_services.is_a?(Integer) ? total_services : Service.count) if total_services.present?
    end
  end
end
