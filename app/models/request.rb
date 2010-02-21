class Request < ActiveRecord::Base
  def map_file=(input_data)
    self.map_content_type = input_data.content_type.chomp
    self.map_data = input_data.read
  end
end
