class SearchItemsService
  def self.search(search)
    if search != ""
      query = "SELECT * FROM items WHERE explanation LIKE '%#{search}%' or name  LIKE '%#{search}%'"
      Item.find_by_sql(query)
    else
      Item.all
    end
  end
end