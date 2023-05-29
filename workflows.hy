(import datetime [timedelta])
(import temporalio [workflow])

(with [x (workflow.unsafe.imports_passed_through)]
    (import activities [say_hello
                        verify_container
                        run_command]))

(defclass [workflow.defn]
  SayHello []
  (defn/a [workflow.run]
    run [self name]
    (await (workflow.execute_activity say_hello
                                      name
                                      :start_to_close_timeout (timedelta :seconds 5)))))

(defclass [workflow.defn]
    DockerContainerVerificationWorkflow []
    (defn/a [workflow.run]
    run [self image_name]
        (await (workflow.execute_activity verify_container
                                          image_name
                                          :start_to_close_timeout (timedelta :seconds 5)))))

(defclass [workflow.defn]
  CommandWorkflow []
  (defn/a [workflow.run]
    run [self command]
    (await (workflow.execute_activity run_command
                                      command
                                      :start_to_close_timeout (timedelta :seconds 5)))))