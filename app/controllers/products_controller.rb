class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  before_filter :authenticate_user! , :except => [:mobileindex]

  def mobileindex
    #@products = Product.all
    #if current_user.products.empty?
      #@res=Product.find_by_user_id(4)
      @user=User.find(3)    
      @products=@user.products
  
     respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @products }
     end
    #else
     # redirect_to new_product_path
    #end 
  end

  def index
    #@products = Product.all
    #if current_user.products.empty?
      @products=current_user.products
  
     respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @products }
     end
    #else
     # redirect_to new_product_path
    #end 
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
   # @product.user_id = current_user.id
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
    @product.user_id = current_user.id 
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
