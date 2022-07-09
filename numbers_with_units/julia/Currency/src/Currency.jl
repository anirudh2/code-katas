module Currency

import Base

export USD, EUR, GBP

# NOTE: Naive implementation
# abstract type AbstractCurrency <: Real end

# struct USD <: AbstractCurrency
#     value::Real
# end

# struct EUR <: AbstractCurrency
#     value::Real
# end

# const etou = 2.0
# const utoe = 1.0 / etou

# # If you try to combine USD and EUR, the resulting type is EUR
# Base.promote_rule(::Type{USD}, ::Type{EUR}) = EUR

# # How to convert between USD and EUR
# Base.convert(::Type{USD}, c::EUR) = USD(c.value * etou)
# Base.convert(::Type{EUR}, c::USD) = EUR(c.value * utoe)

# # Constructor for USD if coming from EUR and vice versa
# USD(c::AbstractCurrency) = convert(USD, c)
# EUR(c::AbstractCurrency) = convert(EUR, c)

# # Define + for same types. Different types taken care of by promote_rule
# Base.:+(a::USD, b::USD) = USD(a.value + b.value)
# Base.:+(a::EUR, b::EUR) = EUR(a.value + b.value)

# # Define == for currencies
# Base.:(==)(a::AbstractCurrency, b::AbstractCurrency) = EUR(a).value == EUR(b).value

# NOTE: Refactored implementation (less verbose)
abstract type AbstractCurrency <: Real end

currencies = [:USD, :EUR, :GBP]
usdtox_factor = [1.0, 0.5, 0.1]
for (i, c) in enumerate(currencies)
    @eval begin
        struct $c <: AbstractCurrency
            value::Real
        end

        Base.convert(::Type{USD}, a::$c) = USD(a.value / usdtox_factor[$i])
        Base.convert(::Type{$c}, a::USD) = $c(a.value * usdtox_factor[$i])
        $c(a::AbstractCurrency) = convert($c, convert(USD, a))
    end
end

# If you try to combine USD and EUR, the resulting type is EUR
Base.promote_rule(::Type{USD}, ::Type{EUR}) = EUR
Base.promote_rule(::Type{GBP}, ::Type{EUR}) = EUR
Base.promote_rule(::Type{GBP}, ::Type{USD}) = USD

# Define + for same types. Different types taken care of by promote_rule
Base.:+(a::T, b::T) where {T<:AbstractCurrency} = T(a.value + b.value)

# Define == for currencies
Base.:(==)(a::AbstractCurrency, b::AbstractCurrency) = EUR(a).value == EUR(b).value
end
