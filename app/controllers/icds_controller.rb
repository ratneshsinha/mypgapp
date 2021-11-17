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
  end

  def process_file
    uploaded_file = params[:filename]
    full_filename_with_path = Rails.root.join('public', 'uploads', uploaded_file.original_filename)
    if uploaded_file != nil
      # render html: full_filename_with_path
      File.open(full_filename_with_path, 'wb') do |f|
        f.write(uploaded_file.read)
      end
    end

    fields = [
      { name: 'code', position: 0..7 },
      { name: 'description', position: 9..-1 }
    ]   
    FixedWidthFileParser.parse(full_filename_with_path.to_s, fields, force_utf8_encoding: false) do |row| 
      puts "ICD Code: \"#{row[:code]}\" & Description: \"#{row[:description]}\""
      icd = Icd.new
      icd.code = row[:code]
      icd.description = row[:description]
      icd.save
    end

    flash[:notice] = "ICD File uploaded sucessfully"
    redirect_to icds_path

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