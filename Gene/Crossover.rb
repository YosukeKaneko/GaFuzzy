module Crossover
    def crossover crossover_ratio
        random  = Random.new
        old_population_array = Array.new
        old_population_array = @population_array
        @population_array.each_with_index do |chrosome, i|
            next if random.rand(0.0..1.0) > crossover_ratio
            origin_gene = random.rand(0..(@rules*2-1))
            target_chrosome = random.rand 0..(@population_size-1)
            if origin_gene < @rules
                target_gene = random.rand 0..(@rules-1)
            else
                target_gene = random.rand @rules..(@rules*2-1)
            end
            # p "#{i} : #{origin_gene} : #{target_chrosome} : #{target_gene}"
            origin_gene_index = origin_gene * 3
            target_gene_index = target_gene * 3
            @population_array[i][origin_gene_index..(origin_gene_index+2)] = old_population_array[target_chrosome][target_gene_index..(target_gene_index+2)]
        end
    end
end
