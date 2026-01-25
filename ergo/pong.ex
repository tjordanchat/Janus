# Process A
pid = spawn(fn ->
  receive do
    {:ping, caller} -> send(caller, :pong)
  end
end)

# Synchronize: Send and wait for reply
send(pid, {:ping, self()})
receive do
  :pong -> IO.puts("Received pong")
after
  1000 -> IO.puts("Timed out")
end


