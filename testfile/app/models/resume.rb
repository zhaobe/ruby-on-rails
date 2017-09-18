class Resume < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader # Rails to use this uploader for this model.
  validates :name, presence: true # Verify owner's name is present.
end