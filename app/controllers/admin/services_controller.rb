class Admin::ServicesController < ApplicationController
	before_action :auth_user!, :is_admin_control!

	layout "admin/admin"
  def index
  	@services = Service.all
  end

  def new
  	@service = Service.new
    @images = @service.images.build

  end

  def create
    @service = Service.new(service_params)

    if @service.save
      
        
      @image_title = @service.images.create!(:image => params[:service][:images_title][:image], :imageable_id => @service.id, :image_type => params[:service][:images_title][:image_type])
      @icon_image = @service.images.create!(:image => params[:service][:images_icon][:image], :imageable_id => @service.id, :image_type => params[:service][:images_icon][:image_type])
      
      # if params[:images_icon]

      # end
      
      flash[:notice] = "Hizmet sayfası başarıyla oluşturuldu!"
      redirect_to admin_services_path
    else
      flash[:alert] = "Hizmet sayfası eklenirken bir hata oluştu. Lütfen tekrar deneyiniz!"
      render "new"
    end
  end

  def edit
    @service = Service.find(params[:id])
    @images = @service.images.build
  end

  def update
    @service = Service.find(params[:id])

    if @service.update_attributes(service_params)
      flash[:notice] = "'#{@service.service_name}' isimli hizmet başarıyla güncellendi"
      redirect_to admin_services_path
    else
      flash[:alert] = "'#{@service.service_name}' hizmet sayfası güncellenirken bir hata oluştu. Lütfen tekrar deneyiniz!"
      render "edit"
    end
  end

  def delete
    @service = Service.find(params[:id])
  end

  def destroy
    @service = Service.find(params[:id]).destroy

    flash[:notice] = "'#{@service.service_name}' sayfası başarıyla silinmiştir!"
    redirect_to admin_services_path
  end

   private

  	def service_params
      params.require(:service).permit(:service_name, :service_description, :meta_keywords, 
        images_title_attributes: [:id, :imageable_id, :image], images_icon_attributes: [:id, :imageable_id, :image])
    end
end
