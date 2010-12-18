class StopsController < ApplicationController
  authorize_resource
	
  # GET /stops
  # GET /stops.xml
  def index
    if !params[:all].nil?
      @all_stops = true
      @stops = Stop.all
    else
      @all_stops = false
      @stops = Stop.enabled
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @stops.to_xml(
        :include => { 
          :routes => {
            :only => [:name, :id] 
          } 
        }
      ) }
      format.js { render :json => @stops.to_json(
        :include => {
          :routes => {
            :only => [:name, :id]
          }
        }
      ) }
      format.kml
    end
  end

  # GET /stops/union
  # GET /stops/union.xml
  def show
    @stop = Stop.where(:short_name => params[:id]).first

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stop.to_xml(
        :include => { 
          :routes => {
            :only => [:name, :id] 
          } 
        }
      ) }
      format.kml
    end
  end

  # GET /stops/new
  # GET /stops/new.xml
  def new
    @stop = Stop.new({:latitude => MAP_CENTER[:lat], :longitude => MAP_CENTER[:long]})

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stop }
    end
  end

  # GET /stops/union/edit
  def edit
    @stop = Stop.where(:short_name => params[:id]).first
  end

  # POST /stops
  # POST /stops.xml
  def create
    @stop = Stop.new(params[:stop])

    respond_to do |format|
      if @stop.save
        format.html { redirect_to(@stop, :notice => 'Stop was successfully created.') }
        format.xml  { render :xml => @stop, :status => :created, :location => @stop }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stops/union
  # PUT /stops/union.xml
  def update
    @stop = Stop.where(:short_name => params[:id]).first

    respond_to do |format|
      if @stop.update_attributes(params[:stop])
        format.html { redirect_to(@stop, :notice => 'Stop was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stops/union
  # DELETE /stops/union.xml
  def destroy
    @stop = Stop.where(:short_name => params[:id]).first
    @stop.destroy

    respond_to do |format|
      format.html { redirect_to(stops_url) }
      format.xml  { head :ok }
    end
  end
end
