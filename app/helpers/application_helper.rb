module ApplicationHelper
  def create_contact(user, professional)
    valid = Contact.all.select { |a| a.user == user && a.professional == professional }

    unless valid.present?
      if user.present? && professional.present? && user != professional
        contact = Contact.create(user: user, professional: professional)
      end
      contact
    else
      valid.first.id
    end
  end
end
