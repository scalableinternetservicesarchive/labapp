class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /communities
  # GET /communities.json
  def index
    @communities = Community.all
    respond_with @communities
  end

  # GET /communities/1
  # GET /communities/1.json
  def show
  end

  # GET /communities/new
  def new
    @community = Community.new
    respond_with @community
  end

  # GET /communities/1/edit
  def edit
  end

  # POST /communities
  # POST /communities.json
  def create
    @community = Community.new(community_params)
    flash[:notice] = 'Community was successfully created.' if @community.save
    respond_with @community
  end

  # PATCH/PUT /communities/1
  # PATCH/PUT /communities/1.json
  def update
    flash[:notice] = 'Community was successfully updated.' if @community.update(community_params)
    respond_with @community
  end

  # DELETE /communities/1
  # DELETE /communities/1.json
  def destroy
    @community.destroy
    flash[:notice] = 'Community was successfully destroyed.'
    respond_with @community
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community
      @community = Community.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_params
      params.require(:community).permit(:name)
    end
end
