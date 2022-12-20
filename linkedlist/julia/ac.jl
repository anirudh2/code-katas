import Base

# Singly linked list
abstract type LinkedList{T} end

mutable struct Node{T} <: LinkedList{T}
    cargo::T
    next::LinkedList{T}
end

node(c::T, n::LinkedList{T}) where {T} = Node{T}(c, n)
node(c::T) where {T} = Node{T}(c, null(T))

struct Null{T} <: LinkedList{T} end

null(T) = Null{T}()
null() = Null{Any}()

function llappend_rtti!(l::LinkedList{T}, v::T) where {T}
    n = node(v)
    while l.next isa Node{T}
        l = l.next
    end
    l.next = n
    return nothing
end

function llappend!(l::LinkedList{T}, v::T) where {T}
    n = node(v)
    llappend!(l, n, l.next)
    return nothing
end
llappend!(::LinkedList{T}, n::Node{T}, t::Node{T}) where {T} = llappend!(t, n, t.next)
llappend!(l::LinkedList{T}, n::Node{T}, ::Null{T}) where {T} = l.next = n

Base.iterate(x::LinkedList) = x.cargo, x.next
Base.iterate(::LinkedList, state::Node) = state.cargo, state.next
Base.iterate(::LinkedList, ::Null) = nothing

function Base.show(io::IO, x::LinkedList{T}) where {T}
    s = ""
    for v in x
        s = s * string(v) * "->"
    end
    print(io, s[1:end-2])
end

function llinsert!(previous::Node{T}, v::T) where {T}
    nv = node(v)
    nv.next = previous.next
    previous.next = nv
    return nothing
end
llinsert!(::Null{T}, ::T) where {T} = nothing
