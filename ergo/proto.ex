# Process A

defmodule MR do

  defp stages = 
    [
      { :d_TDD => spawn(d_TDD) },
      { :d_TPLAN => spawn(d_TPLAN) },
      { :d_TCASE => spawn(d_TCASE) },
      { :d_TCOND => spawn(d_TCOND) },
      { :d_FDD => spawn(d_FDD) },
      { :d_AFEA => spawn(d_AFEA) }
    ]

  defp d_BRD do
    recieve do
    end

  end
end
