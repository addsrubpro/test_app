class PartyrelationshipsController < ApplicationController
  # list possessions to a principal
  def relationshipassignment
    unless params[:party_id].nil?
      party = Party.find(params[:party_id])
      @possessions = party.possessions.order("id asc")
      $party_id = (params[:party_id])
    end
    
    respond_to do |format|
      format.html # relationshipassignment.html.erb
      format.xml  { render :xml => @useraccountrights }
    end
  end
  
  # assign possession to principal
  def assignpossession
    principal = Party.find(params[:party_id])
    possession = Party.find(params[:possession_id])
    principal.possessions << possession
    Partyrelationship.find_by_principal_id_and_possession_id(principal,possession).update_attributes(:interest => params[:interest])
    
    redirect_to :action => 'relationshipassignment', :party_id => $party_id
  end
  
  # remove possession from principal
  def possessionrevoke
    party = Party.find(params[:party_id])
    possession = party.possessions.find(params[:possession_id])
    party.possessions.delete(possession)
    
    redirect_to :action => 'relationshipassignment', :party_id => params[:party_id]
  end
   
  # GET /partyrelationships
  # GET /partyrelationships.xml
  def index
    @partyrelationships = Partyrelationship.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @partyrelationships }
    end
  end

  # GET /partyrelationships/1
  # GET /partyrelationships/1.xml
  def show
    @partyrelationship = Partyrelationship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @partyrelationship }
    end
  end

  # GET /partyrelationships/new
  # GET /partyrelationships/new.xml
  def new
    @partyrelationship = Partyrelationship.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @partyrelationship }
    end
  end

  # GET /partyrelationships/1/edit
  def edit
    @partyrelationship = Partyrelationship.find(params[:id])
  end

  # POST /partyrelationships
  # POST /partyrelationships.xml
  def create
    @partyrelationship = Partyrelationship.new(params[:partyrelationship])

    respond_to do |format|
      if @partyrelationship.save
        format.html { redirect_to(@partyrelationship, :notice => 'Partyrelationship was successfully created.') }
        format.xml  { render :xml => @partyrelationship, :status => :created, :location => @partyrelationship }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @partyrelationship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /partyrelationships/1
  # PUT /partyrelationships/1.xml
  def update
    @partyrelationship = Partyrelationship.find(params[:id])

    respond_to do |format|
      if @partyrelationship.update_attributes(params[:partyrelationship])
        format.html { redirect_to(@partyrelationship, :notice => 'Partyrelationship was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @partyrelationship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /partyrelationships/1
  # DELETE /partyrelationships/1.xml
  def destroy
    @partyrelationship = Partyrelationship.find(params[:id])
    @partyrelationship.destroy

    respond_to do |format|
      format.html { redirect_to(partyrelationships_url) }
      format.xml  { head :ok }
    end
  end
end
