class TrainsController < ApplicationController

  def index
    @trains = Unirest.get("http://localhost:3000/trains.json").body
  end


  def show
    @train = Unirest.get("http://localhost:3000/trains/#{params[:id]}.json").body
    puts "See Hash in Terminal"
    puts @train
  end

  def create
    @train = Unirest.post("http://localhost:3000/trains.json",
              headers:{ "Accept" => "application/json" },
              parameters: {:train =>
                            {
                            :name => params[:name],
                            :status => params[:status]
                            }
                          }
              ).body
    puts "QWERRQRERQEW"
    puts @train
    redirect_to train_path(@train["id"])
  end

  def edit
    @train = Unirest.get("http://localhost:3000/trains/#{params[:id]}.json", headers:{ "Accept" => "application/json" }).body
  end


  def update
    @train = Unirest.patch("http://localhost:3000/trains/#{params[:id]}.json",
              headers:{ "Accept" => "application/json" },
              parameters: {:train =>
                            {
                            :name => params[:name],
                            :status => params[:status]
                            }
                          }
              ).body
    puts "QWERRQRERQEW"
    puts @train
    redirect_to train_path(@train["id"])
  end

  def destroy
    Unirest.delete("http://localhost:3000/trains/#{params[:id]}.json",
      headers:{ "Accept" => "application/json"})

    redirect_to trains_path
  end

  # def edit
  #   @person = Unirest.get("http://localhost:3000/people/#{params[:id]}.json", 
  #                 headers:{ "Accept" => "application/json" }).body
  # end

  # def create
  #   @person = Unirest.post("http://localhost:3000/people.json",
  #             headers:{ "Accept" => "application/json" },
  #             parameters: { :person => 
  #                           {
  #                             :first_name => params[:first_name],
  #                             :middle_name => params[:middle_name],
  #                             :last_name => params[:last_name],
  #                             :suffix => params[:suffix],
  #                             :email => params[:email],
  #                             :phone => params[:phone]
  #                           }
  #                         }
  #             ).body

  #   redirect_to person_path(@person["id"])
  # end



end
