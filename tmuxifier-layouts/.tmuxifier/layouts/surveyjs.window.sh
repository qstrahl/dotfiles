window_root "~/surveyjs"
new_window "surveyjs"
run_cmd "ls src/**/*.ts | entr -ps 'yarn run build_react_prod && cp -r packages/survey-react ~/kyc-ui/node_modules'"
