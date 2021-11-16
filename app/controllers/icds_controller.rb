class IcdsController < ApplicationController
  before_action :set_icd, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @icds = Icd.all
  end

  def new
  end

  def create
    @icd = Icd.new(icd_params)
  
    if @icd.save
      flash[:notice] = "ICD Record created successfully"
      redirect_to @icd
    else
      render 'new'
    end    
  end

  def edit
  end

  def update
    if @icd.update(icd_params)
      flash[:notice] = "ICD Record updated sucessfully"
      redirect_to @icd
    else
      render 'edit'
    end
  end

  def destroy
    @icd.destroy
    redirect_to icds_path
  end

  def upload
    # fields = [
    #   { code: 'code', position: 0..7 },
    #   { description: 'description', position: 9..-1 }
    # ]   
    # FixedWidthFileParser.parse(params[:file], fields, force_utf8_encoding: false) do |row| 
      # puts row
    # end
    # uploaded_file = params[:file]
    # render html: 
    # if uploaded_file != nil
    #   File.open(Rails.root.join('public', 'uploads', uploaded_file), 'wb') do |f|
    #       f.write(uploaded_file.read)
    #   end
    # end
  end

  def search
  end

  private
  def set_icd
    @icd = Icd.find(params[:id])
  end

  def icd_params
    params.require(:icd).permit(:code, :description)
  end
end