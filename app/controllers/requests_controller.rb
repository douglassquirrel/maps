class RequestsController < ApplicationController
  # GET /requests
  # GET /requests.xml
  def index
    @requests = Request.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.xml
  def show
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.xml
  def new
    @request = Request.new

    respond_to do |format|
      format.html # new.html.erb
      format.voicexml # new.voicexml.rxml
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
  end

  # GET /requests/1/map
  def map
    @request = Request.find(params[:id])
    send_data (@request.map_data, :type => @request.map_content_type, 
                                  :disposition => 'inline')
  end

  # POST /requests
  # POST /requests.xml
  def create
    @request = Request.new(params[:request])
    if params[:latitude]  then @request[:latitude]  = params[:latitude]  end
    if params[:longitude] then @request[:longitude] = params[:longitude] end

    success = @request.save
    if success then
      @task = Task.new(:type_id => 5, :description => "Find a satellite map for a rescue team", :url => edit_request_url(@request))
      success = @task.save
    end

    respond_to do |format|
      if success
        flash[:notice] = 'Request was successfully created.'
        format.html { redirect_to(@request) }
        format.xml  { render :xml => @request, :status => :created, :location => @request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.xml
  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        flash[:notice] = 'Request was successfully updated.'
        format.html { redirect_to(@request) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.xml
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to(requests_url) }
      format.xml  { head :ok }
    end
  end
end
