Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "homes#index"

  get "/sitemap",                                  to: "homes#sitemap"
  get "review",                                    to: "homes#review"
  get "clients",                                   to: "homes#clients"
  get "events",                                    to: "homes#events"
  post "start_project",                            to: "homes#start_project"
  get "software-development-services",             to: "homes#services"
  get "career",                                    to: "homes#career"
  get "about-us",                                  to: "homes#about_us"
  post "apply_online",                             to: "homes#apply_online"
  get "technologies",                              to: "homes#technologies"
  get "contact-us",                                to: "homes#contact_us"
  get "how-we-work",                               to: "homes#how_we_work"
  get "custom-software-development-company",       to: "homes#custom_software_development"
  get "desktop-application-development-company",   to: "homes#desktop_service"
  get "mobile-app-development-company",            to: "homes#mobile_application_services"
  get "data-management-and-business-analysis",     to: "homes#data_management_and_business_analysis"
  get "testing-quality-assurance",                 to: "homes#testing_quality_assurance"
  get "iot-service",                               to: "homes#iot_service"
  get "ai-ml-and-dl",                              to: "homes#ai_ml_and_dl"
  get "life-at-syftet",                            to: "homes#life_at_syftet"
  get "e-commerce-solution",                       to: "homes#e_commerce_solution"
  get "business-automation-solutions",             to: "homes#business_automation_solutions"
  get "web-development-company",                   to: "homes#web_development_services"
  get "ruby-on-rails-development-company",         to: "homes#ror_development"
  get "java-application-development-services",     to: "homes#java_application_development"
  get ".net-development",                          to: "homes#dot_net_development", as: "dot_net_development"
  get "website-maintenance-services-company",      to: "homes#maintenance_services"
  get "company-profile",                           to: "homes#company_profile"
  get "photo-gallery",                             to: "homes#photo_gallery"
  get "web-design-development-company",            to: "homes#web_design_company"
  get "privacy-and-policy",                        to: "homes#privacy_and_policy"
  get "ui-ux-design",                              to: "homes#ui_ux_design"
  get "programming-contest",                       to: "homes#contest"
  post "contest-registrations",                    to: "homes#contest_registrations"

  resources :blogs,      only: [ :index, :show ]
  resources :jobs,       only: [ :index, :show ]
  resources :best_teams, only: [ :index, :show ]
  resources :portfolios, only: [ :index, :show ]
end
