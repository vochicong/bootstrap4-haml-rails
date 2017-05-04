module ApplicationHelper
  def oss_url(file)
    github_url(file)
  end

  def github_url(file)
    "https://github.com/vochicong/bootstrap4-haml-rails/blob/master/" + file
  end
end
