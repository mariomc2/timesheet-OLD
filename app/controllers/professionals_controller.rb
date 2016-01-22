class ProfessionalsController < ApplicationController
  
  layout "professional"

  def index
    @professionals = Professional.sorted_name
  end

  def show
    @professional = Professional.find(params[:id])
  end

  def new
    @professional = Professional.new
  end

  def create
    # Instantiate a new object using form parameters
    @professional = Professional.new(professional_params)
    # Save the object
    if @professional.save
    # If save succeeds, redirect to the index action
      flash[:notice] = "Profesional creado satisfactoriamente."
      redirect_to(:action => 'index')
    else
    # If save fails, redisplay the from so user can fix problems
      render('new')
    end
  end

  def edit
    @professional = Professional.find(params[:id])
  end

  def update
    # Find and existing object using form parameters
    @professional = Professional.find(params[:id])
    # Update the object
    if @professional.update_attributes(professional_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Profesional actualizado satisfactoriamente."
      redirect_to(:action => 'show', :id => @professional.id)
    else
      # If save fails, redisplay the from so user can fix problems
      render('edit')
    end
  end

  def delete
    @professional = Professional.find(params[:id])
  end

  def destroy
    professional = Professional.find(params[:id]).destroy
    flash[:notice] = "Profesional '#{professional.email}' borrado satisfactoriamente."
    redirect_to(:action => 'index')
  end

  private

    def professional_params
      # same as using "params[:professional]", except taht it:
      # - raises an error if :professional is not present
      # - allows listed attributes to be mass-assigned
      params.require(:professional).permit(:first_name, :last_name, :id_code, :dob, :email, :speciality)
    end
end
