# Process A

defmodule MR do

  @stages [
      { :d_BRD -> spawn(d_BRD) },
      { :d_TPLAN -> spawn(d_TPLAN) },
      { :d_TCASE -> spawn(d_TCASE) },
      { :d_TCOND -> spawn(d_TCOND) },
      { :d_FDD -> spawn(d_FDD) },
      { :d_AFEA -> spawn(d_AFEA) }
    ]
end

defmodule D_TPLAN do

  defp d_TPLAN do
    
    subscribed = [
      :d_TDD,
      :d_FDD
    ]

    editors = [
      "user_BRD",
      "user_TDD",
      "user_FDD",
    ]

    recieve do
      { sub, :done} -> List.delete(subscribed, sub)
    end

    if length(subscribed) > 0 do
      d_TPLAN()
    end

    Enum.list(editors) |> email(editors))
  end
end
