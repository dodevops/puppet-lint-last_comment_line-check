# frozen_string_literal: true

PuppetLint.new_check(:last_empty_line_comment) do
  def warn(message, line = 1)
    notify :warning, { message: message, line: line, column: 1 }
    false
  end

  # Find the header comments for a class or a defined type
  #
  # @param tokens The list of all tokens
  # @param token_start The index of the token to start from upwards
  # @return The head comments
  def get_comments(tokens, token_start)
    comments = []
    token_pointer = token_start - 1
    while token_pointer >= 0
      break unless %i[COMMENT NEWLINE].include? tokens[token_pointer].type

      comments.append(tokens[token_pointer])
      token_pointer -= 1
    end
    comments.reject { |comment| comment.type == :NEWLINE }.reverse
  end

  # Check class or defined type indexes
  def check_indexes(indexes)
    indexes.each do |index|
      comments = get_comments(tokens, index[:start])
      warn('Last line is not an empty comment') unless comments.last.value =~ /^\s*$/
    end
    true
  end

  # Run the check
  def check
    return unless check_indexes(class_indexes)

    nil unless check_indexes(defined_type_indexes)
  end
end
