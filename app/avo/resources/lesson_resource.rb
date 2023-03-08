class LessonResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :title, as: :text
  field :content, as: :markdown
  field :equipment, as: :markdown
  field :habit, as: :markdown
  field :video, as: :text
  field :images, as: :files
  field :course, as: :belongs_to
  # add fields here
end
