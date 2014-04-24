-define(DEBUG(Format, Data), error_logger:info_msg(Format ++ "~n", Data)).
-define(DEBUG(Format), error_logger:info_msg(Format ++ "~n")).

-define(INFO(Format, Data), error_logger:info_msg(Format, Data)).
-define(INFO(Format), error_logger:info_msg(Format ++ "~n")).

-define(WARN(Format, Data), error_logger:info_msg(Format, Data)).
-define(WARN(Format), error_logger:info_msg(Format ++ "~n")).

-define(ERROR(Format, Data), error_logger:error_msg(Format, Data)).
-define(ERROR(Format), error_logger:error_msg(Format ++ "~n")).
