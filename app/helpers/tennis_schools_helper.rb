module TennisSchoolsHelper
  def club_status_text(club)
    club.active? ? 'Active' : 'Inactive'
  end

  def lesson_packages_count_text(club)
    clubs_count = club.lesson_packages.count

    "#{clubs_count} Lesson package#{clubs_count > 1 ? 's' : ''}"
  end
end
