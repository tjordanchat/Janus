defmodule PingPong do
  def start do
    # Spawn the pong process and get its PID
    pong_pid = spawn(__MODULE__, :pong, [])
    # Spawn the ping process, passing the pong PID
    spawn(__MODULE__, :ping, [3, pong_pid])
  end

  # Ping process: sends :ping, waits for :pong
  def ping(0, pong_pid) do
    send(pong_pid, :finished)
    IO.puts("Ping finished.")
  end

  def ping(n, pong_pid) do
    send(pong_pid, {:ping, self()})
    receive do
      :pong ->
        IO.puts("Ping received pong")
        Process.sleep(500) # Optional delay
        ping(n - 1, pong_pid)
    end
  end

  # Pong process: waits for :ping, replies with :pong
  def pong do
    receive do
      {:ping, ping_pid} ->
        IO.puts("Pong received ping")
        send(ping_pid, :pong)
        pong() # Keep listening
      :finished ->
        IO.puts("Pong finished.")
    end
  end
end

# To run in IEx:
# PingPong.start()


