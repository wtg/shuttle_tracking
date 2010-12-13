class IconsController < ApplicationController
  authorize_resource :except => [:rotate]
  caches_page :rotate
  cache_sweeper :icon_sweeper

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

  # GET /icons/1/rotate/90.png
  def rotate
    require 'RMagick'
    @icon = Icon.find(params[:id])
    
    image = Magick::ImageList.new
    image.from_blob(@icon.file_contents)
    #Keep the background transparent if we rotate it
    image.background_color = "none"

    destination = params[:heading].to_i
    #Force destination to be between 0 and 360
    if destination >= 360 || destination < 0
      redirect_to :heading => (destination % 360), :format => request.format.symbol, :status => :moved_permanently and return
    end

    #If we are crossing the 180-line we need to mirror the image first
    if (((@icon.heading < 180) && (destination > 180)) ||
       ((@icon.heading > 180) && (0 < destination && destination < 180)))
      image.flop!
    end

    #Rotate the image accordingly
    image.rotate!(destination - @icon.heading)

    case request.format
      when Mime::PNG
        image.format = "PNG"
      when Mime::JPG
        # Since JPGs don't support transparency, we have to do more work here.
        dest = Magick::Image.new(image.columns, image.rows)
        image = dest.composite(image, Magick::CenterGravity, Magick::OverCompositeOp)
        image.format = "JPEG"
      when Mime::GIF
        image.format = "GIF"
      else
        image.format = "PNG"
    end
    
    send_data image.to_blob, :filename => @icon.file_name, :type => request.format, :disposition => 'inline'    
  end

end
