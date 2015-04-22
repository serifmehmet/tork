class Admin::MakeTypesController < ApplicationController
  before_action :authenticate_user!, :is_admin_control!
	layout "admin/admin"

  def index
  	@make_types = MakeEngineType.sorted
  end

  def new
  	@make_type = MakeEngineType.new
  end

  def create
  	@make_type = MakeEngineType.new(make_engine_type_params)

  	if @make_type.save
  		flash[:notice] = "'#{@make_type.make_type_name}' motor tipi oluşturulmuştur."
  		redirect_to :action => 'index'
  	else
  		flash[:alert] = "'#{@make_type.make_type_name}' motor tipi oluşturulurken bir hata oldu. Lütfen tekrar deneyiniz!"
  		render('new')
  	end
  end

  def edit
  	@make_type = MakeEngineType.find(params[:id])
  end

  def update
  	@make_type = MakeEngineType.find(params[:id])

  	if @make_type.update_attributes(make_engine_type_params)
  		flash[:notice] = "'#{@make_type.make_type_name}' motor tipi başarıyla güncellenmiştir."
  		redirect_to :action => 'index'
  	else
  		flash[:alert] = "'#{@make_type.make_type_name}' motor tipi güncellenirken bir hata oluştu. Lütfen tekrar deneyiniz!"
  		render('edit')
  	end
  end

  def delete
  	@make_type = MakeEngineType.find(params[:id])
  end

  def destroy
  	@make_type = MakeEngineType.find(params[:id]).destroy
  	flash[:notice] = "'#{@make_type.make_type_name}' motor tipi başarıyla silinmiştir!"
  	redirect_to :action => 'index'
  end

  private
  	def make_engine_type_params
  		params.require(:make_engine_type).permit(:brand_make_id, :make_type_name, :meta_keywords)
  	end
end
