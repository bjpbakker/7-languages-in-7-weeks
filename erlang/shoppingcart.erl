-module(shoppingcart).
-export([totals/1]).

totals(Cart) ->
  [{Item, Quantity * Price} || {Item, Quantity, Price} <- Cart].
