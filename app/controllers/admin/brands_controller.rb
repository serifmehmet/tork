class Admin::BrandsController < ApplicationController
  
	layout "admin/admin"
  def index
  	@brands = Brand.all
  end

  def edit
  	@brand = Brand.find(params[:id])
  end

  def delete
  	@brand = Brand.find(params[:id])
  end

  def new
  	@brand = Brand.new

  end

  def create
  	@brand = Brand.new(brand_params)
  	
  	if @brand.save
      flash[:notice] = "Marka başarıyla oluşturulmuştur"
      redirect_to(:action => 'index')
    else
      flash[:alert] = "Marka oluşturulurken bir hata oluştu"
      render('new')
    end
  end

  def update
  	@brand = Brand.find(params[:id])

  	if @brand.update_attributes(brand_params)
  		flash[:notice] = "Marka başarıyla güncellenmiştir."
  		redirect_to(:action => 'index')
  	else
  		flash[:alert] = "Marka güncellemesi sırasında bir hata oluştu."
  		render('edit')
  	end
  end

  def destroy
  	@brand = Brand.find(params[:id]).destroy

  	flash[:notice] = "#{@brand.brand_name} başarıyla silinmiştir."
  	redirect_to(:action => 'index')
  end

  private

  	def brand_params
      params.require(:brand).permit(:brand_name, :meta_keywords)
    end
end
