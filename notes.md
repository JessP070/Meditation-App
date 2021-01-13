 <%= link_to 'Edit', edit_task_path(@task) %> |
 <%= link_to 'Delete', task_path(@task),method: :delete, data: { confirm: 'Are you sure you want to delete?' } %>

         # @technique.user_id = session[:user_id]


  def create
        @technique = Technique.new(technique_params)
        if @technique.save
            redirect_to technique_path(@technique)
        else
            render :new
        end
    end

    def show
        @technique = Technique.find_by_id(params[:id])
    end

    private

    def technique_params
        params.require(:technique).permit(:name, :description)
    end



    <%= link_to 'Edit', edit_project_path(@project) %> |
 <%= link_to 'Delete', project_path(@project),method: :delete, data: { confirm: 'Are you sure you want to delete?' } %>
 <br>
 <br>
<%= link_to 'Back', projects_path %>

<div class = "title-container"> 
<h2> All Meditations </h2>
</div>
<div class = "meditations">
<% @meditations.each do |m| %>
<div class = "meditation">
Mood:<h4> <%= link_to m.mood, meditation_path(m.id)%> 
<br>
Technique: <%= m.technique.name %> </h4>
<%= link_to "Write A Review", new_meditation_review_path(m.id) %>
<div>
<p><%= m. duration %></p>
</div>
</div>
<% end %>
</div>

#This creates a nested resource and we put it under meditation because reviews belongs to a meditation
resources :meditations do 
    resources :reviews, only: [:new, :index]
  end

do i need this code of a setter method?
--> models meditation

def technique_attributes=(attributes)
  #   self.technique = Technique.find_or_create_by(attributes) if !attributes['name'].empty?
  #   self.technique
  # end


    # has_many :meditations, through: :reviews, :dependent => :destroy
# how do we really want this to function? why do we want a meditation to belong to a user?


 <%= form_tag(a) do |m| %>

  # def not_a_duplicate
  #   if Meditation.find_by(mood: mood, technique_id: technique_id)
  #     errors.add(:mood, "Has already been added for that technique")
  #   end
  # end
# 