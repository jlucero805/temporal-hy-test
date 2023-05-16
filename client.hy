
(import asyncio)


(import workflows [SayHello])

(import temporalio.client [Client])

(defn/a main []
    (let [client (await (Client.connect "134.122.20.170:7233"))
          result (await (client.execute_workflow SayHello.run
                                                 "Temporal"
                                                 :id "hello-workflow"
                                                 :task_queue "hello-task-queue"))]
          
     (print f"Result: {result}")))

(if (= __name__ "__main__")
    (asyncio.run (main))
    None)