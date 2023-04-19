# serverest-api-robotframework
The project is a test automation of the [ServeRest](https://serverest.dev/#/Usu%C3%A1rios/post_usuarios), a free REST API that simulates a virtual store and was developed to be used as a study of API tests.

The API automated tests uses [Robot Framework](https://robotframework.org/), [Requests Library](http://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html) and Python technologies.


## How to use
To use this project, clone it on your machine and open it on your favorite IDE.

In the [/tests](https://github.com/tiagocbarbosa/serverest-api-robotframework/tree/main/tests) dir you will find the Tests Scenarios of the API; in the [/resources](https://github.com/tiagocbarbosa/serverest-api-robotframework/tree/main/resources) you will find the scenarios' definition.

To execute the application, check if you have downloaded and configured Python, Robot Framework and the RequestsLibrary on your machine. To more information, check the [References](https://github.com/tiagocbarbosa/serverest-api-robotframework#References) section.

Open your favorite terminal and execute the command ``robot -d results/ tests/``, the output must be something similar to it:

`````shell
==============================================================================
Tests
==============================================================================
Tests.Api Testing Login
==============================================================================
Scenario 01: Login with a new user successfully                       | PASS |
------------------------------------------------------------------------------
Tests.Api Testing Login                                               | PASS |
1 test, 1 passed, 0 failed
==============================================================================
Tests.Api Testing Usuario
==============================================================================
Scenario 01: Register a new user successfully on ServeRest            | PASS |
------------------------------------------------------------------------------
Scenario 02: Register an existing email on ServeRest                  | PASS |
------------------------------------------------------------------------------
Scenario 03: Register and search successfully a new user on ServeRest | PASS |
------------------------------------------------------------------------------
Tests.Api Testing Usuario                                             | PASS |
3 tests, 3 passed, 0 failed
==============================================================================
Tests                                                                 | PASS |
4 tests, 4 passed, 0 failed
==============================================================================
Output:  C:\{dir}\serverest-api-robotframework\results\output.xml
Log:     C:\{dir}\serverest-api-robotframework\results\log.html
Report:  C:\{dir}\serverest-api-robotframework\results\report.html
`````

You can see the tests report by opening the file ``/results/report.html`` that will be created after the tests execution.

## Technologies
- Robot Framework;
- RequestsLibrary;
- Python.

## References
[ServeRest](https://serverest.dev/)

[Robot Framework](https://robotframework.org/)

[Python requests.Response Object](https://www.w3schools.com/python/ref_requests_response.asp)