class AccounttypesController < ApplicationController
  # GET /accounttypes
  # GET /accounttypes.xml
  def index
    @accounttypes = Accounttype.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accounttypes }
    end
  end

  # GET /accounttypes/1
  # GET /accounttypes/1.xml
  def show
    @accounttype = Accounttype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @accounttype }
    end
  end

  # GET /accounttypes/new
  # GET /accounttypes/new.xml
  def new
    @accounttype = Accounttype.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @accounttype }
    end
  end

  # GET /accounttypes/1/edit
  def edit
    @accounttype = Accounttype.find(params[:id])
  end

  # POST /accounttypes
  # POST /accounttypes.xml
  def create
    @accounttype = Accounttype.new(params[:accounttype])

    respond_to do |format|
      if @accounttype.save
        format.html { redirect_to(@accounttype, :notice => 'Accounttype was successfully created.') }
        format.xml  { render :xml => @accounttype, :status => :created, :location => @accounttype }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @accounttype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accounttypes/1
  # PUT /accounttypes/1.xml
  def update
    @accounttype = Accounttype.find(params[:id])

    respond_to do |format|
      if @accounttype.update_attributes(params[:accounttype])
        format.html { redirect_to(@accounttype, :notice => 'Accounttype was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @accounttype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accounttypes/1
  # DELETE /accounttypes/1.xml
  def destroy
    @accounttype = Accounttype.find(params[:id])
    @accounttype.destroy

    respond_to do |format|
      format.html { redirect_to(accounttypes_url) }
      format.xml  { head :ok }
    end
  end
end
