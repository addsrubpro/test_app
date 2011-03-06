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
    @party = Party.new
    if params[:request_id].nil?
      @party.build_person       # for has_one
      @party.accounts.build     # for has_many
      @party.addresses.build    # for has_many
    else
      request = Request.find(params[:request_id])
      # Account attributes
      @party.accounts.build(:accounttype_id => request.accounttype_id)
      # Person attributes
      @party.build_person(:title_id => request.title_id,
                          :degree => request.degree,
                          :first_name => request.first_name,
                          :middle_name => request.middle_name,
                          :last_name => request.last_name,
                          :email => request.email,
                          :telephone => request.telephone,
                          :birth_date => request.birth_date,
                          :birth_place => request.birth_place )
      # Party attributes
      @party.payment_iban = request.payment_iban
      # Address attributes
      @party.addresses.build(:street => request.street,
                             :housenumber => request.housenumber,
                             :postal_supplement => request.postal_supplement,
                             :zipcode => request.zipcode,
                             :city => request.city,
                             :country_id => request.country_id )
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
        flash[:success] = "Party was successfully created."
        format.html { redirect_to(@party) }
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
        flash[:success] = "Party was successfully updated."
        format.html { redirect_to(@party) }
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