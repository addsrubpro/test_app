class PartiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :rescue_record_not_found
  
  # GET /parties
  # GET /parties.xml
  def index
    @parties = Party.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parties }
    end
  end

  # GET /parties/1
  # GET /parties/1.xml
  def show
    @party = Party.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @party }
    end
  end

  # GET /parties/new
  # GET /parties/new.xml
  def new
    if params[:application_id].nil?
      @party = Party.new
      @party.build_person       # for has_one
      @party.accounts.build     # for has_many
      @party.addresses.build    # for has_many
    else
      request = Application.find(params[:application_id])
      @party = Party.new(:payment_account => request.payment_account)
      @party.build_person(:name => request.name)
      @party.addresses.build(:street => request.street)
      @party.accounts.build(:account_number => request.account_number, :accounttype_id => request.accounttype_id)
    end  
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @party }
    end
  end

  # GET /parties/1/edit
  def edit
    @party = Party.find(params[:id])
  end

  # POST /parties
  # POST /parties.xml
  def create
    @party = Party.new(params[:party])

    respond_to do |format|
      if @party.save
        format.html { redirect_to(@party, :notice => 'Party was successfully created.') }
        format.xml  { render :xml => @party, :status => :created, :location => @party }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @party.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parties/1
  # PUT /parties/1.xml
  def update
    @party = Party.find(params[:id])

    respond_to do |format|
      if @party.update_attributes(params[:party])
        format.html { redirect_to(@party, :notice => 'Party was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @party.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parties/1
  # DELETE /parties/1.xml
  def destroy
    @party = Party.find(params[:id])
    @party.destroy

    respond_to do |format|
      format.html { redirect_to(parties_url) }
      format.xml  { head :ok }
    end
  end
  
protected
  # Rescue if record not found
  def rescue_record_not_found
    flash[:notice] = "No such entry found."
    redirect_to new_party_path
  end
end