require "ostruct"

class PortfoliosController < ApplicationController
  PORTFOLIOS = [
    OpenStruct.new(slug: "my-welcome-app",        name: "My Welcome App",          image: "portfolio/bequent250.png",        category: "Web App"),
    OpenStruct.new(slug: "welcome-to-australia",     name: "Welcome to Australia",       image: "portfolio/beauty-app250.png",     category: "Desktop"),
    OpenStruct.new(slug: "lobster-tail-seafood",         name: "Lobster Tail Seafood",           image: "portfolio/beauty250.png",         category: "Web"),
    OpenStruct.new(slug: "iNwe", name: "iNwe",   image: "portfolio/biometric-auth250.png", category: "Mobile"),
    OpenStruct.new(slug: "Instructory",    name: "Instructory",      image: "portfolio/bundle-tour250.png",    category: "Desktop"),
    OpenStruct.new(slug: "Armoiar",      name: "Armoiar",        image: "portfolio/campusbit.jpg",         category: "EdTech"),
    OpenStruct.new(slug: "one-touch",          name: "One Touch",            image: "portfolio/cheaf250.png",          category: "Mobile"),
    OpenStruct.new(slug: "bequent",       name: "Bequent",         image: "portfolio/dicareer250.png",       category: "Product"),
    OpenStruct.new(slug: "boxgiver",            name: "Boxgiver",              image: "portfolio/edu250.png",            category: "Product"),
    OpenStruct.new(slug: "tracpro",          name: "Tracpro",            image: "portfolio/gaffl.png",             category: "Product"),
    OpenStruct.new(slug: "lienex-pos",           name: "Lienex Pos",             image: "portfolio/gazi250.png",           category: "Web"),
    OpenStruct.new(slug: "inventory",      name: "Inventory",        image: "portfolio/inventory.jpg",         category: "web"),

  ].freeze

  def index
    @portfolios = PORTFOLIOS
    @categories = (["All"] + PORTFOLIOS.map(&:category).uniq.sort)
  end

  def show
    @portfolio = PORTFOLIOS.find { |p| p.slug == params[:id] }
    if @portfolio.nil?
      redirect_to portfolios_path, alert: "Project not found"
    end
  end
end
