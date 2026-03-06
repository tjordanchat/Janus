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
    recieve do
      { :d_TDD, :done} 
    end

  end
end
