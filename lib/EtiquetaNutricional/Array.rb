##
# Author::    Andrés Concepción Afonso
# Mail::      alu0100600216@ull.edu.es
#
# == Clase Array
# Tenemos que definir manualmente los métodos de ordenación usando 
# el método each y usando bucles for
#

class Array

    ## Método ordenar con bucle for
    def ordenar_for

        tmp = map{|x| x.reduce(:+)}
        ordenado = []
        ordenado.push(tmp[0])

        for i in (1..length - 1)
            for j in (0..i)
                if (tmp[i] < ordenado[j])
                    ordenado.insert(j,tmp[i])
                    break
                 elsif (ordenado[(ordenado.length)-1] <= tmp[i])
                    ordenado.push(tmp[i])
                    break
                end
  	        end
        end
        return ordenado

    end

    ## Método ordenar con each

    def ordenar_each

        tmp = map{ |x| x.reduce(:+)}
        orden = []
        i = 0
        tmp.each do |x|
            a = x
            aux = i
            j = aux+1
     
            tmp[j..tmp.length - 1].each do |y|
                if (a > y)
                    a = y
                    aux = j
                end
                j+=1
            end
            tmp[aux] = x
            tmp[i] = a
            i+=1
        end
        tmp
    end

end