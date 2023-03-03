class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar, dependent: :destroy
  has_one_attached :before_image, dependent: :destroy
  has_one_attached :after_image, dependent: :destroy

  validate :acceptable_image, if: -> { avatar.attached? }

   def set_default_avatar
    return if avatar.attached?

    avatar.attach(
      io: File.open(Rails.root.join('app', 'assets', 'images', 'default_profile.jpg')),
      filename: 'default_profile.jpg',
      content_type: 'image/jpg'
    )
  end
  
  private

  def acceptable_image
    return unless avatar.attached?

    errors.add(:avatar, 'is too big') unless avatar.blob.byte_size <= 1.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    return if acceptable_types.include?(avatar.content_type)

    errors.add(:avatar, 'must be a JPEG or PNG')
  end
end
