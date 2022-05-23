module ItemsHelper
  def isExistsArtist(id)
    res = Artist.where(spotify_id: id).first

    if res.nil?
      return true
    else
      return false
    end
  end

  def isExistsAlbum(id)
    res = Album.where(spotify_id: id).first

    if res.nil?
      return true
    else
      return false
    end
  end

  def createArtistObject(name, id, images, url, genre)
    res = [{
      'name' => name,
      'id' => id,
      'images' => images,
      'url' => url,
      'genre' => genre
    }]

    return res
  end

  def createAlbumObject(name, id, images, url, release, type)
    res = [{
      'name' => name,
      'id' => id,
      'images' => images,
      'url' => url,
      'release' => release,
      'type' => type
    }]

    return res
  end
end
