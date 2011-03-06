class RequeststatusesController < ApplicationController
  # GET /requeststatuses
  # GET /requeststatuses.xml
  def index
    @requeststatuses = Requeststatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requeststatuses }
    end
  end

  # GET /requeststatuses/1
  # GET /requeststatuses/1.xml
  def show
    @requeststatus = Requeststatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @requeststatus }
    end
  end

  # GET /requeststatuses/new
  # GET /requeststatuses/new.xml
  def new
    @requeststatus = Requeststatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @requeststatus }
    end
  end

  # GET /requeststatuses/1/edit
  def edit
    @requeststatus = Requeststatus.find(params[:id])
  end

  # POST /requeststatuses
  # POST /requeststatuses.xml
  def create
    @requeststatus = Requeststatus.new(params[:requeststatus])

    respond_to do |format|
      if @requeststatus.save
        format.html { redirect_to(@requeststatus, :notice => 'Requeststatus was successfully created.') }
        format.xml  { render :xml => @requeststatus, :status => :created, :location => @requeststatus }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @requeststatus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requeststatuses/1
  # PUT /requeststatuses/1.xml
  def update
    @requeststatus = Requeststatus.find(params[:id])

    respond_to do |format|
      if @requeststatus.update_attributes(params[:requeststatus])
        format.html { redirect_to(@requeststatus, :notice => 'Requeststatus was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @requeststatus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requeststatuses/1
  # DELETE /requeststatuses/1.xml
  def destroy
    @requeststatus = Requeststatus.find(params[:id])
    @requeststatus.destroy

    respond_to do |format|
      format.html { redirect_to(requeststatuses_url) }
      format.xml  { head :ok }
    end
  end
end
