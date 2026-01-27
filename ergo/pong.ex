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

#############################################################
# PRIV/REPO/SEEDS.EXS
alias MyApp.Districts.District
alias MyApp.Repo

# 1. Define the path to your JSON file
json_path = Path.join(:code.priv_dir(:my_app), "static/json/district_list.json")

# 2. Read the file content
case File.read(json_path) do
  {:ok, content} ->
    # 3. Decode the JSON content into an Elixir data structure
    with {:ok, data} <- Poison.decode(content) do
      # 4. Loop through the data and insert into the database
      Enum.each(data, fn item_attrs ->
        # Create a changeset and insert using Ecto
        changeset = District.changeset(%District{}, item_attrs)

        case Repo.insert(changeset) do
          {:ok, district} ->
            IO.puts("Inserted district: #{district.name}")
          {:error, reason} ->
            IO.puts("Failed to insert district: #{item_attrs["name"]} - #{inspect reason}")
        end
      end)
    end

  {:error, reason} ->
    IO.puts("Error reading file: #{inspect reason}")
end

