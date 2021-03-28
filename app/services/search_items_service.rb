class SeachItemsService
  def self.search(search)
    if search != ""
#      search = "%#{search}%"
#      query = "SELECT * FROM items WHERE explanation LIKE ?"
#      Item.where([query, search)
      query = "SELECT * FROM items WHERE explanation LIKE %#{search}% or name  LIKE %#{search}%"
      Item.where(query)
    else
      Item.all
    end
  end
end