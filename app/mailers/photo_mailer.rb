class PhotoMailer < ApplicationMailer

  def subscribe(user_id)
    @user = User.find(user_id)
    #to:, from:, subject:, cc:, bcc:, body:   should def have to and subject
    mail(to: "khambro@yahoo.com", subject: "Your photo has received a review!")
    #would actually want to send this to @user.email
  end

  def review_received(review_id)
    @review = Review.find(review_id)
    mail(to: "khambro@yahoo.com", subject: "Your photo has received a review!")
  end

end
