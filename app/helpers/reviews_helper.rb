module ReviewsHelper
  def rating_options(max = 5)
    1.upto(max).each_with_object({}) { |e, o| o["+#{e}"] = e }
  end
end
