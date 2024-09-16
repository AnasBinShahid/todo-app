class NotesController < ApplicationController
  include ActionView::RecordIdentifier

  def index
    @notes = Note.all.order(created_at: :desc)

    render :index
  end

  def new
    @note = Note.new

    render :new
  end

  def create
    @note = Note.new(params[:note].permit!)

    if @note.save
      flash[:success] = 'Note created Successfully!'
      redirect_to notes_path
    else
      puts "ERROR: #{@note.errors.full_messages.to_sentence}"
      flash[:errors] = @note.errors.full_messages.to_sentence

      redirect_to new_note_path
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(status: params[:status])
      respond_to do |format|
        format.turbo_stream {
          render turbo_stream:
            turbo_stream.replace(dom_id(@note, :status),
            partial: 'notes/note_status', locals: { note: @note })
        }

        format.html {
          redirect_to notes_path
          flash[:success] = "Note was successfully updated"
        }
      end
    else
      redirect_to new_note_path
      flash[:error] = "Something went wrong"
    end
  end
end
