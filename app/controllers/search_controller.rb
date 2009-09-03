def schools
    @schools = School.search(params)
end