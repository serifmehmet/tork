class Admin::BrandMakesController < ApplicationController
  before_action :auth_user!, :is_admin_control!
	layout "admin/admin"
  def index
  	@brand_makes = BrandMake.all
  end

  def new
  	@brand_make = BrandMake.new
  end

  def create
  	@brand_make = BrandMake.new(brand_make_params)

  	if @brand_make.save
  		flash[:notice] = "Model başarıyla oluşturulmuştur."
  		redirect_to :action => 'index'
  	else
  		flash[:alert] = "Model oluşturulurken bir hata oluştu. Lütfen tekrar deneyiniz!"
  		render('new')
  	end

  end

  def edit
  	@brand_make = BrandMake.find(params[:id])
  end

  def update
  	@brand_make = BrandMake.find(params[:id])

  	if @brand_make.update_attributes(brand_make_params)
  		flash[:notice] = "#{@brand_make.brand.brand_name} markasına ait #{@brand_make.make_name} modeli başarıyla güncellenmiştir."
  		redirect_to :action => 'index'
  	else
  		flash[:alert] = "Model güncellenirken bir hata oluştu. Lütfen tekrar deneyiniz!"
  		render('edit')
  	end
  end

  def delete
  	@brand_make = BrandMake.find(params[:id])

  end

  def destroy
  	@brand_make = BrandMake.find(params[:id]).destroy
  	flash[:notice] = "#{@brand_make.make_name} başarıyla silinmiştir."

  	redirect_to :action => 'index'
  end

   private

  	def brand_make_params
      params.require(:brand_make).permit(:brand_id, :make_name, :meta_keywords)
    end
end
