class ClearingoutsController < ApplicationController  
  # GET /clearingouts
  # GET /clearingouts.xml
  def index
    @clearingouts = Clearingout.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clearingouts }
    end
  end

  # GET /clearingouts/1
  # GET /clearingouts/1.xml
  def show
    @clearingout = Clearingout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @clearingout }
    end
  end

  # GET /clearingouts/new
  # GET /clearingouts/new.xml
  def new
    @clearingout = Clearingout.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @clearingout }
    end
  end

  # GET /clearingouts/1/edit
  def edit
    @clearingout = Clearingout.find(params[:id])
  end

  # POST /clearingouts
  # POST /clearingouts.xml
  def create
    @clearingout = Clearingout.new(params[:clearingout])

    respond_to do |format|
      if @clearingout.save
        format.html { redirect_to(@clearingout, :notice => 'Clearingout was successfully created.') }
        format.xml  { render :xml => @clearingout, :status => :created, :location => @clearingout }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @clearingout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clearingouts/1
  # PUT /clearingouts/1.xml
  def update
    @clearingout = Clearingout.find(params[:id])

    respond_to do |format|
      if @clearingout.update_attributes(params[:clearingout])
        format.html { redirect_to(@clearingout, :notice => 'Clearingout was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @clearingout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clearingouts/1
  # DELETE /clearingouts/1.xml
  def destroy
    @clearingout = Clearingout.find(params[:id])
    @clearingout.destroy

    respond_to do |format|
      format.html { redirect_to(clearingouts_url) }
      format.xml  { head :ok }
    end
  end
end
