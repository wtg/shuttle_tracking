class RoutesController < ApplicationController
  # GET /routes
  # GET /routes.xml
  def index
    @routes = Route.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @routes }
    end
  end

  # GET /routes/1
  # GET /routes/1.xml
  def show
    @route = Route.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @route }
    end
  end

  # GET /routes/new
  # GET /routes/new.xml
  def new
    @route = Route.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @route }
    end
  end

  # GET /routes/1/edit
  def edit
    @route = Route.find(params[:id])
  end

  # POST /routes
  # POST /routes.xml
  def create
    @route = Route.new(params[:route])

    respond_to do |format|
      if @route.save
        format.html { redirect_to(@route, :notice => 'Route was successfully created.') }
        format.xml  { render :xml => @route, :status => :created, :location => @route }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @route.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /routes/1
  # PUT /routes/1.xml
  def update
    @route = Route.find(params[:id])

    respond_to do |format|
      if @route.update_attributes(params[:route])
        format.html { redirect_to(@route, :notice => 'Route was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @route.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1
  # DELETE /routes/1.xml
  def destroy
    @route = Route.find(params[:id])
    @route.destroy

    respond_to do |format|
      format.html { redirect_to(routes_url) }
      format.xml  { head :ok }
    end
  end
end
