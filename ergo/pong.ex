# Process A


pid_TDD = spawn(fn ->
  receive do
    {:Doc_BRD, caller} -> send(caller, :pong)
    {:Doc_TRD, caller} -> send(caller, :pong)
    {:Doc_FDD, caller} -> send(caller, :pong)
  end
end)

# Synchronize: Send and wait for reply
send(pid, {:ping, self()})
receive do
  :pong -> IO.puts("Received pong")
after
  1000 -> IO.puts("Timed out")
end


defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end) # Start a new process with an initial state (an empty map)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send(caller, Map.get(map, key)) # Send response back to the caller
        loop(map) # Recursively call loop with the current state

      {:put, key, value} ->
        new_map = Map.put(map, key, value)
        loop(new_map) # Recursively call loop with the updated state

      _ ->
        IO.puts("Received unknown message")
        loop(map)
    end
  end
end

# Example usage in iex:
# {:ok, pid} = KV.start_link()
# send(pid, {:put, :key, "value"})
# send(pid, {:get, :key, self()})
# flush() # Use flush() in IEx to display messages in the shell's mailbox


