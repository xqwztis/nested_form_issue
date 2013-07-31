# -*- encoding: utf-8 -*-
class PatientsController < ApplicationController
  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all(:order => [:last_name, :first_name, :patronymic, :dob])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = Patient.new
    @patient.build_address

    if params[:term]
      data = params[:term].split
      @patient.last_name = data[0]
      @patient.first_name = data[1]
      @patient.patronymic = data[2]
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(params[:patient])

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Учетная карточка пациента заведена.' }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to @patient, notice: 'Данные пациента обновлены.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = Patient.find(params[:id])
    PatientExamination.where(:patient_id => @patient.id).each do |pe|
      pe.examination.destroy
      pe.destroy
    end
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end
end
