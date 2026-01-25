# Process A


pid_iDoc_TDD = spawn(fn ->
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


