class Api::ProfilesController < ApplicationController
  before_action :set_api_profile, only: [:show, :edit, :update, :destroy]

  # GET /api/profiles
  # GET /api/profiles.json
  def index
    @api_profiles = Api::Profile.all
  end

  # GET /api/profiles/1
  # GET /api/profiles/1.json
  def show
  end

  # GET /api/profiles/new
  def new
    @api_profile = Api::Profile.new
  end

  # GET /api/profiles/1/edit
  def edit
  end

  # POST /api/profiles
  # POST /api/profiles.json
  def create
    @api_profile = Api::Profile.new(api_profile_params)

    respond_to do |format|
      if @api_profile.save
        format.html { redirect_to @api_profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @api_profile }
      else
        format.html { render :new }
        format.json { render json: @api_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/profiles/1
  # PATCH/PUT /api/profiles/1.json
  def update
    respond_to do |format|
      if @api_profile.update(api_profile_params)
        format.html { redirect_to @api_profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_profile }
      else
        format.html { render :edit }
        format.json { render json: @api_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/profiles/1
  # DELETE /api/profiles/1.json
  def destroy
    @api_profile.destroy
    respond_to do |format|
      format.html { redirect_to api_profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_profile
      @api_profile = Api::Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_profile_params
      params.fetch(:api_profile, {})
    end
end
