module Select
    def select_chrosome select_ratio
        select_num_of_genes = (1 / select_ratio).floor
        iter1 = 0
        iter2 = 0
        old_population_array = Array.new

        @score_hash.each do |key, val|
            old_population_array << @population_array[key]
        end

        while iter1*select_num_of_genes < @population_array.length do
            iter1 = iter1 + 1
            while iter2 < select_num_of_genes && iter1*select_num_of_genes + iter2 < population_array.length do
                iter2 = iter2 + 1
                @population_array[iter1*select_num_of_genes+iter2] = old_population_array[iter1]
            end
        end
    end
end
