class NotesController < ApplicationController
  before_action :authenticate_user!

  def new
  	@note = Note.new
  end

  def create
  	@note = note.new(note_params)
  	@note.update_attribute("user", current_user)
  	if @note.save!
  		flash[:success] = "Note created successfully"
  		render :show
  	else
  		flash[:error] = @note.errors.full_messages
  		redirect_to new_note_path
  	end
  end

  def show
  	@note = Note.find params[:id]
  end

  def edit
  	@note = Note.find params[:id]
  end

  def update
  	@note = Note.find params[:id]
  	@note.update(note_params)
  	redirect_to notes_path
  end

  def destroy
  	 @note = Note.find params[:id]
  	 @note.destroy!
  	 redirect_to notes_path
  end

  private

  def note_params
  	params.require(:note).permit(:description)
  end


end
