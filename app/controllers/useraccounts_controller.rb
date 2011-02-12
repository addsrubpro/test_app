class UseraccountsController < ApplicationController
  # GET /useraccounts
  # GET /useraccounts.xml
  def index
    @useraccounts = Useraccount.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @useraccounts }
    end
  end

  # GET /useraccounts/1
  # GET /useraccounts/1.xml
  def show
    @useraccount = Useraccount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @useraccount }
    end
  end

  # GET /useraccounts/new
  # GET /useraccounts/new.xml
  def new
    @useraccount = Useraccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @useraccount }
    end
  end

  # GET /useraccounts/1/edit
  def edit
    @useraccount = Useraccount.find(params[:id])
  end

  # POST /useraccounts
  # POST /useraccounts.xml
  def create
    @useraccount = Useraccount.new(params[:useraccount])

    respond_to do |format|
      if @useraccount.save
        format.html { redirect_to(@useraccount, :notice => 'Useraccount was successfully created.') }
        format.xml  { render :xml => @useraccount, :status => :created, :location => @useraccount }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @useraccount.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /useraccounts/1
  # PUT /useraccounts/1.xml
  def update
    @useraccount = Useraccount.find(params[:id])

    respond_to do |format|
      if @useraccount.update_attributes(params[:useraccount])
        format.html { redirect_to(@useraccount, :notice => 'Useraccount was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @useraccount.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /useraccounts/1
  # DELETE /useraccounts/1.xml
  def destroy
    @useraccount = Useraccount.find(params[:id])
    @useraccount.destroy

    respond_to do |format|
      format.html { redirect_to(useraccounts_url) }
      format.xml  { head :ok }
    end
  end
end
