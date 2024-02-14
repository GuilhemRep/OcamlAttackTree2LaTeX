all:
	ocamlc -c AT.mli
	ocamlc -c AT.ml
	ocamlc -c exemple.ml
	ocamlc -o exemple AT.cmo exemple.cmo

clean:
	rm -rf exemple *.cmi *.cmo *~
