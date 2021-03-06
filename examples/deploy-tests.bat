@echo off
echo Elmo vocabulary
curl.exe -X PUT -T ../vocabulary/elmo.ttl http://localhost:8890/sparql-graph-crud?graph-uri=http://bp4mc2.org/elmo/def
echo Empty graph
curl.exe -X PUT -T empty.ttl http://localhost:8890/sparql-graph-crud?graph-uri=http://localhost:8080/stage
cd tests
for %%y in (*.ttl) do (
	echo %%~ny
	curl.exe -X POST -T %%y http://localhost:8890/sparql-graph-crud?graph-uri=http://localhost:8080/stage
)
pause
