class EmoneyoutsController < ApplicationController
  # GET /emoneyouts
  # GET /emoneyouts.xml
  def index
    @emoneyouts = Emoneyout.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @emoneyouts }
    end
  end

  # GET /emoneyouts/1
  # GET /emoneyouts/1.xml
  def show
    @emoneyout = Emoneyout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @emoneyout }
    end
  end

  # GET /emoneyouts/new
  # GET /emoneyouts/new.xml
  def new
    @emoneyout = Emoneyout.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @emoneyout }
    end
  end

  # GET /emoneyouts/1/edit
  def edit
    @emoneyout = Emoneyout.find(params[:id])
  end

  # POST /emoneyouts
  # POST /emoneyouts.xml
  def create
    @emoneyout = Emoneyout.new(params[:emoneyout])

    respond_to do |format|
      if @emoneyout.save
        format.html { redirect_to(@emoneyout, :notice => 'Emoneyout was successfully created.') }
        format.xml  { render :xml => @emoneyout, :status => :created, :location => @emoneyout }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @emoneyout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /emoneyouts/1
  # PUT /emoneyouts/1.xml
  def update
    @emoneyout = Emoneyout.find(params[:id])

    respond_to do |format|
      if @emoneyout.update_attributes(params[:emoneyout])
        format.html { redirect_to(@emoneyout, :notice => 'Emoneyout was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @emoneyout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /emoneyouts/1
  # DELETE /emoneyouts/1.xml
  def destroy
    @emoneyout = Emoneyout.find(params[:id])
    @emoneyout.destroy

    respond_to do |format|
      format.html { redirect_to(emoneyouts_url) }
      format.xml  { head :ok }
    end
  end
end
