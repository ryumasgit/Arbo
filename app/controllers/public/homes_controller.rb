class Public::HomesController < ApplicationController
  before_action :authenticate_member!, except: [:top]

  def top
  end

  def welcome
  end
end