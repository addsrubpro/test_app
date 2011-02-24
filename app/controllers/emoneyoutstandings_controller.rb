class EmoneyoutstandingsController < ApplicationController
  # GET /emoneyoutstandings
  # GET /emoneyoutstandings.xml
  def index
    @emoneyoutstandings = Emoneyoutstanding.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @emoneyoutstandings }
    end
  end

  # GET /emoneyoutstandings/1
  # GET /emoneyoutstandings/1.xml
  def show
    @emoneyoutstanding = Emoneyoutstanding.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @emoneyoutstanding }
    end
  end

  # GET /emoneyoutstandings/new
  # GET /emoneyoutstandings/new.xml
  def new
    @emoneyoutstanding = Emoneyoutstanding.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @emoneyoutstanding }
    end
  end

  # GET /emoneyoutstandings/1/edit
  def edit
    @emoneyoutstanding = Emoneyoutstanding.find(params[:id])
  end

  # POST /emoneyoutstandings
  # POST /emoneyoutstandings.xml
  def create
    @emoneyoutstanding = Emoneyoutstanding.new(params[:emoneyoutstanding])

    respond_to do |format|
      if @emoneyoutstanding.save
        format.html { redirect_to(@emoneyoutstanding, :notice => 'Emoneyoutstanding was successfully created.') }
        format.xml  { render :xml => @emoneyoutstanding, :status => :created, :location => @emoneyoutstanding }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @emoneyoutstanding.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /emoneyoutstandings/1
  # PUT /emoneyoutstandings/1.xml
  def update
    @emoneyoutstanding = Emoneyoutstanding.find(params[:id])

    respond_to do |format|
      if @emoneyoutstanding.update_attributes(params[:emoneyoutstanding])
        format.html { redirect_to(@emoneyoutstanding, :notice => 'Emoneyoutstanding was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @emoneyoutstanding.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /emoneyoutstandings/1
  # DELETE /emoneyoutstandings/1.xml
  def destroy
    @emoneyoutstanding = Emoneyoutstanding.find(params[:id])
    @emoneyoutstanding.destroy

    respond_to do |format|
      format.html { redirect_to(emoneyoutstandings_url) }
      format.xml  { head :ok }
    end
  end
end
