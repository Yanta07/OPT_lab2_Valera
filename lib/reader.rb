class Reader
  def read_action(game)
    loop do
      game.action_item = $stdin.gets.chomp.to_i
      return unless decision?(game.action_item)

      puts('error, no such action')
    end
  end

  def decision?(action_item)
    action_item.negative? || (action_item > 9)
  end
end
