(import asyncio)

(import temporalio [activity workflow])
(import temporalio.client [Client])
(import temporalio.worker [Worker])

(import activities [say_hello verify_container])
(import workflows [SayHello DockerContainerVerificationWorkflow])

(setv host "134.122.20.170:7233")
(setv task_queue "hello-task-queue")

(defn/a main []
    (let [client (await (Client.connect host
                                        :namespace "default"))
          worker (Worker client
                         :task_queue task_queue
                         :workflows [SayHello DockerContainerVerificationWorkflow]
                         :activities [say_hello verify_container])]
     (print f"Worker listening to {task_queue}")
     (await (worker.run))))


(if (= __name__ "__main__")
    (asyncio.run (main))
    None)