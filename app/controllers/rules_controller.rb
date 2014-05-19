class RulesController < ApplicationController
  before_action :set_rule, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /rules
  # GET /rules.json
  def index
    # @rules = Rule.order(:tag).all
    @rules = Rule.all.reverse
  end

  # GET /rules/1
  # GET /rules/1.json
  def show
  end

  # GET /rules/new
  def new
    @rule = Rule.new
  end

  # GET /rules/1/edit
  def edit
  end

  def validate_rule
    @rule.if.gsub!("\n","")
    @rule.if.gsub!("\r","")
    @rule.then.gsub!("\n","<br>")
    @rule.then.gsub!("\r","<br>")
    @rule.tag.gsub!("\n","")
    @rule.tag.gsub!("\r","")
  end

  # POST /rules
  # POST /rules.json
  def create
    @rule = Rule.new(rule_params)

    respond_to do |format|
      validate_rule
      @rule.author = current_user.email if user_signed_in?

      if @rule.save
        format.html { redirect_to @rule, notice: 'นำเข้ากฏใหม่เรียบร้อย' }
        format.json { render :show, status: :created, location: @rule }
      else
        format.html { render :new }
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rules/1
  # PATCH/PUT /rules/1.json
  def update
    respond_to do |format|
      validate_rule
      if @rule.update(rule_params)
        format.html { redirect_to @rule, notice: 'แก้ไขกฏเรียบร้อย' }
        format.json { render :show, status: :ok, location: @rule }
      else
        format.html { render :edit }
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rules/1
  # DELETE /rules/1.json
  def destroy
    @rule.destroy
    respond_to do |format|
      format.html { redirect_to rules_url, notice: 'ลบกฏเสร็จสิ้น.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rule
      @rule = Rule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rule_params
      params.require(:rule).permit(:if, :then, :tag)
    end
end
