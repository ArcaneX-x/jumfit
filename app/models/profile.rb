class Profile < ApplicationRecord
  belongs_to :user
  # has_one_attached :avatar
  # t.string :before_photo
  # t.string :after_photo
  # t.string :avatar
  # after_commit: :add_default_avatar, on: %i[:create update]

  # private

  # def add_default_avatar
  #   return if avatar.attached?

  #     avatar.attach (
  #       io: File.open(Rails.root.join('app', 'assets', 'images', 'defult_profile.jpg'))
  #       filename: 'defult_profile.jpg',
  #       content_type: 'image/jpg'
  #     ) 
  # end

  # def acceptable_image
  #   return unless main_image.attached?
  
  #   unless main_image.blob.byte_size <= 1.megabyte
  #     errors.add(:main_image, "is too big")
  #   end
  
  #   acceptable_types = ["image/jpeg", "image/png"]
  #   unless acceptable_types.include?(main_image.content_type)
  #     errors.add(:main_image, "must be a JPEG or PNG")
  #   end
  # end
end
