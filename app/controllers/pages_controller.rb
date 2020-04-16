class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
    @members = ['Thanh', 'Dimitri', 'Germain', 'Damien', 'Julien']
    if params[:member]
      @members = @members.select { |member| member.starts_with?(params[:member]) }
    end
    if params[:member] && (params[:member].to_s != params[:member].to_s.capitalize)
      redirect_to "http://localhost:3000/contact?member=#{params[:member].to_s.capitalize}"
    end
  end
end
