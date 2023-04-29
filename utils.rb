def prime?(number)
    (2.upto Math.sqrt(number)).each {
        |x| return false if number % x == 0
    }
    true
end
