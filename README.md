# Magazord Test

This test is divided into 4 files:

- **task_manager_package**: corresponds to task 1.
- **weather_package**: corresponds to task 2.
- **ecommerce_package**: corresponds to task 3.
- **example**: code execution and task 4.

## Architecture

The architecture is based on the **MVC** pattern, with one adaptation: instead of integrating directly into the **models**, a **service** was created to handle integration.

### State Management

The **Getx** package was used for state management.

### Dependency Injection

Instead of using **bindings** or another package for dependency injection, the instances were created in the **root** of each package, and in the **example**, injection was performed in the **`main`** by dependency on **`GetMaterialApp`**.

## Task Completion

- For **caching**, the **`get_storage`** package was used.
- For **external data sharing**, such as sharing on social media, the **`share_plus`** package was used.
- For **displaying weather data**, the **`OpenWeather`** API was used.

## How to Run the Code

To run the code, simply execute the following command in the terminal:

```bash
// When you open the terminal on root, run:
// cd example
// Then run the code below:

flutter run --dart-define=APPID=a0df73c6d1c42d8511f885d8e0200eb7
```

## Brief App Simulation
<video width="640" height="360" controls>
  <source src="https://drive.google.com/file/d/1o3V5NTb0Fn7wSwpm6zWjZvN3fvreEA5v/view?usp=sharing" type="video/mp4">
</video>

[Or follow the link](https://drive.google.com/file/d/1o3V5NTb0Fn7wSwpm6zWjZvN3fvreEA5v/view?usp=sharing)
