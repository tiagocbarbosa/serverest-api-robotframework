# serverest-api-robotframework
The project is a test automation of the [ServeRest](https://serverest.dev/#/Usu%C3%A1rios/post_usuarios), a free REST API that simulates a virtual store and was developed to be used as a study of API tests.

The API automated tests uses [Robot Framework](https://robotframework.org/), [Requests Library](http://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html) and Python technologies.


## How to use
To use this automation, clone the project on your machine and open it on your favorite IDE.

he tests cases of the web application are located in the [/tests](https://github.com/tiagocbarbosa/serverest-api-robotframework/tree/main/tests) dir, and the keywords definitions are in the [/resources](https://github.com/tiagocbarbosa/serverest-api-robotframework/tree/main/resources).

To execute the automation, you can run the robot -d results/ tests/ command. The option -d results/ saves the evidences in the results/ dir; the tests/ option runs the test cases from the tests/ dir.

Other commands:

- `robot -d results/ tests/api_testing_usuario.robot` -> run the tests cases defined in the `api_testing_usuario.robot` file;
- `robot -d results/ -i CREATE tests/` -> run the test cases defined with the `CREATE` tag.

After you execute the automation, you can check the result of the tests on the `report.html` file that will be created in the `results/` dir.

## Technologies
- Robot Framework;
- RequestsLibrary;
- Python.

## References
[ServeRest](https://serverest.dev/)

[Robot Framework](https://robotframework.org/)

[Python requests.Response Object](https://www.w3schools.com/python/ref_requests_response.asp)