class EvidenceLinksController < ApplicationController
  before_action :set_evidence_link, only: %i[ show edit update destroy ]

  # GET /evidence_links or /evidence_links.json
  def index
    @evidence_links = EvidenceLink.all
  end

  # GET /evidence_links/1 or /evidence_links/1.json
  def show
  end

  # GET /evidence_links/new
  def new
    @evidence_link = EvidenceLink.new
  end

  # GET /evidence_links/1/edit
  def edit
  end

  # POST /evidence_links or /evidence_links.json
  def create
    @evidence_link = EvidenceLink.new(evidence_link_params)

    respond_to do |format|
      if @evidence_link.save
        format.html { redirect_to @evidence_link, notice: "Evidence link was successfully created." }
        format.json { render :show, status: :created, location: @evidence_link }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @evidence_link.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /evidence_links/1 or /evidence_links/1.json
  def update
    respond_to do |format|
      if @evidence_link.update(evidence_link_params)
        format.html { redirect_to @evidence_link, notice: "Evidence link was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @evidence_link }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @evidence_link.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /evidence_links/1 or /evidence_links/1.json
  def destroy
    @evidence_link.destroy!

    respond_to do |format|
      format.html { redirect_to evidence_links_path, notice: "Evidence link was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evidence_link
      @evidence_link = EvidenceLink.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def evidence_link_params
      params.expect(evidence_link: [ :question_id, :passage_id, :decision, :note ])
    end
end
