class EvalFunction
    attr_reader :coefficients
    def initialize a, b, c
        @coefficients = [a, b, c]
    end

    def calc x
        @coefficients[0]* (x ** 2) + @coefficients[1]*x + @coefficients[2]
    end
end
