module PatientsHelper
  def format_address(addr)
    [addr.city + (!(addr.city.nil? || addr.city.empty?) && !(addr.street.nil? || addr.street.empty?) ? ',' : '' ), 
     addr.street,
     addr.house + (!(addr.house.nil? || addr.house.empty?) && !addr.appartment.nil? ? ',' : '' ),
     addr.appartment].join(' ')
  end
end
