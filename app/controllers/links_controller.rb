class LinksController < ApplicationController
  before_action :authenticate_user!

  def index
    @links = current_user.links
  end

  def search
    if params[:label].present?
      @links = Link.where(label: params[:label])
    else
      flash.now[:notice] = "There aren't any url's with that label"
      @links = []
    end

    render partial: "list", locals: { links: @links, label: params[:label] }
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.build(link_params)
    if @link.save
      flash[:notice] = "Link saved successfully!"
      redirect_to links_path
    else
      render "new"
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :label)
  end
end
