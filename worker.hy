(import asyncio)

(import temporalio [activity workflow])
(import temporalio.client [Client])
(import temporalio.worker [Worker])

(import activities [say_hello])
(import workflows [SayHello])

(defn/a main []
    (let [client (await (Client.connect "134.122.20.170:7233"
                                        :namespace "default"))
          worker (Worker client
                         :task_queue "hello-task-queue"
                         :workflows [SayHello]
                         :activities [say_hello])]
     (await (worker.run))))


(if (= __name__ "__main__")
    (asyncio.run (main))
    None)