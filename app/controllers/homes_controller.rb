require "ostruct"

class HomesController < ApplicationController
  def index
    @technologies = TECHNOLOGIES
    @contactinfo = OpenStruct.new
  end

  SERVICE_ACTIONS = %i[
    services custom_software_development desktop_service
    mobile_application_services web_development_services ui_ux_design
    e_commerce_solution data_management_and_business_analysis
    business_automation_solutions ai_ml_and_dl iot_service
    maintenance_services testing_quality_assurance
  ].freeze

  SERVICE_ACTIONS.each do |action|
    define_method(action) { render action }
  end

  def contact_us; end
  def how_we_work; end
  def career; end
  def about_us; end

  STUB_ACTIONS = %i[
    sitemap review clients events technologies
    life_at_syftet
    ror_development java_application_development dot_net_development
    company_profile photo_gallery web_design_company
    privacy_and_policy contest
  ].freeze

  STUB_ACTIONS.each do |action|
    define_method(action) do
      render html: "<div style='font-family:sans-serif;padding:64px;text-align:center'><h1>#{action.to_s.titleize}</h1><p>Page coming soon. <a href='/'>Back to home</a></p></div>".html_safe, layout: false
    end
  end

  def start_project
    redirect_to root_path, notice: "Thanks — we'll be in touch."
  end

  def apply_online
    redirect_to career_path, notice: "Thanks — application received."
  end

  def contest_registrations
    render json: { success: true, team_name: params.dig(:registration, :team_name), message: "Registration successful" }, status: :created
  end

  TECHNOLOGIES = [
    OpenStruct.new(name: "Ruby on Rails", logo_url: "technology-logo/ror.png",          page_url: "/ruby-on-rails-development-company"),
    OpenStruct.new(name: ".NET",          logo_url: "technology-logo/dot-net.png",      page_url: "/.net-development"),
    OpenStruct.new(name: "Ruby",          logo_url: "technology-logo/ruby.svg",         page_url: "/ruby-on-rails-development-company"),
    OpenStruct.new(name: "PHP",           logo_url: "technology-logo/php.png",          page_url: "/web-development-company"),
    OpenStruct.new(name: "Angular",       logo_url: "technology-logo/angular-js.png",   page_url: "/web-development-company"),
    OpenStruct.new(name: "Node.js",       logo_url: "technology-logo/nodejs.png",       page_url: "/web-development-company"),
    OpenStruct.new(name: "Android",       logo_url: "technology-logo/android.png",      page_url: "/mobile-app-development-company"),
    OpenStruct.new(name: "iOS",           logo_url: "technology-logo/ios.png",          page_url: "/mobile-app-development-company"),
    OpenStruct.new(name: "C#",            logo_url: "technology-logo/Logo_C_sharp.png", page_url: "/.net-development"),
    OpenStruct.new(name: "ASP.NET",       logo_url: "technology-logo/Asp.net.png",      page_url: "/.net-development")
  ]
end
