class Sale < ActiveRecord::Base
  # AR Scope - class method with seld implicit
  def self.active
    where("starts_on <= ? AND ends_on >= ?", Date.current, Date.current)
  end
  def self.finished
    where("ends_on < ?", Date.current).any?
  end
  def finished?
    ends_on < Date.current
  end
  def upcoming?
    starts_on > Date.current
  end
  def active?
    !upcoming? && !finished?
  end

end
