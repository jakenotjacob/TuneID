class TunesController < ApplicationController
  before_action :set_tune, only: [:show, :edit, :update, :destroy]

  # GET /tunes
  # GET /tunes.json
  def index
    @tunes = Tune.all
  end

  # GET /tunes/1
  # GET /tunes/1.json
  def show
  end

  # GET /tunes/new
  def new
    @tune = Tune.new
  end

  # GET /tunes/1/edit
  def edit
  end

  # POST /tunes
  # POST /tunes.json
  def create
    @tune = Tune.new(parse_tune)

    respond_to do |format|
      if @tune.save
        format.html { redirect_to @tune, notice: 'Tune was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tune }
      else
        format.html { render action: 'new' }
        format.json { render json: @tune.errors, status: :unprocessable_entity }
      end
    end
  end

  def parse_tune
    file = params[:tune][:uploaded_file]
    extension = file.original_filename.split(".").last
    file_path = Rails.root.join('public', 'uploads', "temp_tune.#{extension}")
    File.open( file_path, 'wb') do |f|
      f.write(file.read)
    end
    TagLib::FileRef.open( file_path.to_s ) do |t|
      tag = t.tag
      { artist: tag.artist, album: tag.album, title: tag.title }
    end
    #Cleanup file after use
    #File.delete file_path
  end

    # PATCH/PUT /tunes/1
    # PATCH/PUT /tunes/1.json
  def update
    respond_to do |format|
      if @tune.update(tune_params)
        format.html { redirect_to @tune, notice: 'Tune was successfully updated.' }
        format.json { head :no_content } 
      else
        format.html { render action: 'edit' }
        format.json { render json: @tune.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tunes/1
  # DELETE /tunes/1.json
  def destroy
    @tune.destroy
    respond_to do |format|
      format.html { redirect_to tunes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tune
      @tune = Tune.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tune_params
      params.require(:tune).permit(:artist, :album, :title)
    end
end
