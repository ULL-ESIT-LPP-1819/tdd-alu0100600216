## Definición de nodo, necesario para implementar la lista
Nodo = Struct.new(:value, :next, :prev)

##
# Author::    Andrés Concepción Afonso
# Mail::      alu0100600216@ull.edu.es
#
# == Clase Lista
# Esta clase simula una lista doblemente enlazada e implementa los
# métodos necesarios para utilizarla
#
# Además dispone de métodos para clasificar los elementos de una
# lista de acuerdo al contenido en sal (etiquetas nutricionales)
# y al IMC (para pacientes)
#

class Lista

    include Enumerable
    attr_accessor :head, :tail
    
    ## Metodo initialize
    def initialize
        @head = nil
        @tail = nil
    end

    ## Método each, necesario para enumerar los elementos de una lista (métodos de Enumerable)
    def each(&block)
        nodo = Nodo.new(nil, nil, nil)
        nodo = @head
        
        while !(nodo.nil?)
            yield nodo.value
            nodo = nodo.next
        end
    end

    ## Calcula el tamaño(longitud) de la lista
    def length

        tam = 0
        nodo = @head

        while !(nodo.nil?)
            tam = tam + 1
            nodo = nodo.next
        end

        tam

    end

    ## Comprueba si la lista está vacía
    def empty
        @head.nil?
    end

    ## Insertar nodo
    def insert(value)

        nodo = Nodo.new(value, nil, @tail)

        @head = nodo if @head.nil?
        @tail.next = nodo unless @tail.nil?
        @tail = nodo

    end

    ## Extraer nodo
    def extract

        return nil if self.empty
      
        temp = @head
        @head = @head.next

        @head.prev = nil unless @head.nil?
        @tail = nil if @head.nil?

        temp.next = nil
        temp

    end

    ## Método to_s para imprimir la lista de elementos
    def to_s
      
        nodo = Nodo.new(nil,nil,nil)
        nodo = @head
      
        tmp = "["

        if !(nodo.nil?)
            tmp += "#{nodo.value.to_s}"
            nodo = nodo.next
        end

        while !(nodo.nil?)
            tmp += ", #{nodo.value.to_s}"
            nodo = nodo.next
        end
      
        tmp += "]"
        tmp

    end

    ## Método ordenar con bucle for

    def ordenar_for
        
        tmp = map{|x| x.gasto_energetico_total}
        ordenado = []
        ordenado.push(tmp[0])

        for i in (1..length - 1)
            for j in (0..i)
  	            if(ordenado[j] >= tmp[i])
  		            ordenado.insert(j,tmp[i])
  	                break
  	            elsif(ordenado[ordenado.length - 1] <= tmp[i])
  	  	            ordenado.push(tmp[i])
  		            break
  	            end
  	        end
        end
       ordenado
    end

    ## Método ordenar con each

    def ordenar_each
        tmp = map{ |x| x.gasto_energetico_total}
        i = 0
        tmp.each do |x|
            a = x
            aux = i
            j = aux + 1
        
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

## Clasificar una lista de Etiquetas por el contenido en sal
def clasificar_por_sal (lista)
    
    sal_recomendada = Lista.new()
    sal_excesiva = Lista.new()
  
    nodo = lista.extract
    
    while !(nodo.nil?)
  
        if nodo.value.sal > 6
            sal_excesiva.insert(nodo.value.sal)
        else
            sal_recomendada.insert(nodo.value.sal)
        end
        nodo = lista.extract
    end
  
    "Los productos con una cantidad de sal menor o igual a la recomendada son #{sal_recomendada.to_s} y los que tienen una sal excesiva son #{sal_excesiva.to_s}"
  
end

## Clasificar una lista de personas por el IMC
def clasificar_por_imc (lista)
    
    imc_bajo = Lista.new()
    imc_normal = Lista.new()
    imc_excesivo = Lista.new()

    nodo = lista.extract
  
    while !(nodo.nil?)

        if nodo.value.datos_ant.indice_masa_corporal >= 30
            imc_excesivo.insert(nodo.value.datos_ant.indice_masa_corporal)
        elsif nodo.value.datos_ant.indice_masa_corporal >=18.5
            imc_normal.insert(nodo.value.datos_ant.indice_masa_corporal)
        else
        imc_bajo.insert(nodo.value.datos_ant.indice_masa_corporal)
        end
        nodo = lista.extract
    end

    "Los IMC por debajo de lo normal son #{imc_bajo.to_s}, los IMC dentro de lo normal son #{imc_normal.to_s} y los que tienen un IMC excesivo son #{imc_excesivo.to_s}"

end
