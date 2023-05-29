(import asyncio)

(import dotenv [load_dotenv])
(import os)

(import temporalio [activity workflow])
(import temporalio.client [Client])
(import temporalio.worker [Worker])

(import activities [say_hello verify_container run_command])
(import workflows [SayHello DockerContainerVerificationWorkflow CommandWorkflow])

(load_dotenv)
;(setv host "134.122.20.170:7233")
(setv host (os.getenv "temporal_host"))
(setv task_queue "hello-task-queue")

(defn/a main []
  (let [client (await (Client.connect host
                                      :namespace "default"))
        worker (Worker client
                       :task_queue task_queue
                       :workflows [SayHello DockerContainerVerificationWorkflow CommandWorkflow]
                       :activities [say_hello verify_container run_command])]
    (print f"Worker listening to {task_queue}")
    (await (worker.run))))


(if (= __name__ "__main__")
  (asyncio.run (main))
  None)