# encoding: utf-8
require 'carrierwave/processing/mini_magick'
class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :fog


  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
   def scale(width, height)
     # do something
   end

  version :large do
     process :resize_to_limit => [1366, 1366]
  end

  version :thumb do
    process :resize_to_fit => [80, 80]
  end

  version :indexed do
    process :resize_and_pad => [300, 300, "#dedede", 'Center'], :if => :image_is_jpg?
    process :resize_and_pad => [300, 300, :transparent , 'Center'], :if => :image_is_not_jpg?
  end

  version :background do
    process :resize_to_fit => [2500, 1600]
  end

  def image_is_jpg?(img)
    return true if %w{jpg jpeg}.include?(img.file.extension.downcase)
    false
  end

  def image_is_not_jpg?(img)
    !image_is_jpg?(img)
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
