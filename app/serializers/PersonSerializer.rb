class PersonSerializer
  def initialize(person)
    @person = person
  end

  def as_json(*)
    data = {
    	id: @person.id.to_s,
    	first_name: @person.first_name,
    	second_name: @person.second_name,
      address: @person.address,
      phone_number: @person.phone_number
    }
    data[:errors] = @person.errors if @person.errors.any?
    data
  end
end