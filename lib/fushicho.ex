defmodule Mix.Tasks.Fushicho do
  # for calling local methods
  use Mix.Task

  @moduledoc """
  Provides math-related functions.

  ## Examples

      iex> Mix.Tasks.Fushicho.sum(1, 2)
      3

   """

  @shortdoc "My mix command sample"

   @doc """
  Run task. 
   """
   def run(args) do
     IO.puts ("Scaffolding...")
     unless checkPhoenix() do
        IO.puts ("no phoenix project...")
     else
        name = Enum.at(args, 0)
        if name == "--init" do
          initReact()
        else
          create_js(name)
        end
     end
   end

  @doc """
  Initialization
  """
  def initReact() do
    IO.puts ("initialize...")

    # package.jsonを生成
    package_json_path = "package.json"
    package_json = """
    {
      "repository": {},
      "license": "MIT",
      "scripts": {
        "deploy": "brunch build --production",
        "watch": "brunch watch --stdin"
      },
      "dependencies": {
        "phoenix": "file:deps/phoenix",
        "phoenix_html": "file:deps/phoenix_html",
        "superagent": "^1.7.2",
        "history": "^1.17.0",
        "jquery": "^2.1.4",
        "react": "^0.14.7",
        "babel-brunch": "~6.0.0",
        "react-dom": "^0.14.7",
        "react-notification": "^4.2.0",
        "react-redux": "^4.4.0",
        "react-router": "^1.0.3",
        "react-router-redux": "^2.1.0",
        "redux": "^3.3.1",
        "redux-form": "^4.2.0",
        "redux-thunk": "^1.0.3"
      },
      "devDependencies": {
        "brunch": "2.7.4",
        "clean-css-brunch": "~2.0.0",
        "css-brunch": "~2.0.0",
        "javascript-brunch": "~2.0.0",
        "babel": "^6.3.26",
        "babel-plugin-react-transform": "^2.0.0",
        "babel-plugin-transform-object-rest-spread": "^6.3.13",
        "babel-preset-es2015": "^6.3.13",
        "babel-preset-react": "^6.3.13",
        "babelify": "^7.2.0",
        "es5-shim": "^4.5.9"
      },
      "babel": {
        "presets": [
          "es2015",
          "react"
        ],
        "plugins": [
          "transform-object-rest-spread"
        ]
      }
    }
    """
    {:ok, file} = File.open package_json_path, [:write]
    IO.binwrite file, package_json

    contain = """
    /* This file is for your main application css. */
    @media (min-width: 550px) {
        .container  { max-width: 1400px; }
    }
    """
    # css用のフォルダを生成する
    File.mkdir "web/static/assets/css"
    css = "web/static/assets/css/app.css"
    {:ok, file} = File.open css, [:write]
    IO.binwrite file, contain

   # あとでファイルにしたい
   css_spinner = """
    /* Absolute Center CSS Spinner */
    .loading {
      position: fixed;
      z-index: 999;
      height: 2em;
      width: 2em;
      overflow: show;
      margin: auto;
      top: 0;
      left: 0;
      bottom: 0;
      right: 0;
    }

    /* Transparent Overlay */
    .loading:before {
      content: '';
      display: block;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0,0,0,0.3);
    }

    /* :not(:required) hides these rules from IE9 and below */
    .loading:not(:required) {
      /* hide "loading..." text */
      font: 0/0 a;
      color: transparent;
      text-shadow: none;
      background-color: transparent;
      border: 0;
    }

    .loading:not(:required):after {
      content: '';
      display: block;
      font-size: 10px;
      width: 1em;
      height: 1em;
      margin-top: -0.5em;
      -webkit-animation: spinner 1500ms infinite linear;
      -moz-animation: spinner 1500ms infinite linear;
      -ms-animation: spinner 1500ms infinite linear;
      -o-animation: spinner 1500ms infinite linear;
      animation: spinner 1500ms infinite linear;
      border-radius: 0.5em;
      -webkit-box-shadow: rgba(0, 0, 0, 0.75) 1.5em 0 0 0, rgba(0, 0, 0, 0.75) 1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) 0 1.5em 0 0, rgba(0, 0, 0, 0.75) -1.1em 1.1em 0 0, rgba(0, 0, 0, 0.5) -1.5em 0 0 0, rgba(0, 0, 0, 0.5) -1.1em -1.1em 0 0, rgba(0, 0, 0, 0.75) 0 -1.5em 0 0, rgba(0, 0, 0, 0.75) 1.1em -1.1em 0 0;
      box-shadow: rgba(0, 0, 0, 0.75) 1.5em 0 0 0, rgba(0, 0, 0, 0.75) 1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) 0 1.5em 0 0, rgba(0, 0, 0, 0.75) -1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) -1.5em 0 0 0, rgba(0, 0, 0, 0.75) -1.1em -1.1em 0 0, rgba(0, 0, 0, 0.75) 0 -1.5em 0 0, rgba(0, 0, 0, 0.75) 1.1em -1.1em 0 0;
    }

    /* Animation */

    @-webkit-keyframes spinner {
      0% {
        -webkit-transform: rotate(0deg);
        -moz-transform: rotate(0deg);
        -ms-transform: rotate(0deg);
        -o-transform: rotate(0deg);
        transform: rotate(0deg);
      }
      100% {
        -webkit-transform: rotate(360deg);
        -moz-transform: rotate(360deg);
        -ms-transform: rotate(360deg);
        -o-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }
    @-moz-keyframes spinner {
      0% {
        -webkit-transform: rotate(0deg);
        -moz-transform: rotate(0deg);
        -ms-transform: rotate(0deg);
        -o-transform: rotate(0deg);
        transform: rotate(0deg);
      }
      100% {
        -webkit-transform: rotate(360deg);
        -moz-transform: rotate(360deg);
        -ms-transform: rotate(360deg);
        -o-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }
    @-o-keyframes spinner {
      0% {
        -webkit-transform: rotate(0deg);
        -moz-transform: rotate(0deg);
        -ms-transform: rotate(0deg);
        -o-transform: rotate(0deg);
        transform: rotate(0deg);
      }
      100% {
        -webkit-transform: rotate(360deg);
        -moz-transform: rotate(360deg);
        -ms-transform: rotate(360deg);
        -o-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }
    @keyframes spinner {
      0% {
        -webkit-transform: rotate(0deg);
        -moz-transform: rotate(0deg);
        -ms-transform: rotate(0deg);
        -o-transform: rotate(0deg);
        transform: rotate(0deg);
      }
      100% {
        -webkit-transform: rotate(360deg);
        -moz-transform: rotate(360deg);
        -ms-transform: rotate(360deg);
        -o-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }
    """
    css_spinner_path = "web/static/assets/css/cssloader.css"
    {:ok, file} = File.open css_spinner_path, [:write]
    IO.binwrite file, css_spinner
    message = """

    You should add them to your "web/templates/lauout/app.html.eex".

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/4.2.0/normalize.min.css" integrity="sha256-K3Njjl2oe0gjRteXwX01fQD5fkk9JFFBdUHy/h38ggY=" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/skeleton/2.0.4/skeleton.min.css" integrity="sha256-2YQRJMXD7pIAPHiXr0s+vlRWA7GYJEK0ARns7k2sbHY=" crossorigin="anonymous" />
    <link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" href="<%= static_path(@conn, "/css/cssloader.css") %>">
    """
    IO.puts(message)
  end

   @doc """
   Check  Phoenix file.
  """
  def checkPhoenix() do
     static = File.dir? "web/static/js"
     templates = File.dir? "web/templates"
     layout = File.dir? "web/templates/layout"
     controllers = File.dir? "web/controllers"
     models = File.dir? "web/models"
     # both
     static && templates && layout  && controllers && models
   end

   @doc """
   Create React's js file.
   """
   def create_js(name) do
     # modelファイル確認
     model_file = "web/models/" <> name <> ".ex"
     is_file_exist = File.exists?(model_file)
     unless is_file_exist do
        IO.puts ("no model file...")
        IO.puts (model_file)
        false
     else
        contain = File.read! model_file

        #  schema "posts" do
        plural_reg = ~r/.*schema "(.*)"/U # 貪欲ではない
        plulal_cap = Regex.scan(plural_reg, contain)
        # これが複数形
        plulal_list = Enum.map(plulal_cap, fn(x) -> Enum.at(x, 1)  end)
        plural = plulal_list |> Enum.at(0)
        # IO.puts plural 

        # ex) field :title, :string
        field_name_reg = ~r/.*field :(.*),/U # 貪欲ではない
        field_name_cap = Regex.scan(field_name_reg, contain)
        # これが実際のモデルのフィールドに相当する
        field_list  = Enum.map(field_name_cap, fn(x) -> Enum.at(x, 1)  end)
        #IO.inspect field_list

        field_type_reg = ~r/.*field :.*, :(.*)/
        field_type_cap = Regex.scan(field_type_reg, contain)
        # これが実際のモデルのフィールドの型に相当する
        type_list  = Enum.map(field_type_cap, fn(x) -> Enum.at(x, 1)  end)
        #IO.inspect type_list

        # Reactのjsを生成
        path = "web/static/js/"
        filename = path <> name <> ".js"
        # ファイル開く
        {:ok, file} = File.open filename, [:write]

        # Reactコードの中身
        # ~sの部分が置換される

        # 大文字開始
        capitalized = String.capitalize(name)

        # 大文字複数形
        capitalized_plural = String.capitalize(plural)

        # 以下の様な<td>の生成
        # <td>{this.props.book.title}</td>
        # <td>{this.props.book.category}</td>

        td_content = field_list
        |> Enum.map_join("\n                ", fn e  -> :io_lib.format("<td>{this.props.~s.~s}</td>", [name, e]) end)

        # 以下の様な<th>の生成
        # <th>Title</th>
        # <th>Category</th>
        th_content = field_list
        |> Enum.map_join("\n                        ", fn e  -> :io_lib.format("<th>~s</th>", [String.capitalize(e)]) end)

        # 以下の様な<label>の生成
        # <label forHtml='title'>Title</label><input ref='title' name='title' type='text' value={this.props.book.title} onChange={this.onChange}/>
        label_content = field_list
        |> Enum.map_join("\n                ",
          fn e  -> :io_lib.format(
            "<label forHtml='~s'>~s</label><input ref='~s' name='~s' type='text' value={this.props.~s.~s} onChange={this.onChange}/>",
            [e, String.capitalize(e), e, e, name, e])
        end)

        # onChange系
        # var title = ReactDOM.findDOMNode(this.refs.title).value;
        # var category = ReactDOM.findDOMNode(this.refs.category).value;
        on_change_conent = field_list
        |> Enum.map_join("\n        ",
          fn e  -> :io_lib.format("var ~s = ReactDOM.findDOMNode(this.refs.~s).value;",
          [e, e]
        ) end)

        # 以下のもの
        # title:"",
        # category:"",
        editing_content = field_list
        |> Enum.map_join("\n                ", fn e  -> :io_lib.format("~s:\"\",", [e]) end)
        # IO.puts(editing_content)

        # handleChangeの引数
        # function(title, category)
        func_args = field_list |> Enum.join(", ")
        # IO.puts(func_args)

        # handleChangeのsetState用
        # title: title,
        # category: category,
        set_state_content = field_list
        |> Enum.map_join("\n                ", fn e  -> :io_lib.format("~s: ~s,", [e, e]) end)

        contain = """
        import React from 'react';
        var ReactDOM = require('react-dom');
        import $ from 'jquery';

        var ~sTableRow = React.createClass({
            render: function() {
                return (
                    <tr>
                        ~s
                        <td><a href='#' onClick={this.onClick}>Edit</a></td>
                    </tr>
                );
            },
            onClick: function(id) {
                this.props.handleEditClickPanel(this.props.~s.id);
            }
        });

        var ~sTable = React.createClass({
            render: function() {
                var rows = [];
                for(var i = 0; i < this.props.~s.length; i++) {
                    var ~s = this.props.~s[i];
                    rows.push(<~sTableRow key={~s.id} ~s={~s} handleEditClickPanel={this.props.handleEditClickPanel}  />);
                }
                return (
                    <table>
                        <thead>
                            <tr>
                                ~s
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>{rows}</tbody>
                    </table>
                );
            }
        });

        var ~sForm = React.createClass({
            render: function() {
                return(
                    <form onSubmit={this.props.handleSubmitClick}>
                        ~s
                        <br />
                        <input type='submit' value={this.props.~s.id?"Save (id = " +this.props.~s.id+ ")":"Add"} />
                        {this.props.~s.id?<button onClick={this.props.handleDeleteClick}>Delete</button>:null}
                        {this.props.~s.id?<button onClick={this.props.handleCancelClick}>Cancel</button>:null}
                        {this.props.message?<div>{this.props.message}</div>:null}
                    </form>
                );
            },
            onChange: function() {
                ~s
                this.props.handleChange(~s);
            }
        });

        var ~sPanel = React.createClass({
            getInitialState: function() {
                return {
                    ~s: [],
                    editing~s: {
                        ~s
                    },
                    message:""
                };
            },
            render: function() {
                return(
                    <div className="row">
                        <div className="one-half column">
                            <~sTable ~s={this.state.~s} handleEditClickPanel={this.handleEditClickPanel} />
                        </div>
                        <div className="one-half column">
                            <~sForm
                                ~s={this.state.editing~s}
                                message={this.state.message} 
                                handleChange={this.handleChange}
                                handleSubmitClick={this.handleSubmitClick}
                                handleCancelClick={this.handleCancelClick}
                                handleDeleteClick={this.handleDeleteClick}
                            />
                        </div>
                    </div>
                );
            },
            componentDidMount: function() {
                this.reload~s('');
            },
            handleEditClickPanel: function(id) {
                var ~s = $.extend({}, this.state.~s.filter(function(x) {
                    return x.id == id;
                })[0] );
                
                this.setState({
                    editing~s: ~s,
                    message: ''
                });
            },
            handleChange: function(~s) {
                this.setState({
                    editing~s: {
                        ~s
                        id: this.state.editing~s.id
                    }
                });
            },
            handleCancelClick: function(e) {
                this.setState({
                    editing~s: {}
                });
            },    
            reload~s: function(query) {
                $.ajax({
                    url: this.props.url,
                    dataType: 'json',
                    contentType: 'application/json',
                    beforeSend: function(req) {
                        req.setRequestHeader('Accept', 'application/json');
                    },
                    cache: false,
                    success: function(data) {
                        this.setState({
                            ~s: data.data.reverse()
                        });
                    }.bind(this),
                    error: function(xhr, status, err) {
                        console.error(this.props.url, status, err.toString());
                        this.setState({
                            message: err.toString()
                        });
                    }.bind(this)
                });
            },
            handleSubmitClick: function(e) {
                e.preventDefault();
                if(this.state.editing~s.id) {
                    $.ajax({
                        url: this.props.url+this.state.editing~s.id,
                        dataType: 'json',
                        method: 'PUT',
                        contentType: 'application/json',
                        beforeSend: function(req) {
                            req.setRequestHeader('Accept', 'application/json');
                        },
                        data: JSON.stringify({~s:this.state.editing~s}),
                        cache: false,
                        success: function(data) {
                            this.setState({
                                message: "Successfully updated ~s!"
                            });
                            this.reload~s('');
                        }.bind(this),
                        error: function(xhr, status, err) {
                            console.error(this.props.url, status, err.toString());
                            this.setState({
                                message: err.toString()
                            });
                        }.bind(this)
                    });
                } else {
                    $.ajax({
                        url: this.props.url,
                        dataType: 'json',
                        method: 'POST',
                        data: JSON.stringify({~s:this.state.editing~s}),
                        contentType: 'application/json',
                        beforeSend: function(req) {
                            req.setRequestHeader('Accept', 'application/json');
                        },
                        cache: false,
                        success: function(data) {
                            this.setState({
                                message: "Successfully added ~s!"
                            });
                            this.reload~s('');
                        }.bind(this),
                        error: function(xhr, status, err) {
                            console.error(this.props.url, status, err.toString());
                            this.setState({
                                message: err.toString()
                            });
                        }.bind(this)
                    });
                }
                this.setState({
                    editing~s: {}
                });
            },
            handleDeleteClick: function(e) {
                e.preventDefault();
                $.ajax({
                    url: this.props.url+this.state.editing~s.id,
                    method: 'DELETE',
                    cache: false,
                    success: function(data) {
                        this.setState({
                            message: "Successfully deleted ~s!",
                            editing~s: {}
                        });
                        this.reload~s('');
                    }.bind(this),
                    error: function(xhr, status, err) {
                        console.error(this.props.url, status, err.toString());
                        this.setState({
                            message: err.toString()
                        });
                    }.bind(this)
                });
            },
        });

        ReactDOM.render(<~sPanel url='/api/~s/' />, document.getElementById('~s-content'));
        """
        # 修正
        fix = :io_lib.format(contain,
          [capitalized, td_content, name, capitalized, plural, name, plural, capitalized, name, name, name,
          th_content, capitalized, label_content, name, name, name, name, on_change_conent, func_args, capitalized, plural, capitalized,
          editing_content,
          capitalized, plural, plural, capitalized, name, capitalized,
          capitalized_plural,
          name, plural, capitalized, name, func_args, capitalized, set_state_content, capitalized,
          capitalized, capitalized_plural, plural, capitalized, capitalized, name, capitalized, name, capitalized_plural,
          name, capitalized, name, capitalized_plural, capitalized, capitalized, name, capitalized, capitalized_plural,
          capitalized, plural, name]
        )
        IO.binwrite file, fix

        message = """
        Add "web/static/js/~s" to your brunch-config.js autoRequire's array.

        modules: {
          autoRequire: {
            "js/app.js": ["web/static/js/app", "web/static/js/~s"]
          }
        },

        And also add the div tag yo your *.eex file.

        <div class="container" id="~s-content"></div>
        """
        fixed_message = :io_lib.format(message, [name, name, name])
        IO.puts(fixed_message)
        true
     end
    end

     def sum(a, b) do
        a + b
    end
end
