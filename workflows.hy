(import datetime [timedelta])
(import temporalio [workflow])

(with [x (workflow.unsafe.imports_passed_through)]
    (import activities [say_hello]))

(defclass [workflow.defn]
  SayHello []
  (defn/a [workflow.run]
    run [self name]
    (await (workflow.execute_activity say_hello
                                      name
                                      :start_to_close_timeout (timedelta :seconds 5)))))

                                    