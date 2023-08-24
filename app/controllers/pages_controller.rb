class PagesController < ApplicationController
  def home
    @hide_navbar = true
    @hide_footer = true
  end
end
