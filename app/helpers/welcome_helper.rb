module WelcomeHelper
  def validation_image site_check
    if site_check == nil
      file = "question_mark.png"
    else
      status = site_check.result
      if status == :ok
        file = "ok.png"     
      elsif status == :error
        file = "error.png"
      else
        file = "question_mark.png"              
      end
    end
    raw "<img src=\"/images/" + file + "\" alt=\"status\" class=\"validation-image\"/>"
  end
end
