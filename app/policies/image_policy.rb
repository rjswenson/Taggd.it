class ImagePolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present?
        scope.all
      end
    end
  end

  attr_reader :user, :image

  def initialize(user, image)
    @user = user
    @image = image
  end

  def create?
    user.present?
  end

  def update?
    image.uploaded_by? || user.admin? if user.present?
  end
    alias_method :destroy?, :update?
    alias_method :edit?,    :update?
end
