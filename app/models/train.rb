class Train

  attr_accessor :name, :status, :label, :id

  def initialize(hash)
    @id = hash["id"]
    @name = hash["name"]
    @status = hash["status"]
    @label = hash ["label"]
  end

  def self.find(id)
    return Train.new(Unirest.get("http://localhost:3000/trains/#{id}.json").body)
  end

  def self.all
    trains = []
    raw_train_data = Unirest.get("http://localhost:3000/trains.json").body
    raw_train_data.each do |train_data|
      trains << Train.new(train_data)
    end
    return trains
  end



end