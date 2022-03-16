@echo "Stopping Docker container. This will take a moment..."
@FOR /f "tokens=*" %%i IN ('docker ps -a -q --filter "ancestor=replication-package"') DO docker stop %%i
@echo "...done."