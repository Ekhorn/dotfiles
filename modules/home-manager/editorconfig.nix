{ ... }:

{
  editorconfig.enable = true;
  editorconfig.settings."*" = {
    charset = "utf-8";
    indent_style = "space";
    indent_size = 2;
    end_of_line = "lf";
    insert_final_newline = true;
    trim_trailing_whitespace = true;
    max_line_length = 80;
  };
  editorconfig.settings."COMMIT_EDITMSG" = {
    max_line_length = 72;
  };
}
