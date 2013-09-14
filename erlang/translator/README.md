Translation Service
=

This translation service is an exercise on day 3 of Erlang. This README provides 
some brief usage instructions.

Usage
-

The `client` module gets you a long way in running the translation services. Its 
`start_translators` function starts the available translators with a `doctor` so 
that they will be restarted might they die. The `translate` function then 
translates an English word into a certain language.

Example
-

    client:start_translators().
    client:translate('house', spanish). % => casa
    client:translate('white', french). % => blanc
    client:translate('anything', spanish). % => translator dies

