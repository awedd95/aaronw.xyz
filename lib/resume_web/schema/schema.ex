defmodule  ResumeWeb.Schema do
  use Absinthe.Schema
  
  import_types ResumeWeb.Schema.DataTypes
  
  query do
    @desc "Get a list of events"
    field :events, list_of(:event) do
      resolve fn _parent, _args, _resolution ->
        {:ok, ResumeWeb.Log.list_events()}
      end
    end
  end
end
