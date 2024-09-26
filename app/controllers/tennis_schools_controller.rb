class TennisSchoolsController < ApplicationController
  def index
    @tennis_schools = TennisSchool.all
  end
end
