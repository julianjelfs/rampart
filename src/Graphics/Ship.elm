module Graphics.Ship exposing (ship)

import Svg exposing (..)
import Svg.Attributes as SA exposing (..)


ship x_ y_ =
    svg
        [ width "30"
        , height "30"
        , class "ship"
        , x x_
        , y y_
        , viewBox "0 0 100 100"
        ]
        [ defs []
            [ Svg.path
                [ id "p"
                , fill "none"
                , stroke "#ffd367"
                , d "m358.84 681.201.981.09.893-.447-1.071-.625-.625.357-.179.625z"
                , SA.filter "url(#a)"
                ]
                []
            , Svg.path
                [ id "V"
                , fill "#e8d04c"
                , fillRule "evenodd"
                , d "m256.83 587.19 1.389 1.894 2.147-.253-1.516-1.641h-2.02z"
                , SA.filter "url(#b)"
                ]
                []
            , Svg.path
                [ id "cd"
                , fill "#3c2f2c"
                , stroke "#393939"
                , strokeLinejoin "round"
                , strokeWidth "3.1"
                , d "M371.43 391.29a4.107 3.571 0 1 1-8.214 0 4.107 3.571 0 1 1 8.214 0z"
                ]
                []
            ]
        , defs []
            [ Svg.filter
                [ id "k"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".456"
                    ]
                    []
                ]
            , Svg.filter
                [ id "t"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".555"
                    ]
                    []
                ]
            , Svg.filter
                [ id "S"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".263"
                    ]
                    []
                ]
            , Svg.filter
                [ id "U"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".317"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aj"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".217"
                    ]
                    []
                ]
            , Svg.filter
                [ id "u"
                ]
                [ feGaussianBlur
                    [ stdDeviation "2.579"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aT"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".532"
                    ]
                    []
                ]
            , Svg.filter
                [ id "by"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".59"
                    ]
                    []
                ]
            , Svg.filter
                [ id "ca"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".753"
                    ]
                    []
                ]
            , Svg.filter
                [ id "a"
                , width "1.755"
                , height "2.048"
                , x "-.378"
                , y "-.524"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".452"
                    ]
                    []
                ]
            , Svg.filter
                [ id "q"
                , width "1.274"
                , height "1.236"
                , x "-.137"
                , y "-.118"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".225"
                    ]
                    []
                ]
            , Svg.filter
                [ id "s"
                , width "1.427"
                , height "1.98"
                , x "-.214"
                , y "-.49"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".437"
                    ]
                    []
                ]
            , Svg.filter
                [ id "o"
                , width "1.059"
                , height "1.367"
                , x "-.029"
                , y "-.183"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".418"
                    ]
                    []
                ]
            , Svg.filter
                [ id "n"
                , width "1.059"
                , height "1.329"
                , x "-.03"
                , y "-.165"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".418"
                    ]
                    []
                ]
            , Svg.filter
                [ id "m"
                , width "1.059"
                , height "1.307"
                , x "-.029"
                , y "-.153"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".418"
                    ]
                    []
                ]
            , Svg.filter
                [ id "l"
                , width "1.06"
                , height "1.334"
                , x "-.03"
                , y "-.167"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".418"
                    ]
                    []
                ]
            , Svg.filter
                [ id "E"
                , width "1.657"
                , height "3.014"
                , x "-.328"
                , y "-1.007"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".795"
                    ]
                    []
                ]
            , Svg.filter
                [ id "D"
                , width "1.444"
                , height "1.604"
                , x "-.222"
                , y "-.302"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".795"
                    ]
                    []
                ]
            , Svg.filter
                [ id "C"
                , width "2.888"
                , height "3.517"
                , x "-.944"
                , y "-1.258"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".795"
                    ]
                    []
                ]
            , Svg.filter
                [ id "B"
                , width "2.208"
                , height "4.356"
                , x "-.604"
                , y "-1.678"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".795"
                    ]
                    []
                ]
            , Svg.filter
                [ id "A"
                , width "2.007"
                , height "2.59"
                , x "-.503"
                , y "-.795"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".795"
                    ]
                    []
                ]
            , Svg.filter
                [ id "z"
                , width "2.888"
                , height "2.51"
                , x "-.944"
                , y "-.755"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".795"
                    ]
                    []
                ]
            , Svg.filter
                [ id "y"
                , width "1.355"
                , height "1.641"
                , x "-.178"
                , y "-.321"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".795"
                    ]
                    []
                ]
            , Svg.filter
                [ id "x"
                , width "2.079"
                , height "3.746"
                , x "-.539"
                , y "-1.373"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".795"
                    ]
                    []
                ]
            , Svg.filter
                [ id "I"
                , width "2.037"
                , height "1.542"
                , x "-.519"
                , y "-.271"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".598"
                    ]
                    []
                ]
            , Svg.filter
                [ id "H"
                , width "1.67"
                , height "1.438"
                , x "-.335"
                , y "-.219"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".598"
                    ]
                    []
                ]
            , Svg.filter
                [ id "G"
                , width "1.438"
                , height "1.542"
                , x "-.219"
                , y "-.271"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".598"
                    ]
                    []
                ]
            , Svg.filter
                [ id "F"
                , width "1.455"
                , height "1.407"
                , x "-.228"
                , y "-.203"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".598"
                    ]
                    []
                ]
            , Svg.filter
                [ id "w"
                , width "1.234"
                , height "1.255"
                , x "-.117"
                , y "-.127"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".794"
                    ]
                    []
                ]
            , Svg.filter
                [ id "v"
                , width "1.162"
                , height "1.217"
                , x "-.081"
                , y "-.108"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".572"
                    ]
                    []
                ]
            , Svg.filter
                [ id "J"
                , width "1.045"
                , height "1.284"
                , x "-.022"
                , y "-.142"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.026"
                    ]
                    []
                ]
            , Svg.filter
                [ id "b"
                , width "1.539"
                , height "2.007"
                , x "-.27"
                , y "-.503"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".397"
                    ]
                    []
                ]
            , Svg.filter
                [ id "L"
                , width "1.309"
                , height "1.449"
                , x "-.155"
                , y "-.224"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".691"
                    ]
                    []
                ]
            , Svg.filter
                [ id "N"
                , width "2.552"
                , height "2.466"
                , x "-.776"
                , y "-.733"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".691"
                    ]
                    []
                ]
            , Svg.filter
                [ id "M"
                , width "2.013"
                , height "2.747"
                , x "-.507"
                , y "-.874"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".691"
                    ]
                    []
                ]
            , Svg.filter
                [ id "K"
                , width "1.417"
                , height "2.76"
                , x "-.209"
                , y "-.88"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".691"
                    ]
                    []
                ]
            , Svg.filter
                [ id "O"
                , width "1.289"
                , height "1.823"
                , x "-.144"
                , y "-.411"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".691"
                    ]
                    []
                ]
            , Svg.filter
                [ id "ag"
                , width "2.14"
                , height "2.14"
                , x "-.57"
                , y "-.57"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".688"
                    ]
                    []
                ]
            , Svg.filter
                [ id "af"
                , width "2.459"
                , height "2.878"
                , x "-.729"
                , y "-.939"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".688"
                    ]
                    []
                ]
            , Svg.filter
                [ id "ae"
                , width "2.312"
                , height "3.394"
                , x "-.656"
                , y "-1.197"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".688"
                    ]
                    []
                ]
            , Svg.filter
                [ id "ad"
                , width "2.545"
                , height "3.394"
                , x "-.772"
                , y "-1.197"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".688"
                    ]
                    []
                ]
            , Svg.filter
                [ id "ac"
                , width "1.819"
                , height "2.545"
                , x "-.409"
                , y "-.772"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".688"
                    ]
                    []
                ]
            , Svg.filter
                [ id "ab"
                , width "1.672"
                , height "2.312"
                , x "-.336"
                , y "-.656"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".688"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aa"
                , width "1.595"
                , height "2.093"
                , x "-.298"
                , y "-.546"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".688"
                    ]
                    []
                ]
            , Svg.filter
                [ id "Z"
                , width "1.459"
                , height "1.794"
                , x "-.23"
                , y "-.397"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".688"
                    ]
                    []
                ]
            , Svg.filter
                [ id "W"
                , width "1.304"
                , height "1.34"
                , x "-.152"
                , y "-.17"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".688"
                    ]
                    []
                ]
            , Svg.filter
                [ id "X"
                , width "2.192"
                , height "2.459"
                , x "-.596"
                , y "-.729"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".688"
                    ]
                    []
                ]
            , Svg.filter
                [ id "Y"
                , width "1.845"
                , height "1.971"
                , x "-.423"
                , y "-.485"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".688"
                    ]
                    []
                ]
            , Svg.filter
                [ id "T"
                , width "1.502"
                , height "1.456"
                , x "-.251"
                , y "-.228"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".263"
                    ]
                    []
                ]
            , Svg.filter
                [ id "Q"
                , width "1.396"
                , height "1.312"
                , x "-.198"
                , y "-.156"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".62"
                    ]
                    []
                ]
            , Svg.filter
                [ id "P"
                , width "1.284"
                , height "1.246"
                , x "-.142"
                , y "-.123"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".62"
                    ]
                    []
                ]
            , Svg.filter
                [ id "R"
                , width "1.431"
                , height "1.337"
                , x "-.216"
                , y "-.168"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".62"
                    ]
                    []
                ]
            , Svg.filter
                [ id "ah"
                , width "1.32"
                , height "1.329"
                , x "-.16"
                , y "-.165"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".581"
                    ]
                    []
                ]
            , Svg.filter
                [ id "ai"
                , width "1.598"
                , height "1.425"
                , x "-.299"
                , y "-.213"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".581"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aB"
                , width "3.087"
                , height "5.696"
                , x "-1.044"
                , y "-2.348"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".978"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aA"
                , width "1.681"
                , height "1.92"
                , x "-.341"
                , y "-.46"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".978"
                    ]
                    []
                ]
            , Svg.filter
                [ id "az"
                , width "1.617"
                , height "5.696"
                , x "-.309"
                , y "-2.348"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".978"
                    ]
                    []
                ]
            , Svg.filter
                [ id "ay"
                , width "1.541"
                , height "2.414"
                , x "-.271"
                , y "-.707"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".978"
                    ]
                    []
                ]
            , Svg.filter
                [ id "ax"
                , width "1.335"
                , height "2.584"
                , x "-.167"
                , y "-.792"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".978"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aw"
                , width "1.42"
                , height "1.719"
                , x "-.21"
                , y "-.359"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".978"
                    ]
                    []
                ]
            , Svg.filter
                [ id "av"
                , width "1.7"
                , height "4.985"
                , x "-.35"
                , y "-1.992"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".978"
                    ]
                    []
                ]
            , Svg.filter
                [ id "au"
                , width "1.859"
                , height "2.494"
                , x "-.43"
                , y "-.747"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".978"
                    ]
                    []
                ]
            , Svg.filter
                [ id "at"
                , width "2.164"
                , height "3.74"
                , x "-.582"
                , y "-1.37"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".978"
                    ]
                    []
                ]
            , Svg.filter
                [ id "as"
                , width "2.277"
                , height "3.087"
                , x "-.638"
                , y "-1.044"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".978"
                    ]
                    []
                ]
            , Svg.filter
                [ id "ar"
                , width "2.584"
                , height "3.087"
                , x "-.792"
                , y "-1.044"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".978"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aq"
                , width "2.494"
                , height "3.087"
                , x "-.747"
                , y "-1.044"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".978"
                    ]
                    []
                ]
            , Svg.filter
                [ id "ap"
                , width "2.801"
                , height "2.686"
                , x "-.901"
                , y "-.843"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".978"
                    ]
                    []
                ]
            , Svg.filter
                [ id "ao"
                , width "2.584"
                , height "3.267"
                , x "-.792"
                , y "-1.134"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".978"
                    ]
                    []
                ]
            , Svg.filter
                [ id "an"
                , width "2.218"
                , height "2.934"
                , x "-.609"
                , y "-.967"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".978"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aJ"
                , width "1.265"
                , height "1.604"
                , x "-.132"
                , y "-.302"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".571"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aE"
                , width "1.201"
                , height "1.453"
                , x "-.101"
                , y "-.226"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".571"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aG"
                , width "1.375"
                , height "1.604"
                , x "-.187"
                , y "-.302"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".571"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aF"
                , width "1.31"
                , height "1.837"
                , x "-.155"
                , y "-.419"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".571"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aD"
                , width "1.205"
                , height "1.544"
                , x "-.102"
                , y "-.272"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".571"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aH"
                , width "1.518"
                , height "2.559"
                , x "-.259"
                , y "-.78"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".571"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aI"
                , width "1.254"
                , height "1.654"
                , x "-.127"
                , y "-.327"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".346"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aC"
                , width "1.116"
                , height "1.412"
                , x "-.058"
                , y "-.206"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".346"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aP"
                , width "1.212"
                , height "1.268"
                , x "-.106"
                , y "-.134"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".268"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aQ"
                , width "1.176"
                , height "1.222"
                , x "-.088"
                , y "-.111"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".268"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aL"
                , width "1.25"
                , height "1.525"
                , x "-.125"
                , y "-.262"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".579"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aM"
                , width "1.234"
                , height "1.788"
                , x "-.117"
                , y "-.394"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".579"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aK"
                , width "1.25"
                , height "1.424"
                , x "-.125"
                , y "-.212"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".579"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aO"
                , width "1.25"
                , height "1.551"
                , x "-.125"
                , y "-.276"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".579"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aN"
                , width "1.212"
                , height "1.441"
                , x "-.106"
                , y "-.22"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".579"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aS"
                , width "1.369"
                , height "1.246"
                , x "-.185"
                , y "-.123"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".31"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aR"
                , width "1.328"
                , height "1.219"
                , x "-.164"
                , y "-.109"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".31"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aU"
                , width "1.043"
                , height "1.251"
                , x "-.022"
                , y "-.126"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".532"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aV"
                , width "1.16"
                , height "3.772"
                , x "-.08"
                , y "-1.386"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".723"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aW"
                , width "1.054"
                , height "1.227"
                , x "-.027"
                , y "-.114"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".436"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aX"
                , width "1.381"
                , height "1.761"
                , x "-.19"
                , y "-.38"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".311"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aY"
                , width "2.252"
                , height "4.395"
                , x "-.626"
                , y "-1.697"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".96"
                    ]
                    []
                ]
            , Svg.filter
                [ id "aZ"
                , width "2.252"
                , height "2.252"
                , x "-.626"
                , y "-.626"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".96"
                    ]
                    []
                ]
            , Svg.filter
                [ id "ba"
                , width "2.194"
                , height "2.554"
                , x "-.597"
                , y "-.777"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".96"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bc"
                , width "1.181"
                , height "1.518"
                , x "-.091"
                , y "-.259"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".571"
                    ]
                    []
                ]
            , Svg.filter
                [ id "be"
                , width "1.963"
                , height "1.211"
                , x "-.482"
                , y "-.106"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".571"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bb"
                , width "1.266"
                , height "2.218"
                , x "-.133"
                , y "-.609"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".571"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bd"
                , width "1.408"
                , height "1.073"
                , x "-.204"
                , y "-.036"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".571"
                    ]
                    []
                ]
            , Svg.filter
                [ id "j"
                , width "2.018"
                , height "5.255"
                , x "-.509"
                , y "-2.127"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.045"
                    ]
                    []
                ]
            , Svg.filter
                [ id "i"
                , width "3.925"
                , height "3.421"
                , x "-1.463"
                , y "-1.21"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.045"
                    ]
                    []
                ]
            , Svg.filter
                [ id "h"
                , width "3.065"
                , height "3.065"
                , x "-1.032"
                , y "-1.032"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.045"
                    ]
                    []
                ]
            , Svg.filter
                [ id "g"
                , width "3.229"
                , height "2.596"
                , x "-1.114"
                , y "-.798"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.045"
                    ]
                    []
                ]
            , Svg.filter
                [ id "f"
                , width "3.229"
                , height "3.421"
                , x "-1.114"
                , y "-1.21"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.045"
                    ]
                    []
                ]
            , Svg.filter
                [ id "e"
                , width "2.8"
                , height "3.229"
                , x "-.9"
                , y "-1.114"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.045"
                    ]
                    []
                ]
            , Svg.filter
                [ id "d"
                , width "2.116"
                , height "2.038"
                , x "-.558"
                , y "-.519"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.045"
                    ]
                    []
                ]
            , Svg.filter
                [ id "c"
                , width "2.692"
                , height "2.923"
                , x "-.846"
                , y "-.962"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.045"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bf"
                , width "6.015"
                , height "5.409"
                , x "-2.507"
                , y "-2.204"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.045"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bh"
                , width "1.49"
                , height "1.831"
                , x "-.245"
                , y "-.416"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".266"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bi"
                , width "1.49"
                , height "1.941"
                , x "-.245"
                , y "-.47"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".266"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bg"
                , width "1.384"
                , height "1.745"
                , x "-.192"
                , y "-.372"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".266"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bj"
                , width "1.393"
                , height "1.793"
                , x "-.197"
                , y "-.396"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.132"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bk"
                , width "1.432"
                , height "1.718"
                , x "-.216"
                , y "-.359"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.132"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bl"
                , width "1.388"
                , height "1.656"
                , x "-.194"
                , y "-.328"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.132"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bm"
                , width "1.383"
                , height "1.604"
                , x "-.192"
                , y "-.302"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.132"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bn"
                , width "1.404"
                , height "1.629"
                , x "-.202"
                , y "-.315"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.132"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bo"
                , width "1.088"
                , height "1.226"
                , x "-.044"
                , y "-.113"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".494"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bp"
                , width "1.077"
                , height "1.611"
                , x "-.038"
                , y "-.305"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".491"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bu"
                , width "1.266"
                , height "2.572"
                , x "-.133"
                , y "-.786"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".737"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bv"
                , width "1.17"
                , height "2.869"
                , x "-.085"
                , y "-.934"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".737"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bt"
                , width "1.167"
                , height "2.27"
                , x "-.084"
                , y "-.635"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".737"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bq"
                , width "2.869"
                , height "1.149"
                , x "-.934"
                , y "-.075"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".737"
                    ]
                    []
                ]
            , Svg.filter
                [ id "br"
                , width "4.001"
                , height "1.158"
                , x "-1.501"
                , y "-.079"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".737"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bs"
                , width "3.538"
                , height "1.179"
                , x "-1.269"
                , y "-.09"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".737"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bE"
                , width "4.518"
                , height "1.673"
                , x "-1.759"
                , y "-.336"
                ]
                [ feGaussianBlur
                    [ stdDeviation "2.042"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bD"
                , width "2.989"
                , height "1.789"
                , x "-.994"
                , y "-.394"
                ]
                [ feGaussianBlur
                    [ stdDeviation "2.042"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bF"
                , width "1.242"
                , height "1.809"
                , x "-.121"
                , y "-.405"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".59"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bz"
                , width "2.367"
                , height "1.153"
                , x "-.684"
                , y "-.077"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".59"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bx"
                , width "1.112"
                , height "1.275"
                , x "-.056"
                , y "-.138"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".59"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bw"
                , width "1.672"
                , height "1.364"
                , x "-.336"
                , y "-.182"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".59"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bI"
                , width "1.223"
                , height "1.108"
                , x "-.112"
                , y "-.054"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".279"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bH"
                , width "1.13"
                , height "1.317"
                , x "-.065"
                , y "-.159"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".279"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bG"
                , width "1.223"
                , height "1.18"
                , x "-.112"
                , y "-.09"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".279"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bC"
                , width "2.338"
                , height "1.114"
                , x "-.669"
                , y "-.057"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".279"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bB"
                , width "1.78"
                , height "1.114"
                , x "-.39"
                , y "-.057"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".279"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bA"
                , width "1.48"
                , height "1.13"
                , x "-.24"
                , y "-.065"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".279"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bO"
                , width "1.217"
                , height "1.133"
                , x "-.109"
                , y "-.066"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".789"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bN"
                , width "1.898"
                , height "1.564"
                , x "-.449"
                , y "-.282"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".789"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bM"
                , width "1.427"
                , height "1.161"
                , x "-.214"
                , y "-.081"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".789"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bL"
                , width "1.146"
                , height "1.296"
                , x "-.073"
                , y "-.148"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".789"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bK"
                , width "1.231"
                , height "1.222"
                , x "-.116"
                , y "-.111"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".789"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bJ"
                , width "1.535"
                , height "1.26"
                , x "-.268"
                , y "-.13"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".789"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bV"
                , width "2.076"
                , height "1.354"
                , x "-.538"
                , y "-.177"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".785"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bU"
                , width "1.409"
                , height "1.533"
                , x "-.204"
                , y "-.266"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".785"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bT"
                , width "1.366"
                , height "1.221"
                , x "-.183"
                , y "-.11"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".785"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bS"
                , width "1.443"
                , height "1.173"
                , x "-.222"
                , y "-.087"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".785"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bR"
                , width "1.394"
                , height "1.628"
                , x "-.197"
                , y "-.314"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".785"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bQ"
                , width "1.561"
                , height "1.287"
                , x "-.281"
                , y "-.143"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".785"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bP"
                , width "2.199"
                , height "1.236"
                , x "-.599"
                , y "-.118"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".785"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bZ"
                , width "1.276"
                , height "1.655"
                , x "-.138"
                , y "-.328"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".673"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bY"
                , width "1.766"
                , height "1.198"
                , x "-.383"
                , y "-.099"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".673"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bX"
                , width "1.239"
                , height "1.26"
                , x "-.12"
                , y "-.13"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".673"
                    ]
                    []
                ]
            , Svg.filter
                [ id "bW"
                , width "1.193"
                , height "2.559"
                , x "-.097"
                , y "-.78"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".673"
                    ]
                    []
                ]
            , Svg.filter
                [ id "cc"
                , width "1.569"
                , height "1.392"
                , x "-.284"
                , y "-.196"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".753"
                    ]
                    []
                ]
            , Svg.filter
                [ id "cb"
                , width "1.268"
                , height "1.569"
                , x "-.134"
                , y "-.284"
                ]
                [ feGaussianBlur
                    [ stdDeviation ".753"
                    ]
                    []
                ]
            , Svg.filter
                [ id "cg"
                , width "1.958"
                , height "2.361"
                , x "-.479"
                , y "-.681"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.259"
                    ]
                    []
                ]
            , Svg.filter
                [ id "cf"
                , width "1.726"
                , height "3.67"
                , x "-.363"
                , y "-1.335"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.259"
                    ]
                    []
                ]
            , Svg.filter
                [ id "ce"
                , width "1.452"
                , height "4.437"
                , x "-.226"
                , y "-1.718"
                ]
                [ feGaussianBlur
                    [ stdDeviation "1.259"
                    ]
                    []
                ]
            , Svg.filter
                [ id "r"
                , width "1.158"
                , height "1.534"
                , x "-.079"
                , y "-.267"
                ]
                []
            , Svg.filter
                [ id "am"
                , width "1.452"
                , height "1.475"
                , x "-.226"
                , y "-.238"
                ]
                []
            , Svg.filter
                [ id "al"
                , width "1.274"
                , height "1.153"
                , x "-.137"
                , y "-.077"
                ]
                []
            , Svg.filter
                [ id "ak"
                , width "1.239"
                , height "1.145"
                , x "-.119"
                , y "-.073"
                ]
                []
            ]
        , Svg.path
            [ fill "#a67531"
            , fillRule "evenodd"
            , d "M70.025 59.596s-6.36 1.276-7.695 1.507-3.117.29-3.117.29-1.59 5.507-2.035 6.377-4.007 5.622-4.007 5.622l-2.353.348-1.145-.58-.063 2.377s3.37 1.101 3.689 1.101 3.18-.116 3.18-.116l.254-2.26.572-.232.191-1.913 1.115-.365.21-1.78.543-.635.22-1.66.202-.14.19-2.144.734-.297.22-1.964 9.556-.87.62-2.782-.318.174-.763-.058z"
            ]
            []
        , Svg.path
            [ fill "#ce9a52"
            , fillRule "evenodd"
            , d "m70.32 59.605-1.314-.76-10.494 1.623-6.36 11.593-4.198.058 1.844 1.664 3.623-.265 4.07-5.705 1.99-6.37 2.355-.098 8.483-1.74z"
            ]
            []
        , Svg.path
            [ fill "#8c6e66"
            , fillRule "evenodd"
            , stroke "#000"
            , d "M432.86 539.51s-49.286-5-55.714-5-19.286.714-21.429 3.929l-4.286 6.428s-22.143 13.93-26.07 15.714-22.5 12.143-28.215 9.643-7.143-5-7.5-8.214-2.143-49.643-1.428-59.643 6.428-41.786 6.428-41.786-3.214-17.143-3.928-23.571.714-31.071 1.428-37.857-1.071-14.286 1.429-15 16.07-3.929 19.286-4.643 7.857-4.286 10.714-4.286 7.5 2.143 9.643 1.072 6.785-3.929 6.785-3.929 5 3.571 9.286 2.5 6.786-3.214 6.786-3.214h13.57c3.572 0 6.787-.715 8.93-.357s12.857 2.142 15 1.785 8.928-2.5 10.714-1.785 5.357 10.357 7.857 13.214 9.643 8.57 13.929 22.5 3.571 28.929 3.571 32.143-1.071 6.07-1.071 6.07 13.929 23.93 13.929 43.215-3.572 36.429-3.572 36.429 2.5 7.143 1.786 8.571-2.143 4.643-3.929 5.715-3.571.714-3.928.357z"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#684a2e"
            , fillRule "evenodd"
            , d "m55.52 40.37-8.725-5.41-3.778-1.394s-4.677 1.066-5.037 1.066-8.814.082-8.814.082l-2.519 1.803-2.338 2.296.45 1.721 3.957-.655 4.587.327 4.317-.082s-.18.246.45.492 3.598.246 3.598.246l2.069.492h1.529l.72-.082.539-.902 2.248 1.148s1.35.574 2.069.574h2.608c.36 0 1.53.656 1.53.656s.629.246.809-.328-.36-1.886-.27-2.05z"
            ]
            []
        , Svg.path
            [ fill "#ae7322"
            , fillRule "evenodd"
            , d "m95.59 58.857-11.333-3.156-.9.123v.287l-3.058.246-1.17.41-.314 1.23s.36 1.393.54 1.639.045 1.066.045 1.066l1.304 1.106 4.137.943s1.35-.574 1.934-.82 2.968-2.213 2.968-2.213 1.395-.492 1.664-.492 1.44 0 1.8-.04 2.383-.288 2.383-.329z"
            ]
            []
        , Svg.path
            [ fill "#8f5817"
            , fillRule "evenodd"
            , d "M91.273 59.185c-.495-.082-8.275-2.295-8.275-2.295l-3.103.164-.09-.574 3.553-.287v-.328l.855-.246 11.467 3.238-4.407.328z"
            ]
            []
        , Svg.path
            [ fill "#25170d"
            , fillRule "evenodd"
            , d "m83.808 55.29-.045-.328-.314-.164.18-3.238.27-.205-.046-.287.585-.164v-.246l-.63-.286s.36-.984-.63-.943-.989.86-.989.86l-1.304.165-.315-.328.495-1.148h.27l-.495-1.148.36-.45-.45-.206s.045-.86-.45-.901-.899.82-.899.82l-.36.122.315.615-1.034.943.495.123.18 1.353-.27.41-1.71-.124-.044-.532s-.135-.328-.765-.328-.9.45-.9.45l-.044.533-1.034-.123-.9.574-.764 1.353s-.405-.697-.945-.697-.99.697-.99.697l.136.45-1.394-.122s-.63.082-.675.697 1.754.983 1.754.983h.135l-.09 3.075-.405.123.045.327-.27.082.045.492-.63.164s-.224.328-.044.328 1.259.615 1.259.615l.495-.123.854-2.87.27-1.639-.09-1.27 1.304-.37.495-.368 1.259-1.435.27-.04v1.106l.854-.943 5.847-.45.134.122h.27l-.36 1.558-.27 3.197 1.485-.123v-.287l1.169-.164-.045-.328-.63.041z"
            ]
            []
        , Svg.path
            [ fill "#f4de07"
            , fillRule "evenodd"
            , stroke "#f5e122"
            , d "m196.25 486.47 1.071 1.607.893-.714-1.964-.893z"
            , SA.filter "url(#c)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#f4de07"
            , fillRule "evenodd"
            , stroke "#f5e122"
            , d "M209.29 479.33s3.036 4.107 3.036 3.393.893-3.75.178-3.75-2.678.357-3.214.357z"
            , SA.filter "url(#d)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#f4de07"
            , fillRule "evenodd"
            , stroke "#f5e122"
            , d "m209.46 476.83 1.607-.893.179 1.25"
            , SA.filter "url(#e)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#f4de07"
            , fillRule "evenodd"
            , stroke "#f5e122"
            , d "m212.14 489.86 1.25 1.071"
            , SA.filter "url(#f)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#f4de07"
            , fillRule "evenodd"
            , stroke "#f5e122"
            , d "m229.29 492.72 1.25 2.143"
            , SA.filter "url(#g)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#f4de07"
            , fillRule "evenodd"
            , stroke "#f5e122"
            , d "m223.93 487.54 1.429 1.429"
            , SA.filter "url(#h)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#f4de07"
            , fillRule "evenodd"
            , stroke "#f5e122"
            , d "m242.5 496.47.714 1.071"
            , SA.filter "url(#i)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#f4de07"
            , fillRule "evenodd"
            , stroke "#f5e122"
            , d "m235.54 500.4 3.929-.179"
            , SA.filter "url(#j)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#2c1a0a"
            , fillRule "evenodd"
            , d "M84.652 81.044 84.08 84s-.827 2.435-2.735 4.928-3.816 4.695-3.816 4.695-.381.87-1.717 1.217-25.821 4.985-26.647 5.044-6.424.347-11.703-.522-8.14-2.899-8.776-3.594-2.163-3.826-2.544-4.58-1.718-3.13-3.053-4.29l-1.336-1.158 2.544-.232 14.938-.53 27.21-2.44 16.49-2.752 1.717 1.258z"
            ]
            []
        , Svg.path
            [ fill "#854f10"
            , fillRule "evenodd"
            , d "M49.545 87.249s7.569-.058 11.067-.29 9.54-1.45 9.54-1.45.636-.173.954-.463.89-2.203 1.272-2.377 3.689-1.16 3.689-1.16l.063 1.044s.827 1.45 3.689 1.218 4.897-2.609 4.897-2.609l.382-2.898 9.158-3.536s2.294-1.143 1.654-3.768c-.255-1.043-1.4-1.16-1.4-1.16s.764-3.477.764-3.941 3.116-5.739 3.116-5.739l-5.979.348.636.927s-.954-.695-1.653-.58-1.717 1.682-2.29 2.087-4.579 2.261-5.596 2.435-8.968 1.45-8.968 1.45l-2.162-.117-2.163 8-3.37 4.347s-6.933 1.507-7.315 1.507-4.579.348-4.579.348l-1.208-.637-.127 1.68s-.446 1.334-1.272 2.435-2.99 3.015-2.799 2.899z"
            ]
            []
        , Svg.path
            [ fill "#781a18"
            , fillRule "evenodd"
            , d "m76.117 76.114-4.407 1.188-2.204 2.993-7.645 1.434-8.05.328-.989 1.763-2.114 2.54 7.915-.04s8.5-.984 8.68-1.107 3.328-.86 3.328-.86l1.574-2.665 4.002-1.188-.09-4.386zm16.707-7.908.16-3.855s-.191 1.71-1.495 1.681-1.4-.29-1.59-.463-.445-.84-.445-1.189v-.347s-1.4.84-1.527.87-4.642 1.39-5.279 1.564-5.946 1.304-5.946 1.304.159.986-.35 1.42-1.272.696-1.272.696l-1.463 5.188 1.908-.666.51-1.334 8.013-1.13 5.946-2.754s.477-1.159 1.431-1.304 1.4.377 1.4.319z"
            ]
            []
        , Svg.path
            [ fill "#2f1f00"
            , fillRule "evenodd"
            , stroke "#000"
            , d "m274.46 683.17 1.429-34.018 33.125 5.357-.536 32.857-34.018-4.196z"
            , SA.filter "url(#k)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#2f1f00"
            , fillRule "evenodd"
            , stroke "#161000"
            , d "m308.57 663.88-32.5-5"
            , SA.filter "url(#l)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#2f1f00"
            , fillRule "evenodd"
            , stroke "#161000"
            , d "m308.57 670.58-33.036-5.536"
            , SA.filter "url(#m)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#2f1f00"
            , fillRule "evenodd"
            , stroke "#161000"
            , d "m308.57 677.01-32.946-5.09"
            , SA.filter "url(#n)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#2f1f00"
            , fillRule "evenodd"
            , stroke "#161000"
            , d "m308.48 682.27-33.214-4.464"
            , SA.filter "url(#o)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#593c00"
            , d "M57.186 94.232a.439.507 90 1 0 1.014 0 .439.507 90 1 0-1.014 0z"
            ]
            []
        , use
            [ xlinkHref "#p"
            , SA.filter "url(#a)"
            , transform "matrix(-.25184 0 0 .22954 148.252 -62.315)"
            ]
            []
        , Svg.path
            [ fill "#593c00"
            , d "M56.835 92.573a.439.507 90 1 0 1.013 0 .439.507 90 1 0-1.013 0z"
            ]
            []
        , use
            [ xlinkHref "#p"
            , SA.filter "url(#a)"
            , transform "matrix(-.25184 0 0 .22954 147.9 -63.974)"
            ]
            []
        , Svg.path
            [ fill "#593c00"
            , d "M56.767 91.118a.439.507 90 1 0 1.014 0 .439.507 90 1 0-1.014 0z"
            ]
            []
        , use
            [ xlinkHref "#p"
            , SA.filter "url(#a)"
            , transform "matrix(-.25184 0 0 .22954 147.833 -65.43)"
            ]
            []
        , Svg.path
            [ fill "#593c00"
            , d "M56.992 89.704a.439.507 90 1 0 1.014 0 .439.507 90 1 0-1.014 0z"
            ]
            []
        , use
            [ xlinkHref "#p"
            , SA.filter "url(#a)"
            , transform "matrix(-.25184 0 0 .22954 148.058 -66.843)"
            ]
            []
        , Svg.path
            [ fill "#593c00"
            , d "M57.316 88.761a.439.507 90 1 0 1.014 0 .439.507 90 1 0-1.014 0z"
            ]
            []
        , use
            [ xlinkHref "#p"
            , SA.filter "url(#a)"
            , transform "matrix(-.25184 0 0 .22954 148.382 -67.786)"
            ]
            []
        , Svg.path
            [ fill "#593c00"
            , d "M61.017 94.09a.439.507 90 1 0 1.014 0 .439.507 90 1 0-1.014 0z"
            ]
            []
        , use
            [ xlinkHref "#p"
            , SA.filter "url(#a)"
            , transform "matrix(-.25184 0 0 .22954 152.083 -62.458)"
            ]
            []
        , Svg.path
            [ fill "#593c00"
            , d "M61.332 92.348a.439.507 90 1 0 1.014 0 .439.507 90 1 0-1.014 0z"
            ]
            []
        , use
            [ xlinkHref "#p"
            , SA.filter "url(#a)"
            , transform "matrix(-.25184 0 0 .22954 152.398 -64.2)"
            ]
            []
        , Svg.path
            [ fill "#593c00"
            , d "M61.354 89.683a.439.507 90 1 0 1.014 0 .439.507 90 1 0-1.014 0z"
            ]
            []
        , use
            [ xlinkHref "#p"
            , SA.filter "url(#a)"
            , transform "matrix(-.25184 0 0 .22954 152.42 -66.864)"
            ]
            []
        , Svg.path
            [ fill "#593c00"
            , d "M61.084 88.7a.439.507 90 1 0 1.014 0 .439.507 90 1 0-1.014 0z"
            ]
            []
        , use
            [ xlinkHref "#p"
            , SA.filter "url(#a)"
            , transform "matrix(-.25184 0 0 .22954 152.15 -67.848)"
            ]
            []
        , Svg.path
            [ fill "#775000"
            , fillRule "evenodd"
            , d "M60.513 91.832s-.09 1.025-.652 1.005-.72-.964-.72-.964l-.022-.368-.967-.123.158-2.07s.044-.923 1.281-.923 1.484.82 1.484.82l.158 2.03-.742.286.022.307z"
            ]
            []
        , Svg.path
            [ fill "#593c00"
            , d "M58.983 89.937a.195.259 90 1 0 .517 0 .195.259 90 1 0-.517 0zm1.068-.01a.195.259 90 1 0 .517 0 .195.259 90 1 0-.517 0z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "m288.3 667.36 1.16-3.393 1.786 3.572"
            , SA.filter "url(#q)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "m349.82 671.38 2.679.09"
            , SA.filter "url(#r)"
            , transform "matrix(-.24983 .02892 .03173 .2277 126.243 -71.242)"
            ]
            []
        , Svg.path
            [ fill "#593c00"
            , d "M61.534 90.934a.439.507 90 1 0 1.014 0 .439.507 90 1 0-1.014 0z"
            ]
            []
        , use
            [ xlinkHref "#p"
            , SA.filter "url(#a)"
            , transform "matrix(-.25184 0 0 .22954 152.6 -65.614)"
            ]
            []
        , Svg.path
            [ fill "#f9a800"
            , fillRule "evenodd"
            , d "m290.89 657.09 1.875 1.429 1.429-.893-1.697-1.25-3.214.357 1.607.357z"
            , SA.filter "url(#s)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , strokeWidth "2.8"
            , d "m310.04 686.92.714-34.286-33.875-4.286"
            , SA.filter "url(#t)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#131311"
            , fillRule "evenodd"
            , d "M327.73 703.44s38.133 1.263 46.972-3.03 22.223-21.718 22.728-22.981 12.627-21.213 15.91-23.991 32.072-19.951 32.072-19.951l5.303 2.525s-20.708 12.879-24.749 17.425-12.879 27.779-22.728 34.85-15.91 12.374-21.718 13.89-40.659 3.535-40.659 3.535l-13.132-2.272z"
            , SA.filter "url(#u)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#7f400c"
            , fillRule "evenodd"
            , d "m53.807 78.551-.318 3.826s-1.145 2.84-4.07 4.812-7.378 2.782-8.968 2.782-6.17-.695-8.904-1.565-11.003-5.043-11.003-5.043-3.243-.232-3.688-.986-1.654-2.84-1.463-3.42 1.399-1.97 2.226-2.028 1.208-.174 1.526.057 2.417 1.276 3.053 1.508 4.515 2.144 9.286 2.434 7.95-.058 8.204-.058 4.515-1.217 5.151-1.623 2.036-1.275 2.036-1.275.826-1.565 1.462-1.855 1.654-.638 2.163-.522 2.544.754 2.798 1.334.51 1.739.51 1.623z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "M439.61 620.36s4.04-5.303 8.081-5.05 7.576 1.262 7.829 3.03-.505 7.07-2.778 7.828-3.535 1.516-5.808-.505-3.536-2.525-2.273-4.545 3.03-3.03 4.546-2.273 2.525.505 2.272 2.02.505 2.273-1.262 2.525l-1.768.253"
            , SA.filter "url(#v)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "M332.53 617.07s0 2.778-4.04 4.293-4.546 2.526-7.072-.252-4.798-3.536-4.04-7.324.505-5.05 3.535-4.798 4.546-1.01 5.556 1.768 4.04 4.293 1.01 6.313-2.273 4.546-4.798 1.01-4.798-5.303-2.273-5.556 3.536 0 3.788 1.263l.253 1.263"
            , SA.filter "url(#w)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#951100"
            , fillRule "evenodd"
            , stroke "#a80303"
            , d "M379 654.45s-3.535-9.849-3.662-11.743-.884-10.102-.884-10.102-11.617-1.01-23.107-5.05-17.173-9.092-17.173-9.092l.253 4.42s1.515 1.767 1.136 3.535-3.283 2.146-3.283 2.146 1.01 2.652 0 3.283-3.535-.757-3.535-.757 0 1.01-1.39 1.389-3.661-1.137-3.661-1.137l.631 3.283s3.03 9.092 13.511 14.016 17.551 6.693 25.38 7.198S379 654.576 379 654.449z"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#8c5000"
            , fillRule "evenodd"
            , d "m42.008 86.174-1.368-.463s.16-.261.223.318.318 1.392-.254 1.42-2.258.204-1.94-1.1 1.844-1.624 2.003-1.595 1.463.319 1.813.348.54-.174.54-.174-.318-.464-.159-.927.51-1.102.7-1.16.604-.26.89.087.382.406.35.783-.19.608-.222.87-.255.724-.255.724.477-1.044 1.177-1.362 1.176-.551 1.844-.377 1.209.464.986 1.217-.19.957-.731 1.13-1.336.203-1.336.203l-1.145 1.16s-.381.174-.445 0-.095-.522-.095-.522-.35.928-.827.928-.318.318-.795.029-.922-1.508-.954-1.537z"
            ]
            []
        , Svg.path
            [ fill "#e0bc38"
            , fillRule "evenodd"
            , d "m340.61 640.05 3.535.505-2.146-1.389-1.39.884z"
            , SA.filter "url(#x)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#e8cc48"
            , fillRule "evenodd"
            , d "M349.32 640.18c-.379-.631-2.778-2.778-4.546-3.662s-5.934-2.02-5.934-2.02 2.399-.505 3.788-.126 3.283 1.136 3.283 1.136l2.399 2.02 1.263 1.768-.253.884z"
            , SA.filter "url(#y)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#e0bc38"
            , fillRule "evenodd"
            , d "m353.62 646.62 1.136 2.273.884-2.526-2.02.253z"
            , SA.filter "url(#z)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#e0bc38"
            , fillRule "evenodd"
            , d "m356.02 639.93-1.894.379 2.525 2.02 1.263-.631-1.894-1.768z"
            , SA.filter "url(#A)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#e0bc38"
            , fillRule "evenodd"
            , d "m351.72 632.1 3.157.505-.758-1.136-2.399.631z"
            , SA.filter "url(#B)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#e0bc38"
            , fillRule "evenodd"
            , d "m366.5 644.09 2.02.631-.631-1.389-1.263-.126-.126.884z"
            , SA.filter "url(#C)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#e0bc38"
            , fillRule "evenodd"
            , d "M349.83 640.56s-2.4-3.535-4.167-4.42-4.42-1.893-4.42-1.893"
            , SA.filter "url(#D)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#e0bc38"
            , fillRule "evenodd"
            , d "M370.29 640.94s-.758-.884-2.525-1.389-3.283-.505-3.283-.505"
            , SA.filter "url(#E)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "m333.54 618.59.253 4.546-5.304.505 4.798 1.01"
            , SA.filter "url(#F)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "m333.04 629.19-5.556-4.293"
            , SA.filter "url(#G)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "m329 631.72-3.283-5.556"
            , SA.filter "url(#H)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "M324.2 631.97c0-1.01-1.768-4.293-1.768-4.293"
            , SA.filter "url(#I)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#951100"
            , fillRule "evenodd"
            , d "M37.303 83.335s0 1.739-.318 2.667-.7 2.202-.7 2.202-2.098-.492-2.543-.608-1.558-.58-1.558-.58l1.303-3.797s1.336.174 1.94.232 1.908-.087 1.876-.116zm-5.023-.262-4.262-.927-1.145 2.84 4.23 1.74s.763-1.218.922-1.798.159-1.913.254-1.855zm-5.536-1.246-4.452-1.391s-.795.319-.827.55.095 1.044.095 1.044 3.975 2.376 4.452 2.492.795-2.608.732-2.695z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#f0be04"
            , d "M336.25 613.43s10.536 9.643 25.893 11.786 23.75 1.786 27.857 1.429 26.429-4.822 26.429-4.822l23.75-8.928 5.357-2.322"
            , SA.filter "url(#J)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#ae7c3d"
            , fillRule "evenodd"
            , d "m70.214 74.9 1.972.637-2.862 4.58s-2.799-.812-2.48-1.102 3.307-4.057 3.37-4.115z"
            ]
            []
        , Svg.path
            [ fill "#c08741"
            , fillRule "evenodd"
            , d "m66.653 79.132-7.441 1.507s-4.07.29-4.325.29-1.208-.464-1.208-.464l.127 1.276s3.18.116 5.66-.116 9.73-1.565 9.73-1.565l-2.543-.928z"
            ]
            []
        , Svg.path
            [ fill "#c78f40"
            , fillRule "evenodd"
            , d "m72.314 66.668-11.31-3.546 9.275-1.054-.19 1.934 4.987 1.575 6.763-1.237-2.846-1.382.235-1.746 5.729 1.416-.686.446.763.464.48.027 1.503-.573s1.4-.811 1.654-1.159.698-1.74 2.339-1.838c1.373-.081 2.192 1.446 2.192 1.446s-1.617-.801-1.998-.627-1.89 2.019-1.89 2.019l-4.4 2.157-3.483.886-6.89.908-2.226-.116z"
            ]
            []
        , Svg.path
            [ fill "#ffd203"
            , fillRule "evenodd"
            , stroke "#f6d208"
            , d "m150.83 562.9 6.945.884"
            , SA.filter "url(#K)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#ffd203"
            , fillRule "evenodd"
            , stroke "#f6d208"
            , d "M142.5 535.88s.758-2.273 2.4-1.768 7.323 6.314 7.323 6.314"
            , SA.filter "url(#L)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#ffd203"
            , fillRule "evenodd"
            , stroke "#f6d208"
            , d "M147.93 547.63s1.515-.126 1.894.379l.379.505"
            , SA.filter "url(#M)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#ffd203"
            , fillRule "evenodd"
            , stroke "#f6d208"
            , d "m155.75 548.64 1.136-1.263"
            , SA.filter "url(#N)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#ffd203"
            , fillRule "evenodd"
            , stroke "#f6d208"
            , d "m158.66 574.9-6.06-1.136-1.011 1.262-2.526 1.263 6.188.505 4.293-.505-.884-1.389z"
            , SA.filter "url(#O)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "M152.09 585.38s.758 2.652 1.389 2.652 2.652-1.768 2.147-4.42-4.925-2.273-4.925-2.273-2.399 1.263-1.641 4.167 1.767 4.546 3.283 5.304 2.146 2.272 3.535 1.262 2.526-4.545 2.526-4.545"
            , SA.filter "url(#P)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "M164.09 545.35s4.167.631 3.535 5.177-3.661 3.157-3.661 3.157-3.03-2.904-2.778-5.177 2.904-3.03 2.904-3.157z"
            , SA.filter "url(#Q)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "M163.33 573.76s3.283 3.41 1.136 3.535-1.894.253-2.904-1.389-1.01-4.924.253-5.05 3.662.884 4.293 2.778.631 5.05.631 5.05"
            , SA.filter "url(#R)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#781a18"
            , fillRule "evenodd"
            , d "m92.157 74.436.286-3.74s-.477.639-.858.639-1.177-.522-1.177-.522l-4.07 1.97-1.145 4.696 6.964-3.043z"
            ]
            []
        , Svg.path
            [ fill "#5d2a11"
            , fillRule "evenodd"
            , d "M86.052 75.017s.35.782.7.695 1.336-2.348 1.336-2.348.254-.985.763-1.159 1.113-.609 1.399-.232.477.957.445 1.247-.095.608-.445 1.043-.19.493-.795.84-.413.377-.986.61.064.144-.986.492-.286.116-1.08.435-.828-.58-.828-.58l.477-1.043z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#fad011"
            , d "M171.16 583.23s3.157 1.263 4.04 2.02 2.526 4.799 2.526 4.799"
            , SA.filter "url(#S)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#fad011"
            , d "M180.38 597.5s0 1.263.758 1.515l.757.253"
            , SA.filter "url(#T)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#b29303"
            , d "m191.49 584.12-22.223-11.743s-3.03-5.43-5.935-5.808-4.293 2.146-4.293 2.146"
            , SA.filter "url(#U)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#5d2a11"
            , fillRule "evenodd"
            , d "M85.51 70.844s.669-1.015.923-1.073 1.78-.753 1.78-.753l.319-.754.35.406s.636.55 1.24.116 1.05-.986.986-1.304-.064-1.218-.223-1.305-.668-.406-.859-.29-.413.232-.572.087-.127-.29-.318-.29-3.053 2.609-3.053 2.609-.636 1.16-.795 1.594.127 1.043.223.957zm-.412-.524c0-.232-.032-1.246-.223-1.362s-.668-.26-.668-.26 1.177-.957 1.177-1.16 0-.609.286-.87 1.209-1.043 1.209-1.043l-1.59.435-.636.058-1.654.608-1.272-.029-.35.812-.827-.087-.159.232-.318-.203-.413.174-.827-.29-.509.927.032 1.884-.509.03-.19-1.015-.35.029-.16.464-.635-.551-1.05.696s.35-.087.477.463-1.08 1.16-.604 1.971.604.87 1.4.84 7.186-.695 7.186-.695.064-.638.414-1.043.477-.32.604-.638.19-.348.159-.377z"
            ]
            []
        , Svg.path
            [ fill "#7f400c"
            , d "M82.681 72.916a.565.636 90 1 0 1.272 0 .565.636 90 1 0-1.272 0z"
            ]
            []
        , use
            [ xlinkHref "#V"
            , fillRule "evenodd"
            , SA.filter "url(#b)"
            , transform "matrix(-.25184 0 0 .22954 148.252 -62.315)"
            ]
            []
        , Svg.path
            [ fill "#7f400c"
            , d "M80.996 73.075a.565.636 90 1 0 1.272 0 .565.636 90 1 0-1.272 0z"
            ]
            []
        , use
            [ xlinkHref "#V"
            , fillRule "evenodd"
            , SA.filter "url(#b)"
            , transform "matrix(-.25184 0 0 .22954 146.566 -62.156)"
            ]
            []
        , Svg.path
            [ fill "#7f400c"
            , d "M79.342 73.336a.565.636 90 1 0 1.272 0 .565.636 90 1 0-1.272 0z"
            ]
            []
        , use
            [ xlinkHref "#V"
            , fillRule "evenodd"
            , SA.filter "url(#b)"
            , transform "matrix(-.25184 0 0 .22954 144.913 -61.895)"
            ]
            []
        , Svg.path
            [ fill "#7f400c"
            , d "M77.657 73.568a.565.636 90 1 0 1.272 0 .565.636 90 1 0-1.272 0z"
            ]
            []
        , use
            [ xlinkHref "#V"
            , fillRule "evenodd"
            , SA.filter "url(#b)"
            , transform "matrix(-.25184 0 0 .22954 143.227 -61.663)"
            ]
            []
        , Svg.path
            [ fill "#7f400c"
            , d "M75.908 73.859a.74.78 90 1 0 1.558 0 .74.78 90 1 0-1.558 0z"
            ]
            []
        , use
            [ xlinkHref "#V"
            , fillRule "evenodd"
            , SA.filter "url(#b)"
            , transform "matrix(-.3085 0 0 .30017 156.232 -102.982)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#fee70d"
            , d "m184.67 566.06-9.849-8.713"
            , SA.filter "url(#W)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#fee70d"
            , d "m171.03 560.25-1.768-1.263"
            , SA.filter "url(#X)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#fee70d"
            , d "m171.29 567.2-1.894-.631-1.01-1.768"
            , SA.filter "url(#Y)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#e8cc48"
            , fillRule "evenodd"
            , stroke "#fdd80e"
            , d "m192.12 560.88-6.187-3.157"
            , SA.filter "url(#Z)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#e8cc48"
            , fillRule "evenodd"
            , stroke "#fdd80e"
            , d "M195.66 560.25c-.758-.253-4.546-2.02-4.546-2.02"
            , SA.filter "url(#aa)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#e8cc48"
            , fillRule "evenodd"
            , stroke "#fdd80e"
            , d "m203.36 562.78-1.768-1.515-2.146.379"
            , SA.filter "url(#ab)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#e8cc48"
            , fillRule "evenodd"
            , stroke "#fdd80e"
            , d "m203.99 567.83-.631.758-2.4-1.137 3.031.379z"
            , SA.filter "url(#ac)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#e8cc48"
            , fillRule "evenodd"
            , stroke "#fdd80e"
            , d "m206.01 564.92 1.136.379"
            , SA.filter "url(#ad)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#e8cc48"
            , fillRule "evenodd"
            , stroke "#fdd80e"
            , d "m209.42 565.56 1.515.379"
            , SA.filter "url(#ae)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#e8cc48"
            , fillRule "evenodd"
            , stroke "#fdd80e"
            , d "m212.83 564.29 1.263.758"
            , SA.filter "url(#af)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#e8cc48"
            , fillRule "evenodd"
            , stroke "#fdd80e"
            , d "M209.8 575.4c.631.253 1.894 1.894 1.894 1.894"
            , SA.filter "url(#ag)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "M222.93 565.05s2.4-2.4 4.293-2.147 3.536 2.652 3.41 4.041-.758 3.41-2.147 3.41-3.914-1.39-3.662-2.4.758-1.641 1.39-1.641 2.146.884 2.146.884"
            , SA.filter "url(#ah)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "M228.86 574.14s2.147-1.389 2.904-2.778.758-2.778.758-2.778"
            , SA.filter "url(#ai)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#7f400c"
            , d "M84.206 73.04a.565.636 90 1 0 1.272 0 .565.636 90 1 0-1.272 0z"
            ]
            []
        , use
            [ xlinkHref "#V"
            , fillRule "evenodd"
            , SA.filter "url(#b)"
            , transform "matrix(-.25184 0 0 .22954 149.777 -62.191)"
            ]
            []
        , Svg.path
            [ fill "#1a2402"
            , fillRule "evenodd"
            , stroke "#000"
            , strokeWidth ".4"
            , d "m191.07 598.08 13.75-3.929 15 6.25 1.964 24.643s-3.75 5-12.679 5.358-13.393-7.858-13.393-7.858l-4.642-24.464z"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#7e5831"
            , fillRule "evenodd"
            , stroke "#000"
            , strokeWidth ".1"
            , d "m202.22 611.14-2.273-5.556s-.694-4.987 4.357-5.05 6.376 4.735 6.376 4.735l1.01 6.44-1.83 1.01-.506.946v3.094s-.568 1.01-2.21.884-2.272-1.073-2.272-1.073l-.063-3.915-.632-.19-1.957-1.325z"
            , SA.filter "url(#aj)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#7e5831"
            , fillRule "evenodd"
            , stroke "#000"
            , strokeWidth ".1"
            , d "M202.41 615.18s2.588-.631 4.546-.631 5.682 1.01 5.682 1.01 1.136-.568 1.894-.316 2.778.632 2.715 1.452-.884 1.831-1.39 1.642l-.82-.316s1.389 2.4 1.2 2.904-.127 1.894-1.326 1.137-2.4-.947-2.463-2.21.632-1.389-.126-2.273-1.578-1.389-1.578-1.389-3.094-.505-3.915-.568-4.04.947-4.04.947 1.2 3.03.82 3.41-1.388 1.388-2.146 1.073-1.326-.064-1.389-1.01.19-3.031-.19-3.031-2.272-.947-1.957-1.768 1.768-.947 2.273-.947 2.336 1.01 2.21.884zm-2.97-9.79s-1.768-.82-2.083-.316.63 2.21.694 2.905.19 1.073.19 1.073-1.705-.568-1.705.063.505 4.167 1.578 4.167 2.589 1.01 2.968.126.378-1.957.378-1.957l.38-.442m9.54-4.859s1.452-1.263 2.083-.884 1.01 4.42 1.01 4.42 1.39.063 1.705 1.2.82 2.84-.757 2.903-1.705.569-2.526-.442-1.263-2.02-1.263-2.02l-.63-5.05.378-.127z"
            , SA.filter "url(#aj)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#32312e"
            , fillRule "evenodd"
            , d "M203.29 604.51s1.263.19 1.389 1.01.253 2.589.253 2.589-.253 1.01-.947 1.073-1.326-.884-1.326-.884l-.568-2.715s.252-.631.505-.82.63-.19.694-.253z"
            , SA.filter "url(#ak)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#32312e"
            , fillRule "evenodd"
            , d "M207.78 604.7s.758-.063 1.136.694.38 2.905.38 2.905-.253.82-.822.82-1.389-.63-1.389-.63l-.252-2.905s-.126-.884.316-.884h.63z"
            , SA.filter "url(#al)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#32312e"
            , fillRule "evenodd"
            , d "M206.262 609.813s-.82.505-.568.82.505.695.884.569.568-.127.568-.442-.821-1.074-.884-.947z"
            , SA.filter "url(#am)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#5a2207"
            , fillRule "evenodd"
            , d "m76.163 76.564.09 3.279s-.36.779-1.035.697-1.754-1.312-1.754-1.312 0 .86-.584.902-1.08-.37-1.08-.78 0-.778.27-1.024 1.124-.656 1.44-.492 1.528 1.394 1.528 1.394l.855-1.066-.18-.246-.54.41-.27-.123s-.404-1.147 0-1.352 1.305-.287 1.26-.287zm-4.183 4.51c-.18.287-.18 1.435-.675 1.517s-1.53-.574-1.754-.246.315.697-.585.738-1.034-.205-1.034-.82-.045-.738.495-.902 1.079-.246 1.484-.082.81.41.81.41l.809-.984h.405l.045.369zm-4.901 1.269-3.283-.246-1.35.041-.494.78-.54-.657-2.203.615-2.16.82s-.764.41-.539 1.312 0 .983.9.655 1.394-1.393 1.574-.532-.27 1.68.584 1.188.81-1.762 1.17-1.27.45 1.27.944 1.024.405-1.147.9-1.065 1.214.942 1.708.655-.045-1.27.54-1.188 1.979-.082 1.979-.082.584-.451.584-.86v-.78l-.314-.41zm-15.516 3.28s.36.37 1.124-.04 1.304-.902 1.304-.902-.63.779-.225.901 1.394.123 1.844-.614.36-1.23-.045-1.435-1.08-.328-1.349-.123-.72.984-1.124 1.148-.9.246-.9.246l-.63.82z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#f0be04"
            , d "m325.18 605.04 2.857 1.429"
            , SA.filter "url(#an)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#f0be04"
            , d "m229.29 606.47-1.964-1.071"
            , SA.filter "url(#ao)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#f0be04"
            , d "m227.14 614.51 1.607 1.786"
            , SA.filter "url(#ap)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#f0be04"
            , d "m237.86 609.68 2.143 1.25"
            , SA.filter "url(#aq)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#f0be04"
            , d "m244.46 625.58 1.964 1.25"
            , SA.filter "url(#ar)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#f0be04"
            , d "m254.11 624.51 2.679 1.25"
            , SA.filter "url(#as)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#f0be04"
            , d "m265.54 633.26 3.036.714"
            , SA.filter "url(#at)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#f0be04"
            , d "m273.04 636.65 4.464 2.143"
            , SA.filter "url(#au)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#f0be04"
            , d "M291.25 639.51c-.714 0-5.714.179-5.714.179"
            , SA.filter "url(#av)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#f0be04"
            , d "M266.07 628.61s3.75.714 4.821 1.25 5.357 4.286 5.357 4.286"
            , SA.filter "url(#aw)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#f0be04"
            , d "m285.18 634.51 6.25-1.964 6.786.893"
            , SA.filter "url(#ax)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#f0be04"
            , d "m283.39 628.43 7.679 2.321"
            , SA.filter "url(#ay)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#f0be04"
            , d "m279.11 628.08-6.607.714"
            , SA.filter "url(#az)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#f0be04"
            , d "m310 633.61 1.607-.179 4.286 4.108"
            , SA.filter "url(#aA)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#f0be04"
            , d "m378.93 640.4 2.392-1.741"
            , SA.filter "url(#aB)"
            , transform "matrix(-.01014 .22935 .25164 .00924 -104.637 -8.287)"
            ]
            []
        , Svg.path
            [ fill "#8d5928"
            , fillRule "evenodd"
            , d "m72.249 75.294 2.473-8.566h-2.338l-2.204 8.075 2.069.492z"
            ]
            []
        , Svg.path
            [ fill "#12130d"
            , fillRule "evenodd"
            , d "M21.815 85.855c-.063-.29-4.579-3.014-4.579-3.014s-.318 1.333-.827 1.45-1.526.289-1.526.289-.318.927-.763.985-.89.87-.89.87l4.07.116s.763.174 1.272.174 1.208-.522 1.208-.522l2.035-.348z"
            ]
            []
        , Svg.path
            [ fill "#773723"
            , fillRule "evenodd"
            , d "M17.25 82.924s-1.348-1.067-2.112-1.357-1.844-.348-2.098-.348-.954.116-.954.116l-.636.812.572.637-.7.986.128.347-1.272.87.063.638 2.985.825 3.645-2.278"
            ]
            []
        , Svg.path
            [ fill "#a07941"
            , fillRule "evenodd"
            , stroke "#c59000"
            , d "M478.75 627.68s-2.02-1.01-5.05-1.01-8.335 3.03-8.335 3.03"
            , SA.filter "url(#aC)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#dbdb00"
            , fillRule "evenodd"
            , d "m8.206 85.277 1.908.116-.127-.522 1.462-.811-.318-.232 1.082-1.044-.764-.695.573-.754-1.209-.348v-.232h-.19l.254-.637-.509-.522.255-.58h-.827l-.509.174-.954.116-.509.232-1.653 3.188.572.116.7-1.043s.7-.058 1.144.116.7.927.7.927l-1.208.638.19.754v.463l.191.116-.254.464z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "m493.65 636.52-12.374-4.04"
            , SA.filter "url(#aD)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "M496.68 625.15c-1.01 0-12.627-5.05-12.627-5.05"
            , SA.filter "url(#aE)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "m489.86 629.45-7.829-2.273"
            , SA.filter "url(#aF)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "m492.64 626.67-6.313-3.535"
            , SA.filter "url(#aG)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "m493.9 638.79-4.293.758"
            , SA.filter "url(#aH)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#602d24"
            , fillRule "evenodd"
            , d "m8.206 85.102.063-1.68.89-.464s.192-.754-.126-.928-1.527-.29-1.527-.29l-.636 1.044-.7-.058-2.289-.232.763.927s-1.081 1.102-.254 1.565 1.59-.463 1.59-.463.445.232 1.017.463 1.272.174 1.209.116z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "M504.76 633.49c-1.263 1.01-.253 1.01 0 0z"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#a07941"
            , fillRule "evenodd"
            , stroke "#c59000"
            , d "M498.2 628.69s-1.01-1.768-3.03-1.515-2.526 1.01-2.526 1.01"
            , SA.filter "url(#aI)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#6e4525"
            , fillRule "evenodd"
            , d "m16.345 77.567-1.653-1.276-3.498-.405-2.354-1.334-.445.348-2.099-.232-1.208-.58-.445.348-2.671-.405L0 74.379l.445 1.39 6.17 2.32.19.985h3.943l5.915 2.956"
            ]
            []
        , Svg.path
            [ fill "#261714"
            , fillRule "evenodd"
            , d "m15.837 77.799-4.325-1.044-.636-.637-3.435-.174-.954-.116-1.526-.116-1.717-.812-1.781.464.636 1.043 4.325 1.45.445 1.159h3.562l5.787 2.782"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "m496.18 620.36-9.344-3.535"
            , SA.filter "url(#aJ)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "m471.43 618.08 10.102-5.556"
            , SA.filter "url(#aK)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "m470.67 612.78 10.102-4.293"
            , SA.filter "url(#aL)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "m468.4 609.24 10.859-2.525"
            , SA.filter "url(#aM)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "M505.52 605.71c1.01-.505 12.122-5.303 12.122-5.303"
            , SA.filter "url(#aN)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#000"
            , d "m502.74 602.17 10.102-4.04"
            , SA.filter "url(#aO)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#4a4a4a"
            , d "m502.49 598.64 5.05-3.788"
            , SA.filter "url(#aP)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#4a4a4a"
            , d "m486.58 601.16 6.313-4.798"
            , SA.filter "url(#aQ)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#25100b"
            , fillRule "evenodd"
            , d "M2.736 76.871v.812l-1.654.811.509 1.797-.89.986.826 1.217 1.145.29.7-.638 2.735.406 2.098-3.362-1.272-.058-.508-1.16-3.69-1.1z"
            ]
            []
        , Svg.path
            [ fill "#43220f"
            , fillRule "evenodd"
            , d "M3.307 81.74c-.318 0-1.526.174-1.526.174l-.382-.696.89-.812 1.018 1.334z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#8d5905"
            , d "m509.56 617.33-3.536-5.808"
            , SA.filter "url(#aR)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#8d5905"
            , d "M501.48 621.87c0-1.01-3.03-5.05-3.03-5.05"
            , SA.filter "url(#aS)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#874c08"
            , fillRule "evenodd"
            , d "m410.06 593.84-7.324 17.93 20.203-.758 4.041-3.535 13.385 3.03 10.102-3.788 1.768-1.515 3.283-.758v-2.525"
            , SA.filter "url(#aT)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#c08d4b"
            , fillRule "evenodd"
            , d "M468.9 594.34s-30.052.253-40.659-1.263l-10.607-1.515-7.576 2.525s16.668 5.304 18.688 5.556 26.517 2.526 27.779 2.02 12.627-7.07 12.374-7.323z"
            , SA.filter "url(#aU)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#b07f3b"
            , fillRule "evenodd"
            , d "M400.24 610.09s-12.4 2.186-15.178 7.237 1.546 6.449 1.546 6.449l19.772-.327s20.604-5.364 22.876-6.627 22.035-10.094 22.035-10.094l-25.484-.143-3.61 3.148-21.958.357z"
            , SA.filter "url(#aT)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#5f2809"
            , fillRule "evenodd"
            , d "m375.97 575.91 3.03 2.02 6.819 37.881s7.324-3.535 9.091-4.04 11.117-1.725 11.117-1.725l6.179-15.06-11.487-4.933-8.587-5.051-6.06-9.849-10.103.758z"
            , SA.filter "url(#aT)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#864f13"
            , fillRule "evenodd"
            , d "M345.5 614.76c0-1.263 10.267-28.493 10.267-28.493l14.9-5.556 6.313-4.293 3.018 1.872 7.607 37.955s-3.388 2.6-2.882 3.61 2.124 3.535 2.124 3.535-13.42.432-23.269-2.346-18.078-6.283-18.078-6.283z"
            , SA.filter "url(#aT)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#845527"
            , fillRule "evenodd"
            , d "M418.14 591.31s-13.637-5.556-15.405-6.819-6.819-4.545-6.819-4.545-1.515-6.566-4.798-8.334-9.344-.253-9.344-.253l-5.512 5.291s6.714-1.263 8.482-.505 6.06 8.956 6.06 8.956l8.735 5.913 9.522 3.788 10.09-3.997-1.01.505z"
            , SA.filter "url(#aT)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#552f17"
            , fillRule "evenodd"
            , d "m18.297 76.134-.217.72-3.514-1.548v-.754l3.731 1.582z"
            ]
            []
        , Svg.path
            [ fill "#c08d4b"
            , fillRule "evenodd"
            , d "m18.12 76.782-3.554-1.418-.128.29 2.282 1.695 1.4-.567z"
            ]
            []
        , Svg.path
            [ fill "#552f17"
            , fillRule "evenodd"
            , d "m16.781 77.383-.4.33-1.879-1.421.318-.406 1.961 1.497z"
            ]
            []
        , Svg.path
            [ fill "#60270d"
            , fillRule "evenodd"
            , d "m45.322 78.99-2.144-6.07s-2.727-1.091-3.426-1.381-1.717-1.101-1.717-1.101l2.02-.512.345.399s1.122.63 2.521.63 2.206-.05 2.333-.283.667-.292.667-.292.318-.116.572.463.255.928.255.928l2.671.985-.045 2.97s-1.185.457-1.44.805-.826 1.452-1.144 1.568-1.73 1.376-1.468.89z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#656565"
            , d "m354 587.27-20.708-.253"
            , SA.filter "url(#aV)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#411f07"
            , fillRule "evenodd"
            , d "m99.367 59.8-.854.124v.286l-6.206.205s-.945-.655-1.8-.368-1.573 1.516-1.573 1.516-.54.779-1.304 1.189-2.249.942-2.249.942l-1.17-.655 2.564-1.312 1.754-1.844.81-.451 8.634-.738 1.394.697v.41z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#5b5b5b"
            , d "m137.86 529.51 24.107.179s5.893 0 7.679 1.428 5.714 6.607 5.714 6.607"
            , SA.filter "url(#aW)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#241312"
            , fillRule "evenodd"
            , d "M98.738 58.898v.328s-.675.123-.945.123-1.214-.246-1.214-.246l.09-.45s.585.123.944.164 1.035.04 1.125.081z"
            ]
            []
        , Svg.path
            [ fill "#241312"
            , fillRule "evenodd"
            , d "M98.604 58.283v.41l-1.08.082-.404-.082-.135-.082.045-.45 1.574.122zm-.181-.123s.36-1.066.36-1.353-.135-1.599-.135-1.599l.404-.164.045-.328-1.709-.04v.245l.225.123s-.18.82-.225 1.189-.045 1.844-.045 1.844l1.08.082zm-3.463.738v.328s-.675.123-.944.123-1.215-.246-1.215-.246l.09-.45s.585.123.945.164 1.034.04 1.124.081z"
            ]
            []
        , Svg.path
            [ fill "#241312"
            , fillRule "evenodd"
            , d "M94.826 58.283v.41l-1.079.082-.405-.082-.134-.082.044-.45 1.575.122zm-.181-.123s.36-1.066.36-1.353-.135-1.599-.135-1.599l.405-.164.045-.328-1.71-.04v.245l.226.123s-.18.82-.225 1.189-.045 1.844-.045 1.844l1.08.082zm-3.057.821v.328s-.675.123-.945.123-1.214-.246-1.214-.246l.09-.45s.585.122.945.163 1.034.041 1.124.082z"
            ]
            []
        , Svg.path
            [ fill "#241312"
            , fillRule "evenodd"
            , d "M91.452 58.366v.41l-1.08.082-.404-.082-.135-.082.045-.451 1.574.123zm-.179-.124s.36-1.066.36-1.353-.135-1.598-.135-1.598l.405-.164.045-.328-1.71-.041v.246l.226.123s-.18.82-.225 1.189-.045 1.844-.045 1.844l1.079.082zm-4.093 3.895v.328s-.674.123-.944.123-1.214-.246-1.214-.246l.09-.45s.585.122.944.163 1.035.041 1.125.082z"
            ]
            []
        , Svg.path
            [ fill "#241312"
            , fillRule "evenodd"
            , d "M87.045 61.522v.41l-1.08.082-.404-.082-.135-.082.045-.45 1.574.122zm-.179-.124s.36-1.066.36-1.352-.135-2.009-.135-2.009l.404-.164.045-.328-1.709-.04v.245l.225.123s-.18 1.23-.225 1.599-.045 1.844-.045 1.844l1.08.082z"
            ]
            []
        , Svg.path
            [ fill "#5a3219"
            , fillRule "evenodd"
            , d "m99.503 54.799-9.219.082s-.585 1.476-1.214 1.885-1.574.574-1.574.574-3.373.615-3.463.37-.99-.862.18-1.108 1.799-.204 1.799-.204 1.304-.123 1.619-.37.764-1.639 1.439-1.803 4.407-.328 4.407-.328l5.936.123s.63.246.585.492-.54.328-.495.287z"
            ]
            []
        , Svg.path
            [ fill "#241312"
            , d "M97.478 53.59a.8.967 90 1 0 1.934 0 .8.967 90 1 0-1.934 0z"
            ]
            []
        , Svg.path
            [ fill "#e8cc4c"
            , fillRule "evenodd"
            , d "m135.71 500.58 1.786 1.964h2.142l-1.25-1.607-2.678-.357z"
            , SA.filter "url(#aX)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#241312"
            , d "M90.08 53.692a.8.967 90 1 0 1.934 0 .8.967 90 1 0-1.934 0z"
            ]
            []
        , Svg.path
            [ fill "#e8cc4c"
            , fillRule "evenodd"
            , d "m165.09 501.02 1.786 1.964h2.143l-1.25-1.607-2.679-.357z"
            , SA.filter "url(#aX)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#241312"
            , d "M85.808 55.987a.8.967 90 1 0 1.934 0 .8.967 90 1 0-1.934 0z"
            ]
            []
        , Svg.path
            [ fill "#e8cc4c"
            , fillRule "evenodd"
            , d "m182.05 511.02 1.786 1.964h2.143l-1.25-1.607-2.679-.357z"
            , SA.filter "url(#aX)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#211109"
            , fillRule "evenodd"
            , d "m95.59 54.02-.36-.45.81-1.845-.405-.737.27-.328-.675-.533s.27-.779-.315-.82-.675.86-.675.86l-.45.247v.328l-.629.697.495 2.09-.27.45 2.204.042z"
            ]
            []
        , Svg.path
            [ fill "#f2f200"
            , fillRule "evenodd"
            , stroke "#f9d300"
            , d "m150.89 490.22 2.679-.357"
            , SA.filter "url(#aY)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#f2f200"
            , fillRule "evenodd"
            , stroke "#f9d300"
            , d "m152.32 493.08 1.607-1.25 1.072 1.964-1.43.715-1.25-1.429z"
            , SA.filter "url(#aZ)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#f2f200"
            , fillRule "evenodd"
            , stroke "#f9d300"
            , d "m152.68 504.68 2.143-1.964.714 1.964h-2.857z"
            , SA.filter "url(#ba)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#85521a"
            , fillRule "evenodd"
            , d "m78.95 62.915-.63 2.173 3.824-.697-3.194-1.476z"
            ]
            []
        , Svg.path
            [ fill "#3c240c"
            , fillRule "evenodd"
            , d "M78.5 64.924c.045-.205 1.169-5.452 1.169-5.452l-.495-.86s.765-2.993-.135-4.181-1.574-1.148-1.574-1.148l-3.148.082s-2.113.369-2.293 2.337-.405 2.336-.405 2.336l-1.304 4.099-.225 1.967 4.992 1.558 3.417-.738z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#727272"
            , d "m213.39 526.11 9.286-1.25"
            , SA.filter "url(#bb)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#8d8d8c"
            , fillRule "evenodd"
            , stroke "#8b8b8b"
            , d "M214.64 507.01c1.607 0 11.071.357 11.071.357l3.036-3.928-9.822-.358-4.285 3.929z"
            , SA.filter "url(#bc)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#533526"
            , fillRule "evenodd"
            , d "M75.037 57.627s-.36.82-.9.697-1.124-.738-1.259-1.394.09-1.803.675-2.131 1.08-.41 1.349-.246.45.983.54 1.27-.495 1.845-.405 1.804z"
            ]
            []
        , Svg.path
            [ fill "#0f0a09"
            , fillRule "evenodd"
            , d "M74.813 57.464s-.675-.246-.585-.902.225-1.107.675-1.066.584.533.584.697-.27.943-.27.943l-.404.328z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#575757"
            , d "M228.57 555.93c-.536-.893-5.714-27.857-5.714-27.857l1.25-8.75s.535 5.179 1.964 6.429l1.429 1.25"
            , SA.filter "url(#bd)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#5d5d5d"
            , d "M224.46 518.79s-.536-4.464 0-7.321 1.607-4.643 1.607-4.643"
            , SA.filter "url(#be)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#2f1a07"
            , fillRule "evenodd"
            , d "M79.265 60.866s1.304-1.353 1.35-1.558.764-2.008.764-2.541.045-2.09-.135-2.46-.585-1.68-.99-1.926-.944-.86-1.753-.86-1.89.163-1.89.163 1.89-.492 2.384-.492 1.844.451 2.249.738.944 1.107 1.214 1.476.585 1.434.585 1.762.045 1.68.045 1.968-.63 2.008-.81 2.418-.99 1.517-1.259 1.845-.45.328-.45.328l-1.304-.451v-.41z"
            ]
            []
        , Svg.path
            [ fill "#191006"
            , fillRule "evenodd"
            , d "m82.277 57.996 1.214.615s.225.656-.18.984-.899-.082-.899-.082l-.99-.369s-.269-.615-.134-.82.944-.41.99-.328zm1.126-4.836s.405.287.405.45.18.657-.045.862-1.214.615-1.214.615-.63-.246-.72-.615.09-.984.09-.984l.72-.369.764.041zm-2.654-1.23.54-1.435-1.53-.41-.45 1.23 1.44.615zm0 6.599-1.08-.451-.315.287.045-1.435v-1.188l-.045-1.148-.854-.656s.495-.656.54-1.025.09-1.065.09-1.065 1.079.369 1.214.574 0 2.336 0 2.336l.674-.41.405 1.68-1.574.616.18.368 1.214.37-.494 1.147z"
            ]
            []
        , Svg.path
            [ fill "#422d0e"
            , fillRule "evenodd"
            , d "M79.535 52.054s-.45-.37-1.44 0-2.203 1.27-2.203 1.27l-.99-.04s.765-.984 1.395-1.353 1.349-.451 1.349-.451 1.08-.082 1.26 0 .809.615.629.574z"
            ]
            []
        , Svg.path
            [ fill "#2b1711"
            , fillRule "evenodd"
            , d "m76.701 52.873.18.369 1.08.082v-1.23l-1.26.78z"
            ]
            []
        , Svg.path
            [ fill "#f4de07"
            , fillRule "evenodd"
            , stroke "#f5e122"
            , d "M219.82 494.33z"
            , SA.filter "url(#bf)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#110805"
            , fillRule "evenodd"
            , d "m77.286 51.439-.045-.984-1.26.328.315 1.024"
            ]
            []
        , Svg.path
            [ fill "#7d4910"
            , fillRule "evenodd"
            , d "M68.157 77.383c-.09-.246.045-1.066.045-1.066l.854-.287.27-1.885.584-.41.36-2.05.54-.286.495-2.05.36-.205-1.44 5.82-2.069 2.42z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#fcde04"
            , d "m248.04 592.9 2.321-.714"
            , SA.filter "url(#bg)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#fcde04"
            , d "m253.75 602.72 1.607-.536"
            , SA.filter "url(#bh)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#fcde04"
            , d "m245.54 582.18 1.607-.357"
            , SA.filter "url(#bi)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#844f06"
            , fillRule "evenodd"
            , d "M62.986 77.466c0-.205.675-10.821.675-10.821l.764-.205.36-2.132-.9-.328-.36 2.419-.584.164-.045 1.803-.63.533-.314 2.173-.315.04-.45 2.173-.584.123-.315 1.967-.585.287-3.013-1.311s-.54 2.131-.314 2.131 3.058 1.23 3.058 1.23l3.552-.246z"
            ]
            []
        , Svg.path
            [ fill "#885425"
            , fillRule "evenodd"
            , d "m60.601 73.366-3.148-1.23-.09 1.886 2.969 1.23.27-1.886zm1.035-2.334-2.878-1.066-.27 1.763 2.833 1.27.315-1.967zm.721-2.215-2.834-1.107-.36 1.722 2.969 1.23.225-1.845z"
            ]
            []
        , Svg.path
            [ fill "#84501e"
            , fillRule "evenodd"
            , d "m63.074 66.441-3.103-.86-.045 1.639 2.969 1.148.18-1.927z"
            ]
            []
        , Svg.path
            [ fill "#8b5a1a"
            , fillRule "evenodd"
            , d "m63.976 64.022-3.013-.902-.36 1.926 3.103 1.066.27-2.09z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#bda105"
            , strokeWidth "3.1"
            , d "M276.25 558.61c.714-.179 10.714-3.75 10.714-3.75"
            , SA.filter "url(#bj)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#bda105"
            , strokeWidth "3.1"
            , d "m279.46 568.97 9.464-4.464"
            , SA.filter "url(#bk)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#bda105"
            , strokeWidth "3.1"
            , d "m281.79 578.97 10.893-5.179"
            , SA.filter "url(#bl)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#bda105"
            , strokeWidth "3.1"
            , d "m285.54 589.15 11.071-5.893"
            , SA.filter "url(#bm)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#bda105"
            , strokeWidth "3.1"
            , d "m289.82 598.97 10.357-5.536"
            , SA.filter "url(#bn)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#581b0d"
            , fillRule "evenodd"
            , d "m72.385 66.687-7.555-2.542-.945 2.378 6.971 2.336-.045 2.583.675-2.09.224-.329.675-2.336z"
            ]
            []
        , Svg.path
            [ fill "#2e1a14"
            , fillRule "evenodd"
            , d "m71.035 68.858-7.33-2.295-.81 10.944 4.093 1.311 1.169-1.352-.09-1.066 1.034-.492.225-1.68.585-.574.315-1.927.63-.368.18-2.5z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#666"
            , d "M246.61 570.04c.714 0 25.893-9.464 25.893-9.464"
            , SA.filter "url(#bo)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#b97e30"
            , fillRule "evenodd"
            , d "m66.988 78.818-4.092-1.394-3.508.164-2.969-1.148-3.642.123.854 1.968-.045 2.213 1.71.205 3.957-.369 7.375-1.434.36-.328z"
            ]
            []
        , Svg.path
            [ fill "#582607"
            , fillRule "evenodd"
            , d "m64.784 79.27-3.103-1.23-7.645.615-.135 1.968.765.122 4.542-.163 5.577-1.312z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#585858"
            , d "m282.14 610.93 29.643 2.857"
            , SA.filter "url(#bp)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#171309"
            , fillRule "evenodd"
            , d "m45.446 68.736 4.047.738.63-.82.044-2.5 1.62.656v2.172s.719.287.674 1.189-.854 1.312-.854 1.312v1.721s1.529 0 1.439 2.009-3.868.573-3.868.573-1.034-.696-.495-1.721 1.664-.984 1.664-.984l.045-1.598-.854-.738-3.688-.574-.09-.656-.495-.04.18-.739z"
            ]
            []
        , Svg.path
            [ fill "#b97e30"
            , d "M50.573 70.252a.369.427 90 1 0 .854 0 .369.427 90 1 0-.854 0zm-.63 4.528a.594.944 90 1 0 1.889 0 .594.944 90 1 0-1.889 0z"
            ]
            []
        , Svg.path
            [ fill "#2a130b"
            , fillRule "evenodd"
            , d "m40.59 69.556.36-6.23-.9-.082s-.45.328-.944.328-1.034-.615-1.034-.615l-2.654-.451s-.405.41-1.124.328-.9-.492-.9-.492l-1.978-.328s-.72.328-1.214.287-.765-.615-.765-.615l-1.35-.123s-.449.287-.764.246-.944-.287-.944-.287l11.513-.902s2.923.123 3.687.41 1.754.533 2.024 1.066 1.35 1.27 1.844 1.516 1.35.738 1.35.738l-.136.287-1.26-.205-.179 5.247s-.315.533-2.159.492-2.608-.574-2.473-.615z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#2a2a2a"
            , d "m361.61 572.01-.893-22.679"
            , SA.filter "url(#bq)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#2a2a2a"
            , d "M356.25 571.47c-.179-1.071-.179-21.429-.179-21.429"
            , SA.filter "url(#br)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#2a2a2a"
            , d "M351.61 570.76c.179-.893-.357-18.75-.357-18.75"
            , SA.filter "url(#bs)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#2a2a2a"
            , d "M356.43 542.36c.714 0 20.179-1.786 20.179-1.786"
            , SA.filter "url(#bt)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#2a2a2a"
            , d "m382.32 539.15 12.321-1.25"
            , SA.filter "url(#bu)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#2a2a2a"
            , d "m363.93 537.72 19.821-.893"
            , SA.filter "url(#bv)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#2a1206"
            , fillRule "evenodd"
            , d "M45.221 69.515h.585l.045 1.024s-.9.861-2.788.738-3.193-.86-3.193-.86v-1.025l.494-.205.27.45s1.17.451 2.519.492 2.158-.655 2.068-.614z"
            ]
            []
        , Svg.path
            [ fill "#433a40"
            , fillRule "evenodd"
            , d "M49.135 24.55s-4.857 5.985-6.656 5.657-4.497-3.771-4.497-3.771l-6.926 6.722.18-5.082 5.846-4.755 6.027-.164 1.889.902 2.338-.41 1.799.902z"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m302.14 393.08-3.214 6.786"
            , SA.filter "url(#bw)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m309.29 391.65 24.286 9.286"
            , SA.filter "url(#bx)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m307.5 395.58 15 13.214"
            , SA.filter "url(#by)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m305.36 397.36-1.071 17.5"
            , SA.filter "url(#bz)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#26581d"
            , fillRule "evenodd"
            , stroke "#000"
            , d "M320.36 558.08s1.429-59.643.357-66.071-7.143-37.857-7.143-37.857l5.357 1.071s6.429 27.857 7.143 33.214-.357 67.143-.357 67.143l-5.357 2.5zm23.57-12.15s3.214-17.5 3.214-28.929-2.5-28.929-2.5-28.929l-12.143-38.929 4.643 2.143 9.286 32.5s5 27.143 5.357 32.857-5.357 28.214-5.357 28.214l-2.5 1.071zm65.36-12.14s9.286-9.286 9.286-30-7.857-43.929-7.857-43.929l-9.643-15 5.714-.357s15 24.643 16.071 47.857-7.857 40.357-7.857 40.357l-5.714 1.071zm-21.08-.71 2.143-8.571 4.643-1.072-1.429 9.286-5.357.357zm-19.64.35 2.5-12.857-2.143.714-4.286 12.143h3.929zm8.22-91.42 1.786 7.857 5-.714-2.5-6.786-4.286-.357zm-17.5 3.92 1.786 7.5-5 .357-.357-5.714 3.571-2.143zm-45 1.43s2.857-15 .714-23.571-11.786-31.429-11.786-31.429l5.715-2.857s10.357 28.929 10.357 32.143-1.072 24.643-1.072 24.643l-3.928 1.071zm16.78-4.28s8.929-10.714 8.571-20.714-15.357-45.357-15.357-45.357l7.858.714 9.642 35s3.215 13.214 1.786 16.43-8.214 14.285-8.214 14.285l-4.286-.357zm20.36-6.79s5.357-16.071 5.357-21.786-10.714-37.143-10.714-37.143l6.786-1.071 7.857 31.786s1.786 10.357.714 12.143-3.214 16.07-3.214 16.07h-6.786zm23.93-2.14s5.714-8.214 3.571-18.214-12.143-41.071-12.143-41.071l5-1.429 10.714 35.714s1.786 10.714 1.786 13.571-5.357 12.5-5.357 12.5l-3.571-1.071zm21.78 0s5.357-6.786 4.643-16.786-12.857-42.5-12.857-42.5l4.286-.357 11.786 37.5s1.071 8.214.714 12.143-3.929 11.429-3.929 11.429l-4.643-1.429z"
            , opacity ".624"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m379.29 374.15-1.786 9.286"
            , SA.filter "url(#bA)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m382.14 377.36.714 10.714"
            , SA.filter "url(#bB)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "M387.14 382.36v10.714"
            , SA.filter "url(#bC)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m360.71 375.22 3.929 11.429"
            , SA.filter "url(#bD)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "M356.79 373.43c.357 1.429 1.786 13.571 1.786 13.571"
            , SA.filter "url(#bE)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m311.43 387.01 10.714 2.5"
            , SA.filter "url(#bF)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m401.43 385.93-5 6.429"
            , SA.filter "url(#bG)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m398.93 382.36-9.286 3.214"
            , SA.filter "url(#bH)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m405.71 387.36-5 11.429"
            , SA.filter "url(#bI)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m300.71 462.01-6.071 13.571"
            , SA.filter "url(#bJ)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m307.86 462.72 15.357 16.071"
            , SA.filter "url(#bK)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m308.57 458.43 25 11.786"
            , SA.filter "url(#bL)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m303.93 452.01 7.857-22.5"
            , SA.filter "url(#bM)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m298.93 456.29-3.214-5.714"
            , SA.filter "url(#bN)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m308.21 450.22 16.429-27.5"
            , SA.filter "url(#bO)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m420.71 450.22-2.143 15"
            , SA.filter "url(#bP)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m416.43 446.65-5.714 12.143"
            , SA.filter "url(#bQ)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m414.64 444.51-8.571 5"
            , SA.filter "url(#bR)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "M421.07 437.72c-.714-1.429-7.5-20.714-7.5-20.714"
            , SA.filter "url(#bS)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m416.43 435.93-9.286-16.071"
            , SA.filter "url(#bT)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m413.93 436.29-8.214-6.071"
            , SA.filter "url(#bU)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m423.21 437.72 2.5-9.643"
            , SA.filter "url(#bV)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m428.21 532.72-15.714-1.071"
            , SA.filter "url(#bW)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "M431.07 527.72c-1.071-1.429-12.5-11.429-12.5-11.429"
            , SA.filter "url(#bX)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m433.57 527.01-3.214-15.357"
            , SA.filter "url(#bY)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m427.5 529.51-10.714-3.929"
            , SA.filter "url(#bZ)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m302.14 556.29 21.429-28.214M306.43 559.15c1.071-1.429 29.286-22.143 29.286-22.143"
            , SA.filter "url(#ca)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m306.07 564.15 12.5-5.357"
            , SA.filter "url(#cb)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "none"
            , stroke "#393939"
            , d "m296.79 558.08-5.357-8.214"
            , SA.filter "url(#cc)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#0c0707"
            , fillRule "evenodd"
            , stroke "#000"
            , d "M343.04 511.11c-.357-.714-.893-3.75-.893-3.75s7.143-.536 6.429-.536-3.75-3.571-3.75-3.571l6.964-1.072s-4.464-2.857-3.393-3.035 5.536 0 5.536 0l1.964-4.643s-6.964-9.643-6.786-12.68.179-3.213.179-3.213l-5-3.215s4.464-.893 5.179-.893 1.785-1.785 1.785-1.785l4.822-.357s.178-2.679 1.964-4.108 2.857-1.25 1.607-1.964-3.75-.893-3.75-.893-.357-.893-1.25.179-.893 2.143-.893 2.143.893 2.678-1.071.536-4.107-5.715-4.822-6.072-3.035-1.25-2.5-1.964 1.25-1.25 1.25-1.25l3.036 2.678-1.607-5.535 3.214 1.607 5.536-4.107 2.857 1.607s2.679 1.25 2.679 0-1.429-3.571.357-2.143 2.321 2.321 2.321 2.321 3.393-1.428 4.465-3.035 1.25-3.75 1.25-3.75l1.964 3.928v-3.035s12.679 8.571 12.679 7.5-1.607-6.786-1.607-6.786l9.643 2.857s2.321-1.607 2.857-.893 3.928 6.964 3.928 6.964l1.786-1.25 4.821 3.75s-2.321 1.786-1.428 1.786 4.821 1.607 4.821 1.607-1.964 2.143-1.25 2.143 5.536 3.036 5.536 3.036l-1.786 3.393 4.286 2.143-5.536 2.5 2.679 3.214-4.643-.179 1.964 10.18-1.607.714s.714 1.25-.178 3.035-2.68 2.5-2.68 3.929.537 2.143.18 4.107-1.965 3.393-1.786 4.107 1.607.714.714 1.429-3.75 2.5-2.679 2.678 3.036 2.143 3.036 2.143 2.857-1.607 2.143-.536-2.321 8.572-2.321 8.572-2.143-5.357-3.929-3.75-3.393 4.464-7.321 5.714-4.465 4.107-7.5 1.071 6.428-7.678-5.357-5.357-5.715 3.036-7.68 1.786-3.75-2.679-3.75-2.679-5.178 8.393-6.07 6.965-1.072-2.143-1.072-2.143l.357 3.75-8.75 8.928 1.607-7.5s-4.642.893-4.642 0-3.929-5-.893-5 8.571-4.642 5.714-6.071-4.643-.179-5.536.357-3.392 1.607-3.392 1.607l1.785-8.214h-6.785z"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#b59b8b"
            , fillRule "evenodd"
            , stroke "#000"
            , d "M393.21 481.47s3.929-18.75-20.357-16.786-10.893 18.036-10.893 18.036l3.75 4.464s.357 4.465 1.429 4.643 5.357-.893 5.357-.893l1.428 2.143 1.25-2.143 2.143 2.857 1.25-3.214 1.607-.178 1.072 2.678 2.321-3.571 1.071.535s.715 3.572 1.072 2.322.714-3.214.714-3.214l6.072-.715s1.428.179 1.964-2.678-1.072-4.107-1.25-4.286zm-18.92 17.68s-1.429 2.857 1.607 2.857 8.929.179 10.18-1.607 2.5-4.821.892-3.929-.893 3.393-2.857 2.143-2.857-4.464-3.393-3.393.714 2.322-.714 2.143-.715-2.321-1.786-.893-.893 2.679-1.964 2.5-1.786.179-1.965.179z"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#b59b8b"
            , fillRule "evenodd"
            , stroke "#000"
            , d "M356.79 478.97s-1.607 1.071-1.429 1.786 4.822 8.928 4.822 8.928-3.215-.357-3.036.893-.536 4.822 2.5 5.893 6.429 2.679 6.25.714-1.964-8.571-2.321-9.643-4.822-8.392-4.822-8.392l-1.964-.179zm39.46-6.07-.536 7.5 1.786 5.893s.893 5 4.286 4.107 6.071-4.643 5.892-6.429 1.43-3.571-.892-2.857-2.322 2.5-3.572 0 1.429-7.678-1.607-8.393-5.536.179-5.357.179zm-23.57 22.14s-1.071 2.5-2.321 3.75-5.358-.536-6.965 1.429-4.285 3.392-2.678 4.642 3.393.536 3.393.536-2.858 5.714-.893 7.679 3.571.893 4.107-.179 1.428-2.678 1.428-5.178-1.25-3.036.536-4.822 3.393-2.857 3.572-4.464.178-3.214-.179-3.393zm15.18-.71 10.357.893s4.286-4.643 6.607-3.214 3.393 2.321 2.143 4.285-3.036.715-3.036.715 3.929 7.142 1.607 8.214-6.428 2.143-8.214.893-1.428-.715-.357-3.036 3.214-4.107.893-4.464-6.964-2.679-7.857-3.036-1.786-1.25-2.143-1.25z"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#0c0707"
            , fillRule "evenodd"
            , stroke "#000"
            , d "M381.79 472.18s7.5.714 7.857 5.536-3.75 7.5-3.75 7.5-5-.357-7.5-5.179 3.393-7.678 3.393-7.857zM365 474.51s6.071.179 6.786 4.464-3.036 6.607-3.036 6.607-3.571.358-5.714-5.357S365 474.69 365 474.51zm11.25 11.07c1.25 0 3.929.536 3.929 1.607s-3.572 1.786-3.572 1.786-2.857.178-3.214-1.25 3.75-2.322 3.75-2.322l-.893.179z"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , use
            [ xlinkHref "#cd"
            , strokeLinejoin "round"
            , strokeWidth "3.1"
            , transform "matrix(-.25184 0 0 .22954 148.252 -62.315)"
            ]
            []
        , use
            [ xlinkHref "#cd"
            , strokeLinejoin "round"
            , strokeWidth "3.1"
            , transform "matrix(-.25184 0 0 .22954 148.926 -46.821)"
            ]
            []
        , use
            [ xlinkHref "#cd"
            , strokeLinejoin "round"
            , strokeWidth "3.1"
            , transform "matrix(-.25184 0 0 .22954 149.376 -22.966)"
            ]
            []
        , use
            [ xlinkHref "#cd"
            , strokeLinejoin "round"
            , strokeWidth "3.1"
            , transform "matrix(-.25184 0 0 .22954 116.097 -29.852)"
            ]
            []
        , use
            [ xlinkHref "#cd"
            , strokeLinejoin "round"
            , strokeWidth "3.1"
            , transform "matrix(-.25184 0 0 .22954 119.605 -50.1)"
            ]
            []
        , use
            [ xlinkHref "#cd"
            , strokeLinejoin "round"
            , strokeWidth "3.1"
            , transform "matrix(-.25184 0 0 .22954 123.652 -64.2)"
            ]
            []
        , use
            [ xlinkHref "#cd"
            , strokeLinejoin "round"
            , strokeWidth "3.1"
            , transform "matrix(-.25184 0 0 .22954 127.07 -50.674)"
            ]
            []
        , use
            [ xlinkHref "#cd"
            , strokeLinejoin "round"
            , strokeWidth "3.1"
            , transform "matrix(-.25184 0 0 .22954 132.736 -50.428)"
            ]
            []
        , use
            [ xlinkHref "#cd"
            , strokeLinejoin "round"
            , strokeWidth "3.1"
            , transform "matrix(-.25184 0 0 .22954 139.842 -49.936)"
            ]
            []
        , use
            [ xlinkHref "#cd"
            , strokeLinejoin "round"
            , strokeWidth "3.1"
            , transform "matrix(-.25184 0 0 .22954 144.07 -48.543)"
            ]
            []
        , Svg.path
            [ fill "#3d1e0a"
            , fillRule "evenodd"
            , d "M59.148 40.352s.89-.754 1.717-.348 1.336 1.101 1.336 1.101.509-.463 1.145-.347 1.463.637 1.463.637.508 1.102.381 1.797-1.081 2.435-1.908 2.087-1.335-1.275-1.78-1.16-.51.233-1.59 0-1.4-.347-1.4-.347l.636-3.42z"
            ]
            []
        , Svg.path
            [ fill "#4d1e12"
            , fillRule "evenodd"
            , d "M55.904 25.28s-.572-.985 1.018-.927 2.608 1.043 2.608 1.043 1.08-.985 1.908-.637 1.971 1.507 1.844 2.492-1.272 2.609-2.162 2.261-1.527-1.391-1.527-1.391h-.445l-.254-1.971-2.99-.87z"
            ]
            []
        , Svg.path
            [ fill "#825a29"
            , fillRule "evenodd"
            , d "m34.09 23.426-1.081-.522-1.972.116s-1.653-.406-2.035.058-.954 1.391-.89 1.855.318 1.275.636 1.275 2.162-2.898 2.162-2.898l2.608.348.572-.232z"
            ]
            []
        , Svg.path
            [ fill "#532c2b"
            , fillRule "evenodd"
            , d "m47.32 23.483.19-6.84h.509l.127-1.043-.445-.058v-.638l-.89-.58.572-11.883h.572l.127-.637h.318S49.1.123 47.001.007 44.775 1.34 44.775 1.34l.509.116v.521l.509.174-1.081 11.884-1.018.29-.064.81-.572.117v1.043l1.145.116-.573 7.014 1.209.638 2.48-.58z"
            ]
            []
        , Svg.path
            [ fill "#a68b85"
            , fillRule "evenodd"
            , stroke "#747474"
            , d "m340.36 337.01 7.071.505 5.303-.758"
            , SA.filter "url(#ce)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#a68b85"
            , fillRule "evenodd"
            , stroke "#747474"
            , d "m342.88 333.47 3.788.505 3.536-1.263"
            , SA.filter "url(#cf)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#a68b85"
            , fillRule "evenodd"
            , stroke "#747474"
            , d "M339.1 270.59s1.01 4.293 2.02 3.283 3.283-.505 3.283-.505l-.757-2.525-4.546-.253z"
            , SA.filter "url(#cg)"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#583316"
            , fillRule "evenodd"
            , d "M52.66 21.746v.58l-14.436-.464.063-.638 10.621.696.51-.29 3.243.116z"
            ]
            []
        , Svg.path
            [ fill "#8b6d66"
            , fillRule "evenodd"
            , stroke "#656565"
            , d "m330.76 364.28 43.184-2.778 1.515.505-41.669 3.283-3.03-1.01z"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#422e1a"
            , fillRule "evenodd"
            , stroke "#0b0b0b"
            , strokeWidth ".3"
            , d "m338.84 318.57-1.01-18.435 10.102-1.01-1.01-13.637s9.091-3.788 15.152-3.788 9.091 3.03 14.9 2.02 17.678-6.313 19.95-6.313 2.02 17.93 2.778 26.264 3.789 25 3.789 25-6.566-2.02-12.374-1.01-11.112 5.051-16.92 4.294-6.566-4.799-12.374-3.03-11.617 3.03-11.617 3.03l-1.01-14.647-10.355 1.262z"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#2f2019"
            , d "M35.523 8.71a3.911 4.456 0 1 0 7.822 0 3.911 4.456 0 1 0-7.822 0z"
            ]
            []
        , Svg.path
            [ fill "#7f6238"
            , fillRule "evenodd"
            , stroke "#000"
            , strokeWidth ".5"
            , d "m365.49 306.7-.505-7.134s0-5.556 5.619-5.304 5.935 6.693 5.935 6.693l-1.2 4.104.758 1.325s-.064 1.768-.316 1.894-2.4.38-2.4.38l-1.073.378-.189 1.073-4.293-.315v-1.768s-.884.252-1.578-.063-.695-1.263-.758-1.263zm2.14 4.04s-.631 3.978 2.02 4.104 2.526-3.473 2.526-3.473l-4.546-.63zm-.88.32s-1.578.694-1.957.568-1.326-1.326-2.652-1.136-2.778 1.2-2.336 2.21 1.705.441 1.831 1.073-1.705 5.43.316 5.177 3.725-1.579 3.535-2.4-1.01 0-.82-1.451.189-1.705 1.073-2.147 1.326-.694 1.326-.694l-.316-1.2zm6.06 2.27 2.588 1.641.38 2.589-1.39.19s-1.262 3.282 2.526 3.156 1.2-4.609 1.768-4.42 3.914 0 3.03-1.578-2.588-2.21-3.977-2.083-1.074.758-1.768.442-2.841-1.2-2.841-1.2l-.316 1.263zm4.99-12.31s-1.263 3.22-1.073 4.04.505 1.516.442 2.337-.947 2.714-.632 3.03 2.147 2.21 4.23-.063 2.02-3.346 1.515-3.599-1.894-.252-1.894-.252-.189-1.263.064-2.084.631-3.093.631-3.093l-3.283-.316zm-16.23-1.96s.631 5.43.379 5.303-1.579-1.389-1.957-.505-.821 5.114 1.389 5.43 2.84-.505 2.967-1.01.631-2.526.505-2.905-.758-6.187-.758-6.187l-2.525-.126z"
            , transform "matrix(-.25184 0 0 .22954 132.781 -61.987)"
            ]
            []
        , Svg.path
            [ fill "#261815"
            , d "M39.862 7.232a.238.587 0 1 0 .477 0 .238.587 0 1 0-.477 0zm-1.257.138a.286.594 0 1 0 .573 0 .286.594 0 1 0-.573 0zm.733.927a.188.254 90 1 0 .509 0 .188.254 90 1 0-.509 0z"
            ]
            []
        , Svg.path
            [ fill "#171410"
            , fillRule "evenodd"
            , d "m21.793 85.736-4.633-2.787.36-.082 2.968.45 4.228 2.132-2.923.287z"
            ]
            []
        ]
