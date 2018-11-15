# Definición de lista genérica


Nodo = Struct.new(:value, :next, :prev)

class Lista

    attr_accessor :head, :tail

    def initialize
      @head = nil
      @tail = nil
    end

    # calcular tamaño de la lista
    def length

      tam = 0
      nodo = @head

      while !(nodo.nil?)
        tam = tam + 1
        nodo = nodo.next
        end

        tam

    end

    def empty
       @head.nil?
    end

    #métodos para insertar y extraer

    def insert(value)

    nodo = Nodo.new(value, nil, @tail)

      @head = nodo if @head.nil?
      @tail.next = nodo unless @tail.nil?
      @tail = nodo

    end

    def extract

      return nil if self.empty
      
      temp = @head
      @head = @head.next

      @head.prev = nil unless @head.nil?
      @tail = nil if @head.nil?

      temp.next = nil
      temp

    end

    # Método para imprimir la lista de etiquetas

    def to_s
      
      nodo = Nodo.new(nil,nil,nil)
      nodo = @head
      
      tmp = "["
      tmp += "#{nodo.value.to_s}"
      nodo = nodo.next
      
      while !(nodo.nil?)
        tmp += ", #{nodo.value.to_s}"
        nodo = nodo.next
      end
      
      tmp += "]"
      tmp

    end

end


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