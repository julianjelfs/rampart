module Graphics.Cannon exposing (cannon)

import Svg exposing (..)
import Svg.Attributes exposing (..)


cannon =
    svg [ viewBox "0 0 24 24" ]
        [ defs []
            [ node "linearGradient"
                [ id "a" ]
                [ node "stop"
                    [ offset "0", stopColor "#fff" ]
                    []
                , text "      "
                , node "stop"
                    [ offset "1", stopColor "#fff", stopOpacity "0" ]
                    []
                , text "    "
                ]
            , node "linearGradient"
                [ gradientUnits "userSpaceOnUse", id "q", x1 "886.39", x2 "1037.9" ]
                [ node "stop"
                    [ offset "0" ]
                    []
                , text "      "
                , node "stop"
                    [ offset "1", stopOpacity "0" ]
                    []
                , text "    "
                ]
            , node "linearGradient"
                [ id "b" ]
                [ node "stop"
                    [ offset "0", stopColor "#2a221c" ]
                    []
                , text "      "
                , node "stop"
                    [ offset "1", stopColor "#b56900", stopOpacity "0" ]
                    []
                , text "    "
                ]
            , node "linearGradient"
                [ gradientUnits "userSpaceOnUse", id "d", x1 "1016.8", x2 "966.4", y1 "392.77", y2 "307.91" ]
                [ node "stop"
                    [ offset "0", stopColor "#501e0f" ]
                    []
                , text "      "
                , node "stop"
                    [ offset "1", stopColor "#c68e39" ]
                    []
                , text "    "
                ]
            , node "linearGradient"
                [ gradientUnits "userSpaceOnUse", id "f", x1 "898.07", x2 "996.18", xlinkHref "#a", y1 "1061", y2 "1151" ]
                []
            , text "    "
            , node "linearGradient"
                [ gradientUnits "userSpaceOnUse", id "g", x1 "964.04", x2 "1114", xlinkHref "#a", y1 "1066.4", y2 "1140.4" ]
                []
            , text "    "
            , node "linearGradient"
                [ gradientUnits "userSpaceOnUse", id "h", x1 "840.07", x2 "906.93", xlinkHref "#a", y1 "1070.3", y2 "1144.3" ]
                []
            , text "    "
            , node "linearGradient"
                [ gradientUnits "userSpaceOnUse", id "i", x1 "1108.6", x2 "1143.4", xlinkHref "#a", y1 "1087.8", y2 "1119.8" ]
                []
            , text "    "
            , node "linearGradient"
                [ gradientUnits "userSpaceOnUse", id "j", x1 "767.01", x2 "840.88", xlinkHref "#a", y1 "1069.9", y2 "1131.9" ]
                []
            , text "    "
            , node "linearGradient"
                [ gradientUnits "userSpaceOnUse", id "k", x1 "910.15", x2 "942.62", xlinkHref "#a", y1 "1007.4", y2 "1061.4" ]
                []
            , text "    "
            , node "linearGradient"
                [ gradientUnits "userSpaceOnUse", id "l", x1 "949.97", x2 "1019", xlinkHref "#a", y1 "1006.2", y2 "1062.2" ]
                []
            , text "    "
            , node "linearGradient"
                [ gradientUnits "userSpaceOnUse", id "m", x1 "838.03", x2 "894.01", xlinkHref "#a", y1 "983.46", y2 "1051.5" ]
                []
            , text "    "
            , node "linearGradient"
                [ gradientUnits "userSpaceOnUse", id "n", x1 "1026.3", x2 "1075", xlinkHref "#a", y1 "1014", y2 "1054" ]
                []
            , text "    "
            , node "linearGradient"
                [ gradientUnits "userSpaceOnUse", id "o", x1 "1056.8", x2 "1095.4", xlinkHref "#a", y1 "1033.1", y2 "1039.1" ]
                []
            , text "    "
            , node "linearGradient"
                [ gradientUnits "userSpaceOnUse", id "p", x1 "922.01", x2 "972.65", xlinkHref "#a", y1 "933.03", y2 "1075" ]
                []
            , text "    "
            , node "linearGradient"
                [ gradientUnits "userSpaceOnUse", id "r", x1 "971.01", x2 "965.05", xlinkHref "#a", y1 "926.52", y2 "1042.5" ]
                []
            , text "    "
            , node "linearGradient"
                [ gradientUnits "userSpaceOnUse", id "c", x1 "737.1", x2 "924.68", xlinkHref "#b" ]
                []
            , text "    "
            , node "linearGradient"
                [ gradientUnits "userSpaceOnUse", id "e", x1 "1078.6", x2 "1133", xlinkHref "#b" ]
                []
            , text "  "
            ]
        , g []
            [ Svg.path [ d "M6.53 12.778a2.953 2.953 0 0 1-.531-.92c-.12-.358-.148-1.11-.058-1.563.158-.796.846-2.13 1.417-2.746.257-.277.257-.287.027-.729-.157-.301-.714-.878-.95-.983-.2-.09-.227-.198-.038-.157.639.138.93.39 1.284 1.111l.144.295.313-.21c.392-.26 1.5-.815 2.01-1.004.456-.17 1.028-.323 1.81-.487.735-.154 1.28-.32 2.283-.701.446-.17 1.08-.402 1.409-.518 1.185-.419 1.249-.454 2.174-1.214.845-.694 1.099-.865 1.363-.92.584-.123 1.193.11 1.782.679.773.747 1.121 1.721 1.011 2.825-.07.706-.114.937-.214 1.137-.161.322-.298.402-1.022.602-.95.262-2.402 1.2-3.782 2.446-.202.182-.697.652-1.1 1.043-.915.889-1.53 1.413-2.11 1.796-1.777 1.291-6.075 1.202-7.222.218z" ]
                []
            , text "    "
            , Svg.path [ d "M903.12 522.16c11.359-6.16 22.379-12.658 21.504-12.68-1.842-.045-15.022 5.492-24.943 10.48-6.02 3.026-11.371 5.503-11.888 5.503-2.225 0-.536-3.37 5.309-10.59 17.613-21.757 21.094-26.46 24.284-32.795 4.15-8.244 4.348-10.991.951-13.217-9.023-5.912-38.937 1.807-57.758 14.905-20.527 14.285-27.213 14.474-13.945.394 3.73-3.958 8.095-8.997 9.697-11.198s11.154-12.342 21.225-22.537c19.802-20.047 25.193-26.51 27.794-33.32 1.526-3.997 1.539-4.67.134-7.385-3.436-6.646-13.84-7.966-29.902-3.793-12.678 3.294-51.302 18.566-60.959 24.104-8.008 4.593-9.773 5.195-9.773 3.335 0-2.156 4.287-7.045 12.327-14.06 13.488-11.766 41.405-38.955 46.12-44.916 6.084-7.694 9.345-14.535 7.709-16.172-1.602-1.601-15.06-1.48-21.156.19-8.301 2.276-28.662 11.118-39.582 17.191-33.033 7.831-73.08 58.77-73.18 91.363.078 19.018-.37 35.726 10.976 47.998 41.212 31.127 115.18 28.824 155.05 7.2z", fill "url(#c)", transform "matrix(.0386 0 0 .03898 -22.242 -7.692)" ]
                []
            , text "    "
            , Svg.path [ d "M933.75 501.46c3.01 0 5.386-1.296 13.139-7.166 13.457-10.188 26.041-20.967 53.465-45.8 34.894-31.597 43.402-38.469 70-56.547 19.111-12.989 36.869-20.482 48.564-20.49 4.912-.005 9.976-2.56 12.286-6.2 3.297-5.195 7.853-12.88 7.73-24.683-.34-32.773-15.267-62.095-41.464-77.198-9.394-5.416-17.096-7.397-22.829-5.872-5.806 1.545-9.225 4.24-23.586 18.59-28.726 28.706-41.878 34.866-127.16 59.548-36.408 10.538-48.676 14.454-46.5 14.843 2.88.516 2.953.675 2.845 6.176-.2 10.177-5.589 19.844-18.647 33.45-4.533 4.724-11.842 11.539-16.242 15.144s-8.658 7.15-9.462 7.878 4.278-1.162 11.295-4.198c29.586-12.801 48.453-16.411 58.682-11.226 6.235 3.16 8.323 7.218 8.298 16.128-.035 12.504-5.357 20.104-28.314 40.432-13.322 11.796-21.973 20.19-20.809 20.19.328 0 6.09-2.663 12.803-5.917 14.364-6.963 23.7-9.574 34.006-9.51 8.85.053 14.898 2.632 18.098 7.717 4.31 6.847.06 18.38-11.61 31.506-3.569 4.013-6.488 7.44-6.488 7.616s4.1-.745 9.11-2.046 10.764-2.367 12.785-2.367z", fill "url(#d)", transform "matrix(.0386 0 0 .03898 -22.242 -7.692)" ]
                []
            , text "    "
            , Svg.path [ d "M21.598 5.507c.011.112-.08.622-.192.843-.13.258-.243.314-.487.241-.187-.056-.543-.366-.814-.71-.84-1.065-1.092-1.74-1.046-2.815.02-.466.029-.512.11-.578.267-.218 1.058.303 1.534.747.828.774.87 2.012.892 2.112" ]
                []
            , text "    "
            , Svg.path [ d "M1132.9 337.93c.712-2.9-2.133-34.391-19.822-50.427-2.888-2.618-15.25-10.552-20.917-13.398-2.842-1.427-7.071-2.9-9.399-3.272l-4.231-.676.558 10.902c.776 15.143 4.381 26.373 14.093 43.902 10.68 19.274 20.665 31.5 25.727 31.5 5.15 0 12.146-8.6 13.584-14.5", fill "url(#e)", transform "matrix(.0386 0 0 .03898 -22.242 -7.692)" ]
                []
            , text "    "
            , Svg.path [ d "M10.883 11.097c.204-.145.273-.21.203-.193-.291.072.043-.323.936-1.11.685-.604.932-.96.932-1.35 0-.345-.177-.565-.505-.627-.183-.035-.68.048-1.078.18-.37.122-1.288.51-1.265.535.009.008.236-.074.505-.183 1.16-.467 1.975-.524 2.165-.153.08.155.07.298-.035.523-.128.274-.245.412-1.042 1.228-.387.397-.754.791-.816.877s-.208.26-.326.386c-.252.27-.174.243.327-.113zM9.498 21.98c-2.846-.101-4.32-.25-5.585-.562a12.748 12.748 0 0 1-1.686-.561L2 20.754l.023-.253c.015-.159.076-.38.164-.593.077-.186.227-.62.333-.963.278-.9.487-1.329.809-1.653.176-.178.431-.34.655-.414.17-.058.19-.077.228-.226.271-1.075.467-1.522.824-1.878.188-.188.286-.252.487-.32.44-.15.827-.215 1.177-.2l.328.013-.001-.214-.001-.215-.267-.13c-.207-.1-.283-.161-.34-.272l-.142-.272c.006-.366-.042-.633 1.35-.574.468.02 1.182.175 1.706.179a15.18 15.18 0 0 0 1.564-.068c.559-.057 1.105-.078 1.624.046.218.105.428.348.316.507a1.822 1.822 0 0 1-.609.53c-.153.08-.156.085-.122.215.021.078.053.084.55.103.615.024 1.382.17 1.696.325.236.116.628.549.754.832.044.098.133.413.199.7l.119.524.163.06c.386.142.709.493.991 1.077.427.881.5 1.087.718 2.027.117.505.128 1.081.023 1.243-.097.15-.383.269-1.036.43-1.058.26-1.782.37-3.49.53-.722.067-2.764.169-2.948.147a8.47 8.47 0 0 0-.347-.017z" ]
                []
            , text "    "
            , Svg.path [ d "M11.292 21.867c1.064-.039 3.116-.252 3.943-.411.655-.126 1.504-.344 1.73-.445.285-.127.348-.237.345-.604-.002-.272-.07-.635-.253-1.356-.122-.476-.626-1.574-.873-1.9-.177-.233-.452-.45-.674-.532l-.164-.06-.119-.523a5.547 5.547 0 0 0-.198-.701c-.126-.283-.519-.716-.755-.832-.313-.154-1.08-.301-1.696-.325-.496-.019-.528-.025-.55-.103-.052-.2-.025-.294.103-.36.983-.83.12-1.035-1.244-.943-.37.025-1.185.194-1.573.193-.287-.001-1.441-.26-1.718-.252-1.609.049-1.152.416-1.156.526.069.1.124.2.124.22s.122.096.27.168l.269.131v.303l.002.302-.322-.025c-.348-.027-.711.032-1.183.192-.2.067-.299.132-.487.32-.357.356-.553.803-.824 1.878-.038.148-.058.168-.228.225a1.804 1.804 0 0 0-.655.415c-.322.324-.532.753-.81 1.653-.105.343-.253.773-.328.955s-.148.414-.162.516l-.027.183.226.102a12.83 12.83 0 0 0 1.685.561c1.121.277 2.288.412 4.388.51 1.554.072 1.476.071 2.914.019z" ]
                []
            , text "    "
            , Svg.path [ d "M8.63 21.575a70.88 70.88 0 0 1-1.01-.06l-.354-.025-.028-.337c-.08-.97.126-2.48.433-3.171l.1-.227h.83c.457 0 1.213-.02 1.68-.044.785-.04.854-.04.898.022.082.112.286.798.384 1.289.126.633.18 1.45.132 2.031-.02.253-.05.474-.067.491-.047.047-2.252.07-2.999.03z" ]
                []
            , text "    "
            , Svg.path [ d "M1014.2 1195.8c1.534-1.534 2.482-22.723 1.595-35.648-.491-7.161-1.984-18.42-3.316-25.02-2.518-12.469-7.824-30.178-9.886-32.999-1.074-1.468-3.072-1.524-20.657-.57-10.707.581-29.42 1.06-41.581 1.063l-22.113.01-2.613 5.823c-7.698 17.152-13.117 54.523-11.216 77.346l.72 8.656 9.168.642c25.692 1.8 45.783 2.346 71.141 1.936 15.386-.248 28.327-.804 28.758-1.235z", fill "url(#f)", transform "matrix(.0386 0 0 .03898 -27.59 -25.153)" ]
                []
            , text "    "
            , Svg.path [ d "M11.994 20.456c-.026-1.385-.126-2.013-.41-2.576a.93.93 0 0 1-.082-.198c0-.02.144-.048.319-.062a10.6 10.6 0 0 0 2.357-.468c.166-.056.322-.089.347-.074.294.172.541.504.692.93.176.495.229.928.25 2.052.019.99.017 1.04-.052 1.061-.29.092-1.57.253-3.126.394l-.275.024z" ]
                []
            , text "    "
            , Svg.path [ d "M1061.5 1192.1c22.151-2.176 45.483-5.452 50.878-7.144 1.79-.561 1.853-1.748 1.351-25.231-.57-26.7-2.057-38.335-6.47-50.642-3.096-8.63-8.187-16.483-13.325-20.552l-3.891-3.082-8.271 2.522c-19.074 5.817-38.196 9.488-58.004 11.137l-7.733.643 1.592 3.079c6.756 13.064 9.463 30.432 10.11 64.866l.518 27.613 4.122-.376c2.268-.207 15.373-1.482 29.123-2.833z", fill "url(#g)", transform "matrix(.0386 0 0 .03898 -27.59 -25.153)" ]
                []
            , text "    "
            , Svg.path [ d "M6.029 21.395c-.528-.058-1.537-.224-1.838-.302-.192-.05-.193-.051-.205-.224-.02-.27.066-.907.184-1.38.21-.834.556-1.527.933-1.87.218-.198.27-.208.632-.122.314.075.964.168 1.402.2l.361.028-.02.101c-.01.056-.073.248-.138.426-.249.679-.397 1.76-.361 2.649l.022.555-.247-.004a10.471 10.471 0 0 1-.725-.057z" ]
                []
            , text "    "
            , Svg.path [ d "M893.65 1179.9c-1.167-24.482 4.64-61.17 11.932-75.374l1.347-2.624-9.21-.683c-11.248-.834-28.023-3.213-36.51-5.177-5.967-1.381-6.447-1.353-9.097.534-10.989 7.824-21.804 28.315-27.619 52.328-2.643 10.916-5.159 30.551-4.225 32.983 1.128 2.94 50.264 11.162 69.638 11.652l4.399.112z", fill "url(#h)", transform "matrix(.0386 0 0 .03898 -27.59 -25.153)" ]
                []
            , text "    "
            , Svg.path [ d "M15.865 20.56c0-.236-.026-.683-.059-.992-.126-1.215-.382-2.108-.713-2.49-.064-.072-.116-.153-.116-.178s.063-.072.139-.104c.193-.081.35-.021.631.243.288.269.404.453.719 1.142.324.71.533 1.488.535 1.998.003.46-.04.518-.521.684-.2.07-.42.126-.49.127h-.125v-.43z" ]
                []
            , text "    "
            , Svg.path [ d "M1141.9 1177.7c9.755-3.449 11.614-5.862 11.52-14.947-.116-11.058-6.181-32.612-13.857-49.24-8.187-17.735-11.163-22.412-18.71-29.399-6.196-5.736-9.254-7.18-12.817-6.049-2.074.658-2.068.701.483 3.733 10.557 12.547 19.47 53.21 19.47 88.833v11.108l3.25-.71c1.788-.39 6.585-1.888 10.661-3.33z", fill "url(#i)", transform "matrix(.0386 0 0 .03898 -27.59 -25.153)" ]
                []
            , text "    "
            , Svg.path [ d "M3.284 20.842a13.39 13.39 0 0 1-.608-.22c-.276-.109-.28-.112-.28-.253 0-.18.097-.51.222-.758a8.48 8.48 0 0 0 .287-.778c.328-1.01.606-1.422 1.133-1.686l.284-.141.35.15c.192.081.35.168.35.192s-.072.102-.16.173c-.524.426-.999 1.767-1.101 3.11-.029.376-.006.366-.477.21z" ]
                []
            , text "    "
            , Svg.path [ d "M810.37 1171.9c2.81-33.545 14.481-66.997 27.304-78.256 1.953-1.715 3.39-3.239 3.196-3.387s-3.446-1.561-7.223-3.139l-6.868-2.868-6.38 3.308c-12.646 6.557-19.986 17.663-28.229 42.718-2.717 8.26-6.064 17.234-7.436 19.945-2.645 5.223-5.72 14.636-5.72 17.512 0 .96 1.218 2.18 2.75 2.759 13.006 4.908 25.03 9.063 26.354 9.106 1.284.04 1.732-1.492 2.252-7.698z", fill "url(#j)", transform "matrix(.0386 0 0 .03898 -27.59 -25.153)" ]
                []
            , text "    "
            , Svg.path [ d "M7.452 17.442c-.463-.028-.993-.093-1.025-.126-.03-.03.108-.948.179-1.185.044-.147.177-.465.296-.706l.216-.439h.408c.225 0 .623.029.886.064l.477.065-.028.199-.06.452c-.019.14-.035.573-.035.965l-.002.711h-.11c-.06 0-.238.007-.395.016s-.52.002-.807-.016z" ]
                []
            , text "    "
            , Svg.path [ d "M936.15 1090.6h3.86v-17.776c0-15.68 1.119-31.54 2.562-36.334.41-1.362-1.41-1.864-11.788-3.253-6.75-.903-16.137-1.64-20.86-1.64h-8.585l-5.59 11.25c-6.722 13.53-9.374 21.902-10.919 34.473-.944 7.68-.916 9.6.15 10.259 2.635 1.628 33.932 4.085 42.92 3.369 2.414-.193 6.127-.35 8.25-.35z", fill "url(#k)", transform "matrix(.0386 0 0 .03898 -27.59 -25.153)" ]
                []
            , text "    "
            , Svg.path [ d "M9.02 17.356c-.07-.26-.004-1.34.114-1.89l.06-.283.47-.001c.436-.002.927-.035 1.46-.1l.22-.026.085.17c.225.446.384 1.154.384 1.717v.299l-.183.023c-.38.047-2.21.178-2.504.179-.053 0-.091-.031-.106-.088z", fill "#1a1a1a" ]
                []
            , text "    "
            , Svg.path [ d "M975.51 1089.1c12.189-.687 32.294-2.286 38.75-3.082l4.75-.586v-5.656c-.01-12.461-4.455-31.294-9.913-41.993-1.94-3.805-2.502-4.233-4.888-3.732-5.44 1.142-26.016 2.552-37.377 2.56l-11.682.01-1.57 7.25c-3.027 13.977-4.615 38.233-2.917 44.573.596 2.224.924 2.3 7.736 1.772 3.913-.303 11.614-.805 17.114-1.115z", fill "url(#l)", transform "matrix(.0386 0 0 .03898 -27.59 -25.153)" ]
                []
            , text "    "
            , Svg.path [ d "M5.233 17.048a58.13 58.13 0 0 0-.704-.172c-.075-.016-.087-.043-.087-.204 0-.253.092-.594.252-.937.239-.512.779-.98 1.311-1.136.085-.025.31-.06.502-.078s.389-.046.44-.062c.09-.028.09-.026.063.162-.023.152-.064.23-.202.378-.308.333-.67 1.221-.793 1.948-.033.195-.06.262-.105.259a13.576 13.576 0 0 1-.677-.158z" ]
                []
            , text "    "
            , Svg.path [ d "M868.85 1077.2c3.495-18.968 12.625-40.877 20.578-49.379 2.521-2.695 4.584-5.756 4.584-6.802 0-1.764-.6-1.859-8.25-1.305-10.312.746-15.463 2.165-23.91 6.583-13.22 6.916-24.11 21.454-28.31 37.791-2.2 8.564-2.03 11.395.719 11.984 1.238.266 8.55 2.026 16.25 3.913s14.71 3.478 15.577 3.536c1.172.079 1.881-1.543 2.762-6.322z", fill "url(#m)", transform "matrix(.0386 0 0 .03898 -27.59 -25.153)" ]
                []
            , text "    "
            , Svg.path [ d "M12.164 17.119a5.45 5.45 0 0 1-.098-.615c-.071-.592-.151-.983-.257-1.255-.09-.233-.09-.3-.002-.3.122 0 .72-.19.734-.234.018-.054.253-.011.432.08.214.108.494.44.64.758.121.266.401 1.163.401 1.287 0 .03-.014.062-.03.072-.028.017-1.222.22-1.62.276-.148.02-.169.013-.2-.07z" ]
                []
            , text "    "
            , Svg.path [ d "M1055.7 1080.6c9.788-1.65 18.143-3 18.566-3 1.398 0 .805-3.617-2.312-14.111-5.92-19.926-13.574-32.122-23.262-37.064l-3.892-1.986-8.132 2.572c-4.473 1.415-9.631 2.864-11.462 3.221-2.838.554-3.228.961-2.636 2.759 2.874 8.727 5.503 21.15 6.888 32.546 2.19 18.027 2.202 18.063 5.62 18.063 1.554 0 10.834-1.35 20.623-3z", fill "url(#n)", transform "matrix(.0386 0 0 .03898 -27.59 -25.153)" ]
                []
            , text "    "
            , Svg.path [ d "M14.302 16.635c-.039-.265-.224-.727-.417-1.043-.192-.316-.68-.955-.728-.955-.018 0-.033-.036-.033-.08 0-.074.016-.078.183-.055.931.13 1.358.434 1.624 1.158.101.274.286.93.267.95-.023.022-.74.21-.806.21-.045 0-.07-.05-.09-.185z" ]
                []
            , text "    "
            , Svg.path [ d "M1100.8 1071c6.133-1.716 6.09-.609.655-17.17-5.233-15.943-10.77-23.345-21.55-28.808-4.808-2.436-17.197-5.822-19.046-5.206-.53.177 1.857 3.897 5.302 8.267 11.852 15.032 19.701 30.32 21.383 41.649l.69 4.642 3.652-.951c2.01-.524 6.02-1.614 8.914-2.424z", fill "url(#o)", transform "matrix(.0386 0 0 .03898 -27.59 -25.153)" ]
                []
            , text "    "
            , Svg.path [ d "M7.819 14.802 7.5 14.77l-.202-.023v-.445c0-.296.014-.446.042-.446.023 0 .21.034.415.076 1 .203 2.911.212 3.762.016.145-.033.267-.054.273-.047.036.05.22.743.203.761a1.27 1.27 0 0 1-.246.08c-.18.048-.567.06-2.018.064-.987.003-1.846.001-1.91-.004z" ]
                []
            , text "    "
            , Svg.path [ d "M1015.8 1021.7c3.45-.723 6.515-1.703 6.808-2.178.294-.475-.491-4.046-1.744-7.935l-2.277-7.072-3.53.677c-10.392 1.99-16.705 2.483-39.532 3.083-26.787.704-45.468-.366-60.878-3.486l-8.621-1.745v18.468l5.25.568c2.887.313 6.6.683 8.25.822s22.575.222 46.5.183c31.846-.052 45.18-.423 49.774-1.385z", fill "url(#p)", transform "matrix(.0386 0 0 .03898 -27.59 -25.153)" ]
                []
            , text "    "
            , Svg.path [ d "M964.01 999.95c-20.347-1.116-42.297-4.35-60.435-8.906-9.052-2.274-10.275-2.87-13.759-6.709-4.617-5.086-4.568-7.583.194-9.962 5.68-2.837 18.56-2.284 43.111 1.852l21.39 3.603 21.5-1.582c28.625-2.107 54.801-2.94 58.5-1.864 4.503 1.313 4.487 4.571-.044 8.845-8.44 7.96-23.219 12.726-44.627 14.391-11.998.933-14.334.963-25.83.333z", fill "url(#q)", transform "matrix(.0386 0 0 .03898 -27.59 -25.153)" ]
                []
            , text "    "
            , Svg.path [ d "M987.84 997.62c20.463-1.591 33.831-5.658 43.42-13.211 9.666-7.612 3.943-8.048-53.75-4.092 0 0-15.991 2.034-24 1.646-7.426-.36-22-3.674-22-3.674-12.1-2.021-25.052-3.672-28.782-3.67-6.437.004-13.719 1.97-13.717 3.704 0 .44 1.487 2.47 3.303 4.511 2.908 3.268 4.49 4.009 13.25 6.209 18.15 4.558 40.094 7.793 60.446 8.91 3.025.165 6.4.374 7.5.463s7.548-.269 14.33-.796z", fill "url(#r)", transform "matrix(.0386 0 0 .03898 -27.59 -25.153)" ]
                []
            , text "  "
            ]
        ]