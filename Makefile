.PHONY: copy-data run clean

copy-data:
	mkdir .tmp
	cp * .tmp -R
	mv .tmp btcy-qa-tool-auto_fwk

run:
	python3 run.py -s project_bioflux_clinic_portal/test/auth/BF-AUTH.robot --env qa --browser chrome -e manual --headless

clean:
	cd ..
	rm -rf *
