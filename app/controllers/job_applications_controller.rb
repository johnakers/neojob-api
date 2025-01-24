class JobApplicationsController < ApplicationController
  before_action :authorize!

  def index
    render json: current_user.job_applications
  end

  def create
    job_application = current_user.job_applications.create!(job_application_params)

    render json: job_application
  end

  def show
    job_applications.create!(job_application_params)

    render json: job_application
  end

  def update
    job_application.update!(job_application_params)

    render json: job_application
  end

  def destroy
    job_application.destroy

    head :no_content
  end

  private

  def job_application
    @job_application ||= current_user.job_applications.find(params[:id])
  end

  def job_application_params
    valid_attributes = %i[
      company_name
      position_name
      interest_level
      company_ur
      position_ur
      glassdoor_ur
      applied_on
      contact_nam
      current_status
    ]

    params.permit(valid_attributes)
  end
end

