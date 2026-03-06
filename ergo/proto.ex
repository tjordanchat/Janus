# Process A

defmodule MR do

  defp stages = 
    [
      { :d_BRD => spawn(d_BRD) },
      { :d_TPLAN => spawn(d_TPLAN) },
      { :d_TCASE => spawn(d_TCASE) },
      { :d_TCOND => spawn(d_TCOND) },
      { :d_FDD => spawn(d_FDD) },
      { :d_AFEA => spawn(d_AFEA) }
    ]

  defp d_TPLAN do
    subscribed = [
      :d_TDD,
      :d_FDD
    ]

    recieve do
      { :d_TDD, :done} -> List.delete(subscribed, :d_TDD)
      { :d_FDD, :done} -> List.delete(subscribed, :d_FDD)
    end

  end

end
