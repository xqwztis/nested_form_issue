# encoding: UTF-8
class GynecologicExaminationsController < ApplicationController
  # GET /gynecologic_examinations
  # GET /gynecologic_examinations.json
  def index
    @gyn_exams = GynecologicExamination.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gyn_exams }
    end
  end

  # GET /gynecologic_examinations/1
  # GET /gynecologic_examinations/1.json
  def show
    @gyn_exam = GynecologicExamination.find(params[:id])
    @patient = @gyn_exam.patients.first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gyn_exam }
    end
  end

  # GET /gynecologic_examinations/new
  # GET /gynecologic_examinations/new.json
  def new
    @gyn_exam = GynecologicExamination.new
    @gyn_exam.build_left_ovary
    @gyn_exam.build_right_ovary

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gyn_exam }
    end
  end

  # GET /gynecologic_examinations/1/edit
  def edit
    @gyn_exam = GynecologicExamination.find(params[:id])
  end

  # POST /gynecologic_examinations
  # POST /gynecologic_examinations.json
  def create
    @gyn_exam = GynecologicExamination.new(params[:gynecologic_examination])
    if params[:patient_id]
      respond_to do |format|
        if @gyn_exam.save
          PatientExamination.create(:patient_id => params[:patient_id], :gynecologic_examination_id => @gyn_exam.id).save
          format.html { redirect_to @gyn_exam, notice: 'Гинекологическое обследование успешно создано.' }
          format.json { render json: @gyn_exam, status: :created, location: @gyn_exam }
        else
          format.html { render action: "new" }
          format.json { render json: @gyn_exam.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to :root, notice: 'Невозможно создать отчет без привязки к пациенту. Для создания отчета используйте карту пациента.'
    end
  end

  # PUT /gynecologic_examinations/1
  # PUT /gynecologic_examinations/1.json
  def update
    @gyn_exam = GynecologicExamination.find(params[:id])

    respond_to do |format|
      if @gyn_exam.update_attributes(params[:gynecologic_examination])
        format.html { redirect_to @gyn_exam, notice: 'Данные гинекологического обследования успешно обновлены.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gyn_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gynecologic_examinations/1
  # DELETE /gynecologic_examinations/1.json
  def destroy
    @gyn_exam = GynecologicExamination.find(params[:id])
    @patient = @gyn_exam.patients.first
    PatientExamination.where(:gynecologic_examination_id => @gyn_exam.id).each {|exam| exam.destroy }
    @gyn_exam.destroy

    respond_to do |format|
      format.html { redirect_to patient_path(@patient) }
      format.json { head :no_content }
    end
  end
end
