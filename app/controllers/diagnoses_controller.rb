class DiagnosesController < ApplicationController
  def index
  end
  
  def result

    x = 0
    @diagnoses = 0
    while x <= 10
      @diagnoses += params["q#{x}"].to_i
      x += 1
    end
    if @diagnoses >= 20
      @result = "Sadari bahwa kecemasanmu adalah hal yang wajar
      Cari Pengalihan"
    elsif @diagnoses >= 10
      @result = "Ini Lebih atau sama dengan 10"
    elsif @diagnoses >= 0
      @result = "Ini Lebih atau sama dengan 0"
    end
  end

  def new
    @diagnoses = Diagnoses.new
  end

  # POST /posts or /posts.json
  def create
    @diagnoses = Diagnoses.new(post_params)

    respond_to do |format|
      if @diagnoses.save
        format.html { redirect_to diagnoses_result_path, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @diagnoses }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @diagnoses.errors, status: :unprocessable_entity }
      end
    end
  end
end
