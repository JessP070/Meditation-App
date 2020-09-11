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

