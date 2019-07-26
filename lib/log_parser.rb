# class LogParser assuming the file exists
class LogParser
  def initialize(path)
    @path = path
  end

  def calculate_views
    views = {}
    open_file.each do |line|
      result = line.split(' ')
      if views.key?(result[0])
        views[result[0]] += 1
      else
        views[result[0]] = 1
      end
    end
    sort_hash(views)
  end

  def calculate_unique_views
    unique_views = {}
    open_file.each do |line|
      result = line.split(' ')
      if unique_views.key?(result[0])
        unique_views[result[0]] << result[1]
      else
        unique_views[result[0]] = [result[1]]
      end
    end
      unique = unique_views.map { |k, v| [k, v.uniq.length] }
      sort_hash(unique)
  end

  def sort_hash(views)
    views.sort_by { |_k, v| -v }.to_h
  end

  def average_views
    average_calcutation = {}
    open_file.each do |line|
    result = line.split(' ')
      if average_calcutation.key?(result[0])
        average_calcutation[result[0]] << result[1]
      else
        average_calcutation[result[0]] = [result[1]]
      end
    end
      unique = average_calcutation.map { |k, v| [k, v.length.to_f / v.uniq.length] }
      sort_hash(unique)
  end

  private

  def open_file
    File.open(@path)
  end
end
