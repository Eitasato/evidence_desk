class PassagesController < ApplicationController
  before_action :set_passage, only: %i[ show edit update destroy ]

  # GET /passages or /passages.json
  def index
    @passages = Passage.all
  end

  # GET /passages/1 or /passages/1.json
  def show
  end

  # GET /passages/new
  def new
    @passage = Passage.new
  end

  # GET /passages/1/edit
  def edit
  end

  # POST /passages or /passages.json
  def create
    @passage = Passage.new(passage_params)

    respond_to do |format|
      if @passage.save
        format.html { redirect_to @passage, notice: "Passage was successfully created." }
        format.json { render :show, status: :created, location: @passage }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @passage.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /passages/1 or /passages/1.json
  def update
    respond_to do |format|
      if @passage.update(passage_params)
        format.html { redirect_to @passage, notice: "Passage was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @passage }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @passage.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /passages/1 or /passages/1.json
  def destroy
    @passage.destroy!

    respond_to do |format|
      format.html { redirect_to passages_path, notice: "Passage was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passage
      @passage = Passage.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def passage_params
      params.expect(passage: [ :source_id, :body, :heading_path, :page_index, :paragraph_index ])
    end
end
