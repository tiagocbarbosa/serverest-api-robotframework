# serverest-api-robotframework
The project is a test automation of the [ServeRest](https://serverest.dev/#/Usu%C3%A1rios/post_usuarios), a free REST API that simulates a virtual store and was developed to be used as a study of API tests.

The API automated tests uses [Robot Framework](https://robotframework.org/), [Requests Library](http://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html) and Python technologies.

[//]: # (The ServeRest API has some endpoints to register, search and even delete information. The endpoints are:)

[//]: # ()
[//]: # (- /login;)

[//]: # (- /usuarios;)

[//]: # (- /products;)

[//]: # (- /carrinhos.)

## How to use
To use this project, clone it on your machine and open it on your favorite IDE.

In the [/tests](https://github.com/tiagocbarbosa/serverest-api-robotframework/tree/main/tests) dir you will find the Tests Scenarios of the API; in the [/resources](https://github.com/tiagocbarbosa/serverest-api-robotframework/tree/main/resources) you will find the scenarios' definition.

To execute the application, check if you have downloaded and configured Python, Robot Framework and the RequestsLibrary on your machine. To more information, check the [References](https://github.com/tiagocbarbosa/serverest-api-robotframework#References) section.

Open your favorite terminal and execute the command ``robot -d results/ tests/``, the output must be something similar to it:

{to do: add the output}

You can see the tests report by opening the file ``/results/report.html`` that will be created after the tests execution.

## Technologies
- Robot Framework;
- RequestsLibrary;
- Python.

## References
[ServeRest](https://serverest.dev/)

[Robot Framework](https://robotframework.org/)

[Python requests.Response Object](https://www.w3schools.com/python/ref_requests_response.asp)