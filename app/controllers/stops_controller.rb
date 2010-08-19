class StopsController < ApplicationController
  # GET /stops
  # GET /stops.xml
  def index
    @stops = Stop.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stops }
    end
  end

  # GET /stops/1
  # GET /stops/1.xml
  def show
    @stop = Stop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stop }
    end
  end

  # GET /stops/new
  # GET /stops/new.xml
  def new
    @stop = Stop.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stop }
    end
  end

  # GET /stops/1/edit
  def edit
    @stop = Stop.find(params[:id])
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

  # PUT /stops/1
  # PUT /stops/1.xml
  def update
    @stop = Stop.find(params[:id])

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

  # DELETE /stops/1
  # DELETE /stops/1.xml
  def destroy
    @stop = Stop.find(params[:id])
    @stop.destroy

    respond_to do |format|
      format.html { redirect_to(stops_url) }
      format.xml  { head :ok }
    end
  end
end
