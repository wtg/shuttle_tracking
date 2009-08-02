class ShuttlesController < ApplicationController
  # GET /shuttles
  # GET /shuttles.xml
  def index
    @shuttles = Shuttle.find(:all, :order=>:name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shuttles }
    end
  end

  # GET /shuttles/1
  # GET /shuttles/1.xml
  def show
    @shuttle = Shuttle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shuttle }
    end
  end

  # GET /shuttles/new
  # GET /shuttles/new.xml
  def new
    @shuttle = Shuttle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shuttle }
    end
  end

  # GET /shuttles/1/edit
  def edit
    @shuttle = Shuttle.find(params[:id])
  end

  # POST /shuttles
  # POST /shuttles.xml
  def create
    @shuttle = Shuttle.new(params[:shuttle])

    respond_to do |format|
      if @shuttle.save
        flash[:notice] = 'Shuttle was successfully created.'
        format.html { redirect_to(@shuttle) }
        format.xml  { render :xml => @shuttle, :status => :created, :location => @shuttle }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shuttle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shuttles/1
  # PUT /shuttles/1.xml
  def update
    @shuttle = Shuttle.find(params[:id])

    respond_to do |format|
      if @shuttle.update_attributes(params[:shuttle])
        flash[:notice] = 'Shuttle was successfully updated.'
        format.html { redirect_to(@shuttle) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shuttle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shuttles/1
  # DELETE /shuttles/1.xml
  def destroy
    @shuttle = Shuttle.find(params[:id])
    @shuttle.destroy

    respond_to do |format|
      format.html { redirect_to(shuttles_url) }
      format.xml  { head :ok }
    end
  end
  
  
end
