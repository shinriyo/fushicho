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
    contain = """
    /* This file is for your main application css. */
    @media (min-width: 550px) {
        .container  { max-width: 1400px; }
    }
    """
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
    you should add them to your web/templates/lauout/app.html.eex,

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
        # ex) field :title, :string
        field_name_reg = ~r/.*field :(.*),/U # 貪欲ではない
        field_name_cap = Regex.scan(field_name_reg, contain)
        field_list  = Enum.map(field_name_cap, fn(x) -> Enum.at(x, 1)  end)
        # これが実際のモデルのフィールドに相当する
        #IO.inspect field_list

        field_type_reg = ~r/.*field :.*, :(.*)/
        field_type_cap = Regex.scan(field_type_reg, contain)
        type_list  = Enum.map(field_type_cap, fn(x) -> Enum.at(x, 1)  end)
        # これが実際のモデルのフィールドの型に相当する
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

        # 複数形
        plural = name <> "s"

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

        contain = """
        import React from 'react';
        var ReactDOM = require('react-dom');
        import $ from 'jquery';

        var SearchPanel = React.createClass({
            render: function() {
                return (
                    <div className="row">
                        <div className="one-fourth column">
                            Filter: &nbsp;
                            <input ref='search' type='text' value={this.props.search} onChange={this.onSearchChanged} />
                            {this.props.search?<button onClick={this.props.onClearSearch} >x</button>:null}
                        </div>
                    </div>
                )
            },
            onSearchChanged: function() {
                var query = ReactDOM.findDOMNode(this.refs.search).value;
                this.props.onSearchChanged(query);
            }
        });

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
                var title = ReactDOM.findDOMNode(this.refs.title).value;
                var category = ReactDOM.findDOMNode(this.refs.category).value;
                this.props.handleChange(title, category);
            }
        });

        var ~sPanel = React.createClass({
            getInitialState: function() {
                return {
                    ~s: [],
                    editing~s: {
                        title:"",
                        category:"",
                    },
                    search:"",
                    message:""
                };
            },
            render: function() {
                return(
                    <div className="row">
                        <div className="one-half column">
                            <SearchPanel
                                search={this.state.search}
                                onSearchChanged={this.onSearchChanged}
                                onClearSearch={this.onClearSearch}
                            />
                            <BookTable books={this.state.books} handleEditClickPanel={this.handleEditClickPanel} />
                        </div>
                        <div className="one-half column">
                            <BookForm 
                                book={this.state.editingBook} 
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
                this.reloadBooks('');
            },
            onSearchChanged: function(query) {
                if (this.promise) {
                    clearInterval(this.promise)
                }
                this.setState({
                    search: query
                });
                this.promise = setTimeout(function () {
                    this.reloadBooks(query);
                }.bind(this), 200);
            },
            onClearSearch: function() {
                this.setState({
                    search: ''
                });
                this.reloadBooks('');
            },
            handleEditClickPanel: function(id) {
                var book = $.extend({}, this.state.books.filter(function(x) {
                    return x.id == id;
                })[0] );
                
                this.setState({
                    editingBook: book,
                    message: ''
                });
            },
            handleChange: function(title, category) {
                this.setState({
                    editingBook: {
                        title: title,
                        category: category,
                        id: this.state.editingBook.id
                    }
                });
            },
            handleCancelClick: function(e) {
                this.setState({
                    editingBook: {}
                });
            },    
            reloadBooks: function(query) {
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
                            books: data.data.reverse(),
                            search: query
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
                if(this.state.editingBook.id) {
                    $.ajax({
                        url: this.props.url+this.state.editingBook.id,
                        dataType: 'json',
                        method: 'PUT',
                        contentType: 'application/json',
                        beforeSend: function(req) {
                            req.setRequestHeader('Accept', 'application/json');
                        },
                        data: JSON.stringify({book:this.state.editingBook}),
                        cache: false,
                        success: function(data) {
                            this.setState({
                                message: "Successfully updated book!"
                            });
                            this.reloadBooks('');
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
                        data: JSON.stringify({book:this.state.editingBook}),
                        contentType: 'application/json',
                        beforeSend: function(req) {
                            req.setRequestHeader('Accept', 'application/json');
                        },
                        cache: false,
                        success: function(data) {
                            this.setState({
                                message: "Successfully added book!"
                            });
                            this.reloadBooks('');
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
                    editingBook: {}
                });
            },
            handleDeleteClick: function(e) {
                e.preventDefault();
                $.ajax({
                    url: this.props.url+this.state.editingBook.id,
                    method: 'DELETE',
                    cache: false,
                    success: function(data) {
                        this.setState({
                            message: "Successfully deleted book!",
                            editingBook: {}
                        });
                        this.reloadBooks('');
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

        ReactDOM.render(<BookPanel url='/api/books/' />, document.getElementById('content'));
        """
        # 修正
        fix = :io_lib.format(contain,
          [capitalized, td_content, name, capitalized, name, name, name, capitalized, name, name, name,
          th_content, capitalized, label_content, name, name, name, name, capitalized, plural, name
          ])
        IO.binwrite file, fix

        message = """
        add ~s to your brunch-config.js

        joinTo: ["js/app.js", "js/~s.js"]
        """
        fixed_message = :io_lib.format(message, [name, name])
        IO.puts(fixed_message)
        true
     end
    end

     def sum(a, b) do
        a + b
    end
end
