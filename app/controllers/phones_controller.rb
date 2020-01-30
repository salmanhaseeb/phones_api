class PhonesController < ApplicationController
  # GET /phones
  def index
    @phones = Phone.pluck(:phone)

    render json: {phones: @phones}
  end


  # POST /phones
  def create
    @phone = Phone.new

    if @phone.save
      render json: {phone: @phone.phone}, status: :created
    else
      render json: @phone.errors, status: :unprocessable_entity
    end
  end

  def create_special
    @phone = Phone.create(phone: params[:phone].to_i)

    if @phone.save
      render json: {phone: @phone.phone}, status: :created
    else
      render json: @phone.errors, status: :unprocessable_entity
    end
  end
end
