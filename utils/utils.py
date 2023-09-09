import logging
import subprocess


def exectueScript(start_log, script_path):
    try:
        logging.info(start_log)
        # runScript = subprocess.check_output(
        #     [script_path], shell=True)
        subprocess.run(
            [script_path],
            shell=False,
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL
        )

        return True
    except Exception as ex:
        logging.error("Execture Script Faild !! Exception: " + str(ex))
        return False
