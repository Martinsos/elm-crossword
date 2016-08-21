import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String

main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

type alias Model =
    { title : String
    }

init : (Model, Cmd Msg)
init = (Model "", Cmd.none)

type Msg = TitleUpdate String

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        TitleUpdate newTitle ->
            ({ model | title = newTitle }, Cmd.none)

subscriptions = \_ -> Sub.none

view : Model -> Html Msg
view model =
    div []
        [ input [onInput TitleUpdate] []
        , text model.title
        ]
