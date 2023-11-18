function tavern -d 'Start up SillyTavern'
  mux tavern \
    neww text-generation-webui ~/text-generation-webui ./start-linux.sh \
    neww silly-tavern ~/SillyTavern ./start.sh \
    splitw ~/SillyTavern/extras 'python server.py --enable-modules=chromadb'
end
