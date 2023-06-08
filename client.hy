(import sys)
(import asyncio)
(import workflows [SayHello DockerContainerVerificationWorkflow CommandWorkflow])
(import temporalio.client [Client])

(setv host "134.122.20.170:7233")
;(setv host "18.237.246.8:7233")

(defn/a main []
  (let [command (if (= 2 (len sys.argv))
                  (get sys.argv 1)
                  (raise (Exception "Only one argument needed for command")))
        client (await (Client.connect host))
        result (await (client.execute_workflow CommandWorkflow.run
                                               command
                                               :id "command-workflow"
                                               :task_queue "hello-task-queue"))]
    (print f"Result : {result}")))

(if (= __name__ "__main__")
    (asyncio.run (main))
    None)