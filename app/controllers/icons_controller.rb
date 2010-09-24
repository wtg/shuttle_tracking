class IconsController < ApplicationController
  # GET /icons
  # GET /icons.xml
  def index
    @icons = Icon.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @icons }
    end
  end

  # GET /icons/1
  # Just a quick preview of the raw image.
  def show
    @icon = Icon.find(params[:id])
    send_data @icon.file_contents, :filename => @icon.file_name, :type => @icon.file_type, :disposition => 'inline'
  end

  # GET /icons/new
  # GET /icons/new.xml
  def new
    @icon = Icon.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @icon }
    end
  end

  # GET /icons/1/edit
  def edit
    @icon = Icon.find(params[:id])
  end

  # POST /icons
  # POST /icons.xml
  def create
    @icon = Icon.new(params[:icon])

    respond_to do |format|
      if @icon.save
        format.html { redirect_to(@icon, :notice => 'Icon was successfully created.') }
        format.xml  { render :xml => @icon, :status => :created, :location => @icon }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @icon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /icons/1
  # PUT /icons/1.xml
  def update
    @icon = Icon.find(params[:id])

    respond_to do |format|
      if @icon.update_attributes(params[:icon])
        format.html { redirect_to(@icon, :notice => 'Icon was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @icon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /icons/1
  # DELETE /icons/1.xml
  def destroy
    @icon = Icon.find(params[:id])
    @icon.destroy

    respond_to do |format|
      format.html { redirect_to(icons_url) }
      format.xml  { head :ok }
    end
  end
end
