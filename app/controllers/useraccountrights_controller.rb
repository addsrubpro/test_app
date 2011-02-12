class UseraccountrightsController < ApplicationController
  # view and manage useraccount right assignments
  def rightassignment
    @rights = Right.all
    unless params[:username].nil?
      @useraccount = Useraccount.find_by_username(params[:username])
      $username = params[:username]
    end
    
    if @useraccount.nil?
      flash.now[:notice] = "No useraccount found."
    end
    
    respond_to do |format|
      format.html # rightassignment.html.erb
      format.xml  { render :xml => @useraccountrights }
    end
  end
  
  # assign rights to useraccounts
  def assign
    a = Useraccount.find_by_username(params[:username])
    b = Right.find(params[:right_id])
    a.rights << b
    
    redirect_to :action => 'rightassignment', :username => params[:username]
  end
  
  # revoke rights from useraccounts
  def revoke
    a = Useraccount.find_by_username(params[:username])
    b = Right.find(params[:right_id])
    a.rights.delete(b)
    
    redirect_to :action => 'rightassignment', :username => params[:username]
  end
  
  # GET /useraccountrights
  # GET /useraccountrights.xml
  def index
    @useraccountrights = Useraccountright.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @useraccountrights }
    end
  end

  # GET /useraccountrights/1
  # GET /useraccountrights/1.xml
  def show
    @useraccountright = Useraccountright.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @useraccountright }
    end
  end

  # GET /useraccountrights/new
  # GET /useraccountrights/new.xml
  def new
    @useraccountright = Useraccountright.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @useraccountright }
    end
  end

  # GET /useraccountrights/1/edit
  def edit
    @useraccountright = Useraccountright.find(params[:id])
  end

  # POST /useraccountrights
  # POST /useraccountrights.xml
  def create
    @useraccountright = Useraccountright.new(params[:useraccountright])

    respond_to do |format|
      if @useraccountright.save
        format.html { redirect_to(@useraccountright, :notice => 'Useraccountright was successfully created.') }
        format.xml  { render :xml => @useraccountright, :status => :created, :location => @useraccountright }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @useraccountright.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /useraccountrights/1
  # PUT /useraccountrights/1.xml
  def update
    @useraccountright = Useraccountright.find(params[:id])

    respond_to do |format|
      if @useraccountright.update_attributes(params[:useraccountright])
        format.html { redirect_to(@useraccountright, :notice => 'Useraccountright was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @useraccountright.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /useraccountrights/1
  # DELETE /useraccountrights/1.xml
  def destroy
    @useraccountright = Useraccountright.find(params[:id])
    @useraccountright.destroy

    respond_to do |format|
      format.html { redirect_to(useraccountrights_url) }
      format.xml  { head :ok }
    end
  end
end
