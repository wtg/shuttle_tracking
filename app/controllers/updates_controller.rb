class UpdatesController < ApplicationController
  before_filter :get_vehicle
  before_filter :app_auth, :only => [:create]
  authorize_resource :except => [:create]
  
  def get_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  # GET /updates
  # GET /updates.xml
  def index
    @updates = @vehicle.updates.page(params[:page]).per(30)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @updates }
    end
  end

  # GET /updates/new
  # GET /updates/new.xml
  def new
    @update = Update.new({:vehicle => @vehicle})

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @update }
    end
  end

  # GET /updates/1/edit
  def edit
    @update = Update.find(params[:id])
  end

  # POST /updates
  # POST /updates.xml
  def create
    @update = Update.new(params[:update])
    @update.vehicle = @vehicle

    respond_to do |format|
      if @update.save
        format.html { redirect_to(vehicle_updates_url, :notice => 'Update was successfully created.') }
        format.xml  { render :xml => @update, :status => :created, :location => [@vehicle, @update] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @update.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /updates/1
  # PUT /updates/1.xml
  def update
    @update = Update.find(params[:id])

    respond_to do |format|
      if @update.update_attributes(params[:update])
        format.html { redirect_to(vehicle_updates_url, :notice => 'Update was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @update.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /updates/1
  # DELETE /updates/1.xml
  def destroy
    @update = Update.find(params[:id])
    @update.destroy

    respond_to do |format|
      format.html { redirect_to(vehicle_updates_url) }
      format.xml  { head :ok }
    end
  end

  protected
    def app_auth
      authenticate_or_request_with_http_basic do |user_name, password|
        defined?(REMOTE_ACCESS) && REMOTE_ACCESS[:enabled] &&
        user_name == REMOTE_ACCESS[:username] && password == REMOTE_ACCESS[:password]
      end
    end
end
