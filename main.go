package main

import (
	"database/sql"
	"encoding/json"
	"html/template"
	"log"
	"net/http"
	"os"
	"time"

	_ "github.com/go-sql-driver/mysql"
)

func fatalIfError(err error, msg string) {
	if err != nil {
		log.Fatal("error ", msg, ": ", err)
	}
}

func main() {
	tFlag := os.Getenv("TARGET_FLAG")
	if tFlag == "" {
		log.Fatal("missing env var: TARGET_FLAG")
	}
	listen := ":8000"
	if v := os.Getenv("LISTEN"); v != "" {
		listen = v
	}
	templateDir := "out/templates"
	if v := os.Getenv("TEMPLATE_DIR"); v != "" {
		templateDir = v
	}
	joelPass := "n0Clikkerz"
	if v := os.Getenv("JOEL_PASS"); v != "" {
		joelPass = v
	}

	templates, err := template.ParseGlob(templateDir + "/*.html")
	fatalIfError(err, "parsing templates")

	db, err := sql.Open("mysql", "ctfrw:dDIESeNBAARaMapY0kc3Q@unix(/var/run/mysqld/mysqld.sock)/ctf")
	fatalIfError(err, "opening database for writing")

	_, err = db.Exec("UPDATE users SET password = ? WHERE username = 'ellie'", tFlag)
	fatalIfError(err, "setting flag")
	fatalIfError(db.Close(), "closing DB")

	db, err = sql.Open("mysql", "ctfro:CB2fwpYY5c+KpT2FxzDmaA@unix(/var/run/mysqld/mysqld.sock)/ctf")
	fatalIfError(err, "reopening database")
	defer db.Close()

	srv := server{
		db:       db,
		tmpl:     templates,
		joelPass: joelPass,
	}
	mux := http.NewServeMux()
	mux.HandleFunc("/", srv.AuthWrap(func(w http.ResponseWriter, r *http.Request) {
		http.Redirect(w, r, "/expenses", http.StatusMovedPermanently)
	}))
	mux.HandleFunc("/expenses", srv.AuthWrap(srv.Expenses))
	mux.HandleFunc("/users", srv.AuthWrap(srv.Users))

	hSrv := &http.Server{
		Addr:         listen,
		Handler:      mux,
		ReadTimeout:  5 * time.Second,
		WriteTimeout: 10 * time.Second,
		IdleTimeout:  20 * time.Second,
	}

	log.Print("listening on ", listen)
	fatalIfError(hSrv.ListenAndServe(), "listening")
}

type server struct {
	db       *sql.DB
	tmpl     *template.Template
	joelPass string
}

// AuthWrap restricts calling the wrapped handler to authenticated requests
func (s server) AuthWrap(f func(http.ResponseWriter, *http.Request)) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		user, pass, ok := r.BasicAuth()
		if !ok || user != "joel" || pass != s.joelPass {
			w.Header().Set("WWW-Authenticate", "Basic realm=expenses")
			http.Error(w, "authentication required", http.StatusUnauthorized)
			return
		}
		f(w, r)
	}
}

// Expenses renders the expense table based on the database and user query. The
// SQL query is build using string concatenation and is thus vulnerable to
// injection.
func (s server) Expenses(w http.ResponseWriter, r *http.Request) {
	what := r.FormValue("what")
	ctx := r.Context()
	rows, err := s.db.QueryContext(ctx, "SELECT * FROM expenses WHERE what LIKE '%"+what+"%'")
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	v := [][]interface{}{}
	for rows.Next() {
		cols, err := rows.Columns()
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		rowVals := make([]interface{}, len(cols))
		for i := range rowVals {
			rowVals[i] = new(string)
		}
		if err := rows.Scan(rowVals...); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		v = append(v, rowVals)
	}
	w.Header().Set("Content-Type", "text/html")
	data := map[string]interface{}{
		"Rows": v,
	}
	if err := s.tmpl.ExecuteTemplate(w, "expenses.html", data); err != nil {
		log.Print("executing template: ", err)
	}
}

// Users renders a restricted users table of user data. It's using a
// parameterized statement and should be safe from SQLi. It's purpose is to
// both frustrate users by offering a false-path to SQLi and to aid users by
// providing information about the target table.
func (s server) Users(w http.ResponseWriter, r *http.Request) {
	what := r.FormValue("who")
	ctx := r.Context()
	rows, err := s.db.QueryContext(ctx, "SELECT username, '********', added FROM users WHERE username LIKE ?", "%"+what+"%")
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	v := [][]interface{}{}
	for rows.Next() {
		cols, err := rows.Columns()
		if err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		rowVals := make([]interface{}, len(cols))
		for i := range rowVals {
			rowVals[i] = new(string)
		}
		if err := rows.Scan(rowVals...); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		v = append(v, rowVals)
	}
	w.Header().Set("Content-Type", "text/html")
	data := map[string]interface{}{
		"Rows": v,
	}
	if err := s.tmpl.ExecuteTemplate(w, "users.html", data); err != nil {
		log.Print("executing template: ", err)
	}
}

func sendJSON(w http.ResponseWriter, v interface{}) {
	b, err := json.Marshal(v)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	w.Header().Set("Content-Type", "text/json")
	w.Write(b)
}
