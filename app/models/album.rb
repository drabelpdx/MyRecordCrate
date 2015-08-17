class Album < ActiveRecord::Base
  @albums = @albums.paginate(:page => params[:page])

  respond_to do |format|
    format.json {
      render :json => {
        :current_page => @albums['pagination'].current_page,
        :per_page => @albums['pagination'].per_page,
        :total_pages => @albums['pagination'].pages,
        :total_entries => @albums['pagination'].items,
        :entries => @albums
      }
    }
  end
end
