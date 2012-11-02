class TracksController < ApplicationController
  before_filter :find_the_project

  def new
    @track = Track.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @track }
    end
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = Track.new(params[:track])
    @track.project_id = @project.id
    
    respond_to do |format|
      if @track.save
        format.html { redirect_to @project, notice: 'Track was successfully created.' }
        format.json { render json: @track, status: :created, location: @project }
      else
        format.html { redirect_to @project, notice: 'Error' }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tracks/1
  # PUT /tracks/1.json
  def update
    @track = @project.tracks.find(params[:id])
    @track.stopped_at = Time.now
    respond_to do |format|
      if @track.save
        format.html { redirect_to @project, notice: 'Track was successfully stopped.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @project, notice: 'error' }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @track = @project.tracks.find(params[:id])
    @track.destroy

    respond_to do |format|
      format.html { redirect_to @project }
      format.json { head :no_content }
    end
  end
  protected
  def find_the_project
    @project = current_user.projects.find(params[:project_id])
  end
end
