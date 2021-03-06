class RelationshipsController < ApplicationController
  before_action :set_relationship, only: [:show, :edit, :update, :destroy]
  
  def index
    @participant = Participant.find(params[:participant_id])
    @relationships = @participant.relationships
  end
  
  def show
  end
  
  def edit
  end
  
  def new
    @participant = Participant.find(params[:participant_id])
    @relationship = @participant.relationships.new
  end
  
  def create
     @participant = Participant.find(params[:participant_id])
    @relationship = @participant.relationships.new(relationship_params)
    respond_to do |format|
      if @relationship.save
        format.html { redirect_to participant_relationship_path(@participant, @relationship), notice: 'Relationship was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @relationship.update(relationship_params)
        format.html { redirect_to participant_relationship_path(@participant, @relationship), notice: 'Relationship was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end
  
  def destroy
    @relationship.destroy
    respond_to do |format|
      format.html { redirect_to participant_relationships_path(@participant) }
    end
  end
  
  private
  def set_relationship
    @participant = Participant.find(params[:participant_id])
    @relationship = @participant.relationships.find(params[:id])
    end

  def relationship_params
    params.require(:relationship).permit(:participant_owner_uuid, :participant_related_uuid, :uuid, :relationship_type_id)
  end
  
end
