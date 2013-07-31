# -*- encoding: utf-8 -*-
class SearchController < ApplicationController
  def index
    if params[:term]
      args = params[:term].split
      4.times do |i|
        args[i] ||= ''
        args[i] += '%'
      end
      condition = 'last_name LIKE ? AND first_name LIKE ? AND patronymic LIKE ? AND dob LIKE ?'
      fields = [:id, :last_name, :first_name, :patronymic, :dob]
      result = Patient.select(fields).where(condition, *args).limit(5)
      @patients = []
      result.each do |item|
        @patients << {"id" => item.id, "label" => fields[1..-1].map{|f| item.send(f) }.join(' ') }
      end
    end
    
    respond_to do |format|
      format.html
      format.json { render :json => @patients }
    end
  end
end
