module ItemsHelper
  def isExistsArtist(id)
    res = Artist.where(spotify_id: id).first

    if res.nil?
      return true
    else
      return false
    end
  end

  def createObject(name, id, images, url, genre)
    res = [{
      'name' => name,
      'id' => id,
      'images' => images,
      'url' => url,
      'genre' => genre
    }]

    return res
  end
end
