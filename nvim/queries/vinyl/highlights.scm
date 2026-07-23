;; --- Fallbacks / Baselines (Must be at the top) ---
;; Moving this here ensures specific overrides defined below take precedence.
(identifier) @variable

;; --- Comments ---
(comment) @comment

;; --- Keywords ---
[
  "fn"
  "struct"
  "tuple"
  "enum"
  "let"
  "return"
  "if"
  "else"
  "mut"
  "while"
  "loop"
  "break"
  "continue"
  "match"
] @keyword

(binary_expression operator: ["and" "or"] @keyword.operator)

;; --- Functions ---
;; Use #set! priority for strict enforcement if the issue persists.
(function_definition
  name: (identifier) @function (#set! "priority" 105))

(call_expression
  function: (identifier) @function.call (#set! "priority" 105))

;; --- Types & Definitions ---
(primitive_type) @type.builtin
(simple_type (identifier) @type)
(generic_type (identifier) @type)
(struct_definition name: (identifier) @type)
(tuple_definition name: (identifier) @type)
(enum_definition name: (identifier) @type)

;; --- Fields & Variants ---
(field_definition name: (identifier) @property)
(field_access_expression field: (identifier) @property)
(enum_variant name: (identifier) @type)

;; --- Variables, Parameters & Patterns ---
(parameter name: (identifier) @variable.parameter)
(let_declaration name: (identifier) @variable)
(wildcard_pattern) @variable.builtin

;; --- Literals ---
(integer_literal) @number
(float_literal) @number.float
(bool_literal) @boolean
(char_literal) @character
(string_literal) @string
(raw_string_literal) @string
(unit_literal) @constant

;; --- Operators ---
(binary_expression operator: (_) @operator)

;; --- Attributes ---
(attribute "@" @punctuation.special)
(attribute name: (identifier) @attribute)

;; --- Brackets ---
[
  "("
  ")"
  "{"
  "}"
  "<"
  ">"
  "["
  "]"
] @punctuation.bracket

;; --- Delimiters ---
[
  ","
  ";"
  ":"
  "="
] @punctuation.delimiter
