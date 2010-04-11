class TransactionsController < ApplicationController
  load_and_authorize_resource
  # GET /transactions
  # GET /transactions.xml
  def index
    @transactions = current_user.transactions.current.group_by(&:bucket_id)
  end

  # GET /transactions/1
  # GET /transactions/1.xml
  def show
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction }
    end
  end

  # GET /transactions/new
  # GET /transactions/new.xml
  def new
    @transaction = Transaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
  end

  # POST /transactions
  # POST /transactions.xml
  def create
    @transaction = Transaction.new(params[:transaction])
    if @transaction.save
      #flash[:notice] = 'Transaction was successfully created.'
      render :update do |page|
        page.insert_html :bottom, "bucket_#{@transaction.bucket_id}", :partial => "transaction_line", :object => @transaction
        page.visual_effect :highlight, "bucket_#{@transaction.bucket_id}_name", :duration => 2.0
        page.visual_effect :highlight, "transaction_#{@transaction.id}", :duration => 2.0
      end
    else
      respond_to do |format|
        format.html { render :action => "index" }
        format.xml  { render :xml => @transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.xml
  def update
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        flash[:notice] = 'Transaction was successfully updated.'
        format.html { redirect_to(@transaction) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.xml
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to(transactions_url) }
      format.xml  { head :ok }
    end
  end
end
